Then /^I cu_scroll down$/ do
  scroll("UIView", :down)
  sleep(5)
end

Then /^I cu_scroll up$/ do
  scroll("UIView", :up)
  sleep(5)
end
