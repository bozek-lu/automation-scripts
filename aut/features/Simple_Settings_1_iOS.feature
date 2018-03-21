@SETCIL
  @CIL1
Feature: Simple settings test

Scenario: Simple settings test
  Given the app has launched
  Then I check if burger button is present and press it
  Then I check if login page exists and login
  Then I touch the "drawer settings" button
  Then I check if element "Settings" exists
  Then I check if element "Done" exists
  Then I check if element "Downloaded issues" exists
  Then I check if element "when using WiFi" exists
  Then I check if element "wifiSwitch" exists
  Then I check if element "when using Cellular Data" exists
  Then I check if element "cellularSwitch" exists
  Then I check if element "Check for content" exists
  Then I check if element "Check Now" exists
  Then I check if element "Cached issues" exists
  Then I check if element "Clear Cache" exists
  Then I check if element "Your account" exists
  Then I check if element "Login to your magazines" exists
  Then I check if element "Login" exists
  Then I check if element "Logout from your account on this device" exists
  Then I check if element "Logout" exists
  Then I check if element "App Support" exists
  Then I check if element "Email support: UpdateApp@cilip.org.uk" exists
  Then I check if element "Contact" exists
  Then I touch element "wifiSwitch"
  Then I touch element "cellularSwitch"
  Then I touch element "Clear Cache"
  Then I touch element "Logout"
  Then I touch the "drawer settings" button
  Then I touch element "Login"
  Then I check if login page exists and login
  Then I touch the "drawer settings" button
  Then I touch element "Clear Cache"
  Then I touch element "Logout"
  Then I touch the "drawer settings" button
  Then I touch element "UpdateApp@cilip.org.uk"
