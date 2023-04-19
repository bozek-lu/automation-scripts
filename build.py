#!/usr/bin/python
#################
# Created by Lu
# Date: 15.09.2015

import sys, getopt, os, threading, time, signal
from subprocess import call, Popen, PIPE

#### iOS Defines ####
IOS_SDK									= 'iphoneos'
IOS_TARGET								= 'Trgt'
IOS_PROJECT_NAME 						= 'Proj.xcodeproj'
IOS_BUILD_SCHEME						= 'Schme'
#location to copy files to build ith core app
IOS_CURRENT_BUILDING_FILES_DIRECTORY 	= './Current\ Building\ Files'
TEAM_IDS								= {
	'First'				: '8BSHMVTP63',
	'Second'			: '7CLDYEA9QA'
}
PRODUCT_BUNDLE_IDENTIFIERS				= {
    'First'                : 'com.bundle.1',
    'Second'               : 'com.bundle.2'

}
#####################


#### Common Defines ####
TEMP_DIR 								= './Temp'
HOCKEYAPP_TOKEN 						= 'token for upload'
########################

lb = None

def printp(p, tabs_count=2):
	for line in iter(p.stdout.readline, ''):
	    print '%s%s' % ('\t'*tabs_count, line)
	p.stdout.close()

def printe(p, tabs_count=2):
	for line in iter(p.stderr.readline, ''):
	    print '%s%s' % ('\t'*tabs_count, line)
	p.stderr.close()

def execute(command, verbose = True):
	p = Popen(command, shell=True, stdout=PIPE, stderr=PIPE)
	if verbose:
		printp(p)

def main(argv):
	APP_NAME 			= ''
	OUTPUT_FILE 		= ''
	DESTINATION_PATH 	= ''
	PLATFORM 			= ''
	HOCKEYAPP			= False
	APPSTORE			= False

	os.chdir(os.path.dirname(__file__))
	#Create Temporary files dir
	Popen("mkdir %s" % TEMP_DIR, shell=True, stdout=PIPE, stderr=PIPE)

	try:
		opts, args = getopt.getopt(argv,"ha:o:p:sr",["app=","outputfile=","platform=","store=","rink="])
	except getopt.GetoptError:
		print 'build.py -h'
		print 'build.py -a <appname> -o <outputfile> -p <platform> -s -r'
		sys.exit(2)

	for opt, arg in opts:
		if opt in ('-h', '--help'):
			print 'build.py \n\t -a or --app <application name>\
							\n\t -p or --platform <platform>\
							\n\t -o or --output <outputfil> (optional)\
							\n\t -s or --store (optional) send application to app store\
							\n\t -r or --rink (optional) will not send application to hockeyapp\n'
			sys.exit(2)
		elif opt in ('-a', '--app'):
			APP_NAME = arg
		elif opt in ('-o', '--outputfile'):
			DESTINATION_PATH = arg
		elif opt in ('-p', '--platform'):
			PLATFORM = arg
		elif opt in ('-s', '--store'):
			APPSTORE = True
		elif opt in ('-r', '--rink'):
			HOCKEYAPP = True

		if not DESTINATION_PATH:
			DESTINATION_PATH = './Apps/%s/Builds/' % APP_NAME

	if not PLATFORM:
		print "\n\nYou need to provide more arguments to build application\nUse -h or --help option for more information\n"
		exit(2)

	print '\n'
	print 'Building', APP_NAME, 'for', PLATFORM

	if PLATFORM == 'ios':
		ios_build(APP_NAME, DESTINATION_PATH, HOCKEYAPP, APPSTORE)

def ios_build(APP_NAME, DESTINATION_PATH, HOCKEYAPP, APPSTORE):
	APP_SOURCE_FILES_DIRECTORY = './Apps/%s/Sources' % APP_NAME
	APP_BUILDS_DIRECTORY = './Apps/%s/Builds' % APP_NAME

	print 'Building started'
	print '\nPreparing environment for build:'

	print '\t - Cleaning %s Reader builds directory' % (APP_NAME),
	execute('rm -r -v %s/*' % APP_BUILDS_DIRECTORY)
	print '\t\t > succeed'

	print '\t - Cleaning Temp directory',
	execute('rm -r -v %s' % TEMP_DIR)
	execute('mkdir %s' % TEMP_DIR)
	print '\t\t > succeed'

	print '\t - Cleaning `Current Building Files` directory',
	execute('rm -r -v %s/*' % IOS_CURRENT_BUILDING_FILES_DIRECTORY)
	execute('mkdir %s' % IOS_CURRENT_BUILDING_FILES_DIRECTORY)
	print '\t\t > succeed'

	print '\t - Copying build files of %s Reader:' % APP_NAME
	execute("cp -r -v %s/* %s" % (APP_SOURCE_FILES_DIRECTORY, IOS_CURRENT_BUILDING_FILES_DIRECTORY))

	print '\t - Creating %s Reader builds directories' % (APP_NAME),
	execute('mkdir -p -v %s/{Ad-Hoc,Production}' % APP_BUILDS_DIRECTORY)
	print '\t\t > succeed'

	print '\tRemoving derived data'
	execute('rm -rf ~/Library/Developer/Xcode/DerivedData')

	print '\tCleaning project'
	# cleancommand = 'xcodebuild clean -project %s -configuration Release -alltargets' % (IOS_PROJECT_NAME)
	cleancommand = 'xcodebuild -alltargets clean'
	execute(cleancommand)

	print '\tArchiving DrawerReader with %s building files' % APP_NAME
	archivecommand = 'xcodebuild archive -project %s -scheme %s -archivePath %s/Archive.xcarchive PRODUCT_BUNDLE_IDENTIFIER=%s' % (IOS_PROJECT_NAME, IOS_BUILD_SCHEME, TEMP_DIR, PRODUCT_BUNDLE_IDENTIFIERS[APP_NAME])
	print '%s' % archivecommand
	execute(archivecommand)

	#generate export plist files (It's needed in xcode 7 version; in earlier versions there was a bug. See http://stackoverflow.com/questions/29522191/how-to-generate-ipa-file-from-command-line-with-watchkit-app)
	generate_plist_files(APP_NAME)

	if APPSTORE:
		#Export archive for production
		print '\tExporting %s Reader for Appstore' % APP_NAME
		prodbuildcommand = 'xcodebuild -exportArchive	\
			-archivePath {0}/Archive.xcarchive 			\
			-exportPath {1}/Production					\
			-exportOptionsPlist {0}/appstore.plist		'.format(TEMP_DIR, APP_BUILDS_DIRECTORY)
		execute(prodbuildcommand)

	if HOCKEYAPP:
		#Export archive for Ad-Hoc
		print '\tExporting %s Reader for Ad-Hoc' % APP_NAME
		adhocbuildcommand = 'xcodebuild -exportArchive	\
			-archivePath {0}/Archive.xcarchive 			\
			-exportPath {1}/Ad-Hoc						\
			-exportOptionsPlist {0}/adhoc.plist			'.format(TEMP_DIR, APP_BUILDS_DIRECTORY)
		execute(adhocbuildcommand)
		upload_ios_app(APP_NAME, APP_BUILDS_DIRECTORY)

	return

def generate_plist_files(APP_NAME):
	plistPattern = '<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">\n<plist version="1.0">\n\t<dict>\n\t\t<key>teamID</key>\n\t\t<string>{0}</string>\n\t\t<key>method</key>\n\t\t<string>{1}</string>\n\t\t<key>uploadSymbols</key>\n\t\t<true/>\n\t</dict>\n</plist>'
	teamId = TEAM_IDS[APP_NAME]

	with open('%s/adhoc.plist' % (TEMP_DIR),'w') as f:
		content = plistPattern.format(teamId, 'ad-hoc')
		f.write(content)

	with open('%s/appstore.plist' % (TEMP_DIR),'w') as f:
		content = plistPattern.format(teamId, 'app-store')
		f.write(content)

	return

def upload_ios_app(APP_NAME, APP_BUILDS_DIRECTORY):
	uploadcommand = 'curl								\
		-F "status=1" 									\
		-F "notify=0" 									\
		-F "notes=Test app upload" 						\
		-F "notes_type=0" 								\
		-F "ipa=@%s/Ad-Hoc/%s.ipa" 						\
		-H "X-HockeyAppToken: %s" 						\
 		https://rink.hockeyapp.net/api/2/apps/upload' 	% (APP_BUILDS_DIRECTORY, 'app name', HOCKEYAPP_TOKEN)

	global lb

	print '> %s \r\n' % (uploadcommand)

	lb = LoadingBar('Uploading %s Reader to HockeyApp: ' % APP_NAME)
	lb.start()
	p = Popen(uploadcommand, shell=True, stdout=PIPE, stderr=PIPE)
	p.wait()
	lb.loaded()

	printp(p)
	return

class LoadingBar(threading.Thread):
	def __init__(self, loadingTitle):
		super(LoadingBar, self).__init__()
		self.loading = True
		self.loadingTitle = loadingTitle

	def loaded(self, verbose = True):
		self.loading = False
		if verbose:
			sys.stdout.flush()
			sys.stdout.write('\r%s [* Done! *]%s\n\n' % (self.loadingTitle, ' '*50))

	def run(self):
		i = 0

		while self.loading:
			count 			= 15
			str 			= list(' ' * count)
			str[i] 			= '*'
			str[count-i-1] 	= '*'
			i+=1
			if i>count-1: i = 0
			if self.loading:
				sys.stdout.write('\r%s [%s]' % (self.loadingTitle, ''.join(str)))
				sys.stdout.flush()
			time.sleep(0.04)


def onError():
	print 'Error occured!'
	return

if __name__ == "__main__":
	global lb
	main(sys.argv[1:])
	#lb.loaded(False)
