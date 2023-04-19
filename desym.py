import getopt, sys
import json

arg_path = ""
arg_dsym = ""
offsets = []
    
def checkArgs(argv):
    arg_help = "{0} -d <dSYM path> -p <diagnostic file path>".format(argv[0])
    
    try:
        opts, args = getopt.getopt(argv[1:], "hi:d:p:", ["help", "dsym=", "path="])
    except getopt.GetoptError as err:
        print(err)
        print(arg_help)
        sys.exit(2)
    
    for opt, arg in opts:
        if opt in ("-h", "--help"):
            print(arg_help)  # print the help message
            sys.exit(2)
        elif opt in ("-d", "--dsym"):
            global arg_dsym
            arg_dsym = arg
        elif opt in ("-p", "--path"):
            global arg_path
            arg_path = arg

    print('dsym:', arg_dsym)
    print('path:', arg_path) 


def parseFile(filePath):
    with open(filePath,'r+') as fp:
        # read an store all lines into list
        lines = fp.readlines()
        if "-------" in lines[0]:
            # move file pointer to the beginning of a file
            fp.seek(0)
            fp.truncate()
            # lines[1:] from line 2 to last line
            fp.writelines(lines[1:])

    with open(filePath,'r+') as fp:
        data = json.load(fp)

    parseCallStacks(data["crashDiagnostics"][0]["callStackTree"]["callStacks"])


def parseCallStacks(callStacks):
    rootFrames = []
    for stack in callStacks:
        rootFrames.append(stack["callStackRootFrames"])

    extractFrames(rootFrames)


def extractFrames(rootFrames):
    singleFrames = []
    for frame in rootFrames:
        singleFrames.append(frame[0])

    for fr in singleFrames:
        offsets.append((fr["offsetIntoBinaryTextSegment"], fr["binaryName"]))
        getSubFrameOffsets(fr)


def getSubFrameOffsets(frame):
    if "subFrames" in frame:
        subFrames = frame["subFrames"]
        global offsets
        for fr in subFrames:
            offsets.append((fr["offsetIntoBinaryTextSegment"], fr["binaryName"]))
            getSubFrameOffsets(fr)


def run_bash_command(cmd: str):
    import subprocess

    process = subprocess.Popen(cmd.split(), stdout=subprocess.PIPE)
    output, error = process.communicate()
    if error:
        raise Exception(error)
    else:
        return output


def desymbolicate(offsets):
    for index, segment in enumerate(offsets):
        s1 = "atos -arch arm64e -o "
        s2 = " -l 0x1 "
        strHex = "0x%0.2X" % segment[0]
        indexStr = "Line: %s " % index
        output = run_bash_command(s1 + arg_dsym + s2 + strHex)
        print(indexStr + segment[1] + " " + str(output))



if __name__ == "__main__":
    checkArgs(sys.argv)
    parseFile(arg_path)
    desymbolicate(offsets)
