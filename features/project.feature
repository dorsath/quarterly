Feature: Project
  I want to be able to create and manage projects

  Scenario: Create a project
    Given I am logged in
    And I am at my dashboard
    When I fill in the project name
    And I click on "create project"
    Then I should have a new project

  Scenario: Delete project
    Given I am logged in
    And I have a project
    And I am at my dashboard
    When I click on the delete link of the project
    And I confirm
    Then the project should be deleted
