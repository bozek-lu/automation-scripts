require 'calabash-cucumber/calabash_steps'

Then(/^the sections number should be (\d+)$/) do |arg1|
    query("DrawerMasterTreeHeader").count == arg1
end

Then(/^I swipe right hard$/) do
    swipe :right, :query => "*", :offset => {:x => 123, :y => 30}, :"swipe-delta" =>{:horizontal => {:dx=> 350, :dy=> 0} }
end

Given(/^I have entered "(.*?)" email address$/) do |text|
    
    qstr = "UIWebView css:'INPUT#login'"
    
    wait_for { !query(qstr).empty? }
    
    touch(qstr)
    wait_for_keyboard
    
    keyboard_enter_text text
end

Given(/^I have entered "(.*?)" password$/) do |text|
    
    qstr = "UIWebView css:'INPUT#password'"
    
    wait_for { !query(qstr).empty? }
    
    touch(qstr)
    wait_for_keyboard
    
    keyboard_enter_text text
end

Then(/^I agree to authorise it$/) do
    touch("UIWebView css:'INPUT#submit'")
end

Then(/^I custom swipe left$/) do
    swipe :left, :query => "UIWindow", :"swipe-delta" =>{:horizontal => {:dx=> query('UIWindow').first["rect"]["width"]/2, :dy=> 0 } }
end

Then(/^I custom swipe right$/) do
    swipe :right, :query => "UIWindow", :"swipe-delta" =>{:horizontal => {:dx=> query('UIWindow').first["rect"]["width"]/2, :dy=> 0 } }
end