@DIVE

Feature: Simple Scenario for Dive publisher

Scenario: DIVE

  Given the app has launched
  # Then I logout from app
  Then I check if element "DIVELive" exists
  Then I check if element "burger" exists
  Then I check if article "A PLASTIC OCEAN" exists
  Then I touch article "A PLASTIC OCEAN"
  Then I check if element "DIVELive" exists
  Then I check if element "burger" exists
  Then I check if element "Font" exists
  Then I touch "Font" element
  Then I cu_scroll down
  Given I sw_custome right
  Given I custom_sw left
  Then I touch "DIVELive" element
  Then I check if element "DIVELive" exists
  Then I check if element "burger" exists
  Then I check if article "A PLASTIC OCEN" exists
  Then I touch "burger" element
  Then I check if element "DIVELive" exists
  Then I check if element "DIVE Issues" exists
  Then I check if element "DIVE Eco Feed" exists
  Then I check if element "DIVE Travel Feed" exists
  Then I check if element "DIVE Kit Feed" exists
  Then I check if element "DIVE Skills Feed" exists
  Then I check if element "DIVE Pixel Skills" exists
  Then I check if element "Destinations" exists
  Then I touch "DIVE Issues" element
  Then I check if element "May 2016" exists
  Then I touch "May 2016" element
  Then I check if element "burger" exists
  Then I check if element "May" exists
  Then I check if article "PHOTO OPPORTUNITY" exists
  Then I check if article "FLIGHTS TO SHARM:UPDATE" exists
  Then I touch article "PHOTO OPPORTUNITY"
  Then I check if element "burger" exists
  Then I check if element "May" exists
  Then I check if element "Font" exists
  Then I cu_scroll down
  Then I cu_scroll up
  Then I sw_custome right
  Then I cu_rotate "left"
  Then I custom_sw left
  Then I touch "burger" element
  Then I touch "DIVE Issues" element
