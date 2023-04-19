Then /^I logout from app$/ do
  if element_exists("* marked:'drawer settings'") == true
      sleep(2)
      touch("* marked:'drawer settings'")
      sleep(2)
      touch("* marked:'Logout'")
      sleep(2)
      swipe :left, :query => "*", :offset => {:x => 180, :y => 60}, :"swipe-delta" => {:horizontal => {:dx=> 200, :dy=> 0} }
      sleep(5)

  elsif element_exists("* marked:'burger'") == true
      touch("* marked:'burger'")
      sleep(2)
      touch("* marked:'drawer settings'")
      sleep(2)
      touch("* marked:'Logout'")
      sleep(2)
      swipe :left, :query => "*", :offset => {:x => 180, :y => 60}, :"swipe-delta" => {:horizontal => {:dx=> 200, :dy=> 0} }
      sleep(5)

  else
      touch("* marked:'Logout'")
      sleep(2)

      swipe :left, :query => "*", :offset => {:x => 180, :y => 60}, :"swipe-delta" => {:horizontal => {:dx=> 200, :dy=> 0} }
      sleep(5)

  end
end
