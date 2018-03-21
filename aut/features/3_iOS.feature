@CILIP
  @CIL1
Feature: Simple Scenario CILIP
  This is simple scenario for test CILIP.

Scenario: CILIP
Given the app has launched
Then I logout from app
Then I wait to see "My CILIP Update"
Then I check if element "burger" exists
Then I check if article "Better by the beach for CILIP Conference 2016" exists
Then I touch article "Better by the beach for CILIP Conference 2016"
Then I check if element "burger" exists
Then I wait to see "My CILIP Update"
Then I check if element "CILIP OPEN ACCESS" exists
Then I check if element "Font" exists
Then I check if element "Share" exists
Then I cu_scroll down
Given I custom_sw left
Then I touch "Font" element
Then I touch "Share" element
Then I check if element "Facebook" exists
Then I check if element "Twitter" exists
Then I check if element "Linkedln" exists
Then I check if element "Cancel" exists
Then I touch "Cancel" element
Then I touch "CILIP Open Access" element
Then I check if article "Better by the beach for CILIP Conference 2016" exists
Then I touch "My CILIP Update" element
Then I touch "burger" element
Then I check if element "My CILIP Update" exists
Then I check if element "CILIP Open Access" exists
Then I check if element "Manage My CILIP Update" exists
Then I check if element "Update" exists
Then I check if element "Journals" exists
Then I touch "CILIP Open Access" element
Then I touch "burger" element
Then I touch "Update" element
Then I check if element "April 2016" exists
Then I touch "April 2016" element
Then I check if login page exists and login
Then I check if element "Update" exists
Then I check if element "Apr" exists
Then I check if element "Font" exists
Then I check if element "Share" exists
Then I check if element "Browse" exists
Then I touch "Share" element
Then I check if element "Facebook" exists
Then I check if element "Twitter" exists
Then I check if element "Linkedln" exists
Then I check if element "Cancel" exists
Then I touch "Cancel" element
Then I touch "Browse" element
Then I check if element "burger" exists
Then I check if element "PageF" exists
Then I check if element "ArticleView" exists
Then I check if element "PDFPageView" exists
Then I touch "PageF" element
Then I touch "PageF" element
Given I custom_sw left
Then I check if element "PageB" exists
Then I touch "PageB" element
Then I touch "ArticleView" element
Then I cu_scroll down
Then I cu_scroll up
Given I sw_custome right
Then I touch "Journals" element
Given I custom_sw left
Then I check if element "NE Links" exists
Then I touch element marked "NE Links"
Then I check if element "burger" exists
Then I check if element "NE Links | Apr" exists
Then I check if article "Note from the editor" exists
Then I touch article "Note from the editor"
Then I logout from app
