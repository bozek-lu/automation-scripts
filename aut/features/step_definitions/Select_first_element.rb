Then /^I select first element$/ do
  if element_exists("UIBrandingLabel index:1") != true
    sleep(STEP_PAUSE)
  else
  touch("UIBrandingLabel index:1", :offset => {:x => 50, :y => -50})
  end
end
