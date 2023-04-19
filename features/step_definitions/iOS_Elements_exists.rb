#Knowing Mantas
Then /^I check if UIWebView marked "(.*?)" exists$/ do |text|
element_exists("UIWebView marked:'#{text}'")
  sleep(3)
end

#PageF ,#ArticleView, #burger, #drawer help, #drawer settings, #drawer help
Then /^I check if element "(.*?)" exists$/ do |text|
  element_exists("* marked:'#{text}'")
  sleep(3)
end

Then /^I check if ArticleView exists$/ do
  element_exists("* marked:'ArticleView'")
  slee(3)
end

Then /^I check if burger exists$/ do
  element_exists("* marked:'burger'")
  sleep(3)
end

Then /^I check if article "(.*?)" exists$/ do |text|
  element_exists("UIWebView css:'*' {textContent CONTAINS '#{text}'}")
  sleep(5)
end

Then /^I check if web element "(.*?)" exists$/ do |text|
  element_exists("UIWebView css:'*' {textContent CONTAINS '#{text}'}")
  sleep(3)
end
