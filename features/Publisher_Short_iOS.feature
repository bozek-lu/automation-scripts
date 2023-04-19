@PUBSI
  @IHS1
Feature: Simple Short Scenario
  This is simple short scenario to test it on any publisher.

Scenario: PUBS
  Given the app has launched
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
  Then I touch the "drawer settings" button
  Then I touch the "Logout" button
