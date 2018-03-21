Then /^I enter constant text "([^\"]*)" to text field number (\d+)$/ do |texts,index|

    index = index.to_i
    screenshot_and_raise "Index should be positive (was: #{index})" if (index<=0)
    clearTextfield(index-1)
    enterDataToTextfieldNum(texts, index-1)
    sleep(STEP_PAUSE)
end

def enterDataToTextfieldNum(text, index)
  index = index.to_i
  text = text.to_s
  if index>=0
        sleep(0.2)
        touch("textField index:#{index}")
        sleep(0.4)
        await_keyboard
        sleep(0.2)
        keyboard_enter_text("#{text}")
        sleep(0.2)
        done
        sleep(0.3)
  end
end

def clearTextfield(index)
    index = index.to_i

    if query("textField index:#{index}",:text).first
      length=query("textField index:#{index}",:text).first.length
    else
      length=0
    end
    if (index>=0)&&(length>0)
        touch("textField index:#{index}")
        await_keyboard
      for i in 0..length-1
        keyboard_enter_char("Delete",false)
      end
    end
end
