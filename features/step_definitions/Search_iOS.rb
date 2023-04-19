Then /^I check if burger button is present and press it$/ do
  if element_exists("* marked:'burger'")
      touch("* marked:'burger'")
      sleep(5)
  else
    sleep(STEP_PAUSE)
  end
end

Then /^I enter text "(.*?)" in to search field$/ do |text|
  touch("UITextFieldLabel marked:'Search'")
  sleep(0.2)
  wait_for_keyboard()
  sleep(0.2)
  keyboard_enter_text text
  sleep(0.2)
  tap_keyboard_action_key
  sleep(2)

end

Then /^I will clear text in search field$/ do
  touch("UITextField")

  if element_exists("* marked:'Select All'")

    touch("* marked:'Select All'")

    wait_for_element_exists("* marked:'Cut'")

    touch("* marked:'Cut'")

    sleep(STEP_PAUSE)

  else
    touch("UITextField")
    sleep(1)

    wait_for_element_exists("* marked:'Select All'")

    touch("* marked:'Select All'")

    wait_for_element_exists("* marked:'Cut'")

    touch("* marked:'Cut'")

    sleep(STEP_PAUSE)
  end
end
