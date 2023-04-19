@PUBSCIL
  @CIL1
Feature: Simple Short Scenario
  This is simple short scenario for CILIP publisher.

Scenario: PUBSCIL
  Given the app has launched
  Then I check if burger button is present and press it
  Then I check if login page exists and login
  Given I custom_sw left
  Then I check if element "burger" exists
  Then I rotate device left
  Then I check if element "burger" exists
  Then I select first element
  Then I check if login page exists and login
  Given I custom_sww left
  Then I check if element "burger" exists
  Then I cu_scroll down
  Then I rotate device right
  Then I check if element "burger" exists
  Then I touch the "burger" button
  Then I wait for 5 seconds
  Then I touch element "drawer settings"
  Then I touch element "Logout"
