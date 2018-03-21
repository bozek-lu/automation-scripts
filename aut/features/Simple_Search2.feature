@SER2

Feature: Simple search test

Scenario: Simple search test

Given the app has launched
Then I check if login page exists and login
Then I check if burger button is present and press it
Then I check if element "drawer search" exists
Then I touch element "drawer search"
Then I enter text "Nato" in to search field
Then I will clear text in search field
