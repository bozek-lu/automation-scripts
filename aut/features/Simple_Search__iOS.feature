@SERCIL
  @CIL1
Feature: Simple search test for Cilip

Scenario: Simple search test for Cilip

Given the app has launched
Then I check if burger button is present and press it
Then I check if login page exists and login
Then I check if burger button is present and press it
Then I check if element "drawer search" exists
Then I touch element "drawer search"
Then I enter text "Nato" in to search field
Then I will clear text in search field
Then I wait for 10 seconds
Then I press search button on virtual keyboard
Then I touch "drawer settings" element
Then I touch "Logout" element
