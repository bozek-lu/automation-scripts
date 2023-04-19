Given /^I sw_custome right$/ do
    swipe :right, :query => "*", :offset => {:x => -180, :y => 60}, :"swipe-delta" => {:horizontal => {:dx=> 200, :dy=> 0} }
    sleep(5)
end

Given /^I sww_custome right$/ do
    swipe :right, :query => "*", :offset => {:x => -180, :y => 60}, :"swipe-delta" => {:horizontal => {:dx=> 330, :dy=> 0} }
    sleep(5)
end
