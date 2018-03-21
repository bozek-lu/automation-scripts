Given /^I custom_sw left$/ do
    swipe :left, :query => "*", :offset => {:x => 180, :y => 60}, :"swipe-delta" => {:horizontal => {:dx=> 200, :dy=> 0} }
    sleep(5)
end

Given /^I custom_sww left$/ do
    swipe :left, :query => "*", :offset => {:x => 180, :y => 60}, :"swipe-delta" => {:horizontal => {:dx=> 350, :dy=> 0} }
    sleep(5)
end
