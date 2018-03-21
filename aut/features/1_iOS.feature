@IHS
  @IHS1
Feature: Simple Scenario IHS
  This is simple scenario for test IHS.

Scenario: IHS-1
  Given the app has launched
  Then I logout from app
  Then I check if login page exists and login
  Then I wait to see "All"
  Then I wait to see "Defence Weekly"
  Then I wait to see "Intl. Defence Review"
  Then I wait to see "Navy Intl."
  Then I wait to see "Intelligence Review"
  Then I check if element "drawer help" exists
  Then I check if element "drawer settings" exists
  Then I check if element "drawer search," exists
  Given I custom_sw left
  Then I check if element "burger" exists
  Then I check if element "JDW 8 June 2016" exists
  Then I touch Issue marked "JDW 8 June 2016"
  Then I check if login page exists and login
  Then I rotate device left
  Then I check if element "burger" exists
  Then I check if element "JDW 8 June 2016" exists
  Then I check if element "All" exists
  Then I check if element "Font" exists
  Then I check if element "Browse" exists
  Then I touch the "Font" button
  Given I custom_sww left
  Then I check if element "burger" exists
  Then I check if element "JIDR Jun" exists
  Then I check if element "All" exists
  Then I check if element "Jun" exists
  Then I check if element "Browse" exists
  Then I cu_scroll down
  Then I touch the "Browse" button
  Then I check if element "burger" exists
  Then I check if element "PageF" exists
  Then I check if element "ArticleView" exists
  Given I custom_sww left
  Then I rotate device right
  Then I check if element "burger" exists
  Then I check if element "PageF" exists
  Then I check if element "ArticleView" exists
  Then I check if element "PageB" exists
  Then I touch the "PageF" button
  Then I touch the "PageB" button
  Then I touch the "ArticleView" button
  Then I touch the "All" button
  Then I touch the "burger" button
  Then I touch element "Defence Weekly"
  Then I logout from app
