Then /^I always set app to be logout$/ do
    if element_exists("* marked:'burger'")
        touch("* marked:'burger'")
        sleep(5)
    else
        swipe :right, :query => "*", :offset => {:x => 0, :y => 60}, :"swipe-delta" => {:horizontal => {:dx=> 150, :dy=> 0} }
    end
      wait_for_element_exists("* marked:'drawer settings'")
      touch("* marked:'drawer settings'")
      sleep(2)
      touch("* marked:'logout'")
end
