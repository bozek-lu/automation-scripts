@Acc
Feature: Simple Acc

Scenario: Simple Acc for App
  Given the app has launched
  Given I have entered "abc" email address
  Given I have entered "abc" password
  Then I agree to authorise it
  Then I should see "DIVELive"
  Then I should see a cu_burger
  Then I wait for the view with id "drawer_content" to appear
  Then I touch a cu_drawer_content
  Then I wait for 5 seconds
  Then I wait for the view with id "drawer_content" to appear
  Then I should see a cu_font_size
  Then I swipe right
  Then I touch a cu_font_size
  Then I scroll down
  Then I swipe left
