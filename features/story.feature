Feature: Story Tests

  Background:
    Given I am logged in
    And I have a project

  Scenario: Add a story to a project
    Given I am looking at the project
    When I fill in the story name
    And I submit the story
    Then the project should have a story
