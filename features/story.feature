Feature: Story Tests

  Background:
    Given I am logged in
    And I have a project

  Scenario: Add a story to a project
    Given I am looking at the project
    When I fill in the story name
    And I submit the story
    Then the project should have a story

  @wip
  Scenario: Start a new story
    Given my project is linked to a github repository
    And I have a new story with a couple of scenarios
    When I start the story
    Then the story should be assigned to me
    And the story should be started
    And my github repository should have a new branch with the new feature added
    And my github repository should have a pull-request with the story description
