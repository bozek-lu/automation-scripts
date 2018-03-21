@Acc2
Feature: Simple Acc 2

Scenario: Simple Acc for App 2
  Given the app has launched
  Given I have entered "abc" email address
  Given I have entered "abc" password
  Then I agree to authorise it
  Then I wait for the "burger" button to appear
  Then I press the "burger" button
  Then I touch "Divetestlive"
  Then I wait to see "Issues"
  Then I touch "Issues"
  Given I cu_rotate left
  Then I wait for 2 seconds
  Then I touch "tes2_TES___19_February_2016"
  Then I wait for 6 seconds
  Then I check if element marked "burger" exists
  Then I check if element marked "PageF" exists
  Then I check if element marked "ArticleView" exists
  Given I custom_sw left
  Then I wait for 3 seconds
