@Acc
Feature: Simple Acc

Scenario: Simple Acc for App
  Given the app has launched
  Given I have entered "abc" email address
  Given I have entered "abc" password
  Then I agree to authorise it
  Then I wait for the "burger" button to appear
  Then I wait for the "Divetestlive" button to appear
  Then I wait for the "DIVELive" button to appear
  Given I cu_scroll down
  Then I check if UIWebView marked "Knowing Mantas" exists
  Then I wait for 3 seconds
  Then I touch UIWebView marked "KNOWING MANTAS"
  Given I cu_scroll down
  Then I press the "burger" button
  Then I press the "drawer settings" button
  Then I press the "Logout" button
