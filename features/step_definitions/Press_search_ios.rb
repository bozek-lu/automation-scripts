Then /^I press search button on virtual keyboard$/ do
  if element_exists("UIKeyboard") == true
      tap_keyboard_action_key
  else
    sleep(STEP_PAUSE)
  end

end
