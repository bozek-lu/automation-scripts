Given /^I cu_rotate "(.*?)"$/ do |text|
    uia_rotate("'#{text}'")
    sleep(3)
end
