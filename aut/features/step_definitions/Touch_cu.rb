#Knowing Mantas
Then /^I touch UIWebView marked "(.*?)"$/ do |text|
touch("UIWebView marked:'#{text}'")
sleep(5)
end

#Issue select from screen
Then /^I touch Issue marked "(.*?)"$/ do |text|
  touch("view marked:'#{text}'", :offset => {:x => 50, :y => -50})
  sleep(8)
end

# CILIP
Then /^I touch element marked "(.*?)"$/ do |text|
  touch("view marked:'#{text}'", :offset => {:x => 50, :y => -50})
  sleep(8)
end

#drawer help, #drawer search, #drawer settings
Then /^I touch element "(.*?)"$/ do |text|
  touch("view marked:'#{text}'")
  sleep(5)
end

Then /^I touch search field$/ do
  touch("UITextFieldLabel marked:'Search'")
end

Then /^I touch "(.*?)" element$/ do |text|
  touch("* marked:'#{text}'")
  sleep(5)
end

Then /^I touch article "(.*?)"$/ do |text|
  touch("UIWebView css:'*' {textContent CONTAINS '#{text}'}", :offset => {:x => 50, :y => -50})
  sleep(5)
end

Then /^I touch web "(.*?)" element$/ do |text|
  touch("UIWebView css:'*' {textContent CONTAINS '#{text}'}")
  sleep(3)
end