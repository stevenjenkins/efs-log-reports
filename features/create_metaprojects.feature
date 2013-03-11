Feature: Creating metaprojects
	In order to have projects to assign projects to
	As a user
	I want to create them easily

	Scenario: Creating a metaproject
	Given I am on the Metaprojects page
	When I follow "New Metaproject"
	And I fill in "Name" with "sample"
	And I press "Create Metaproject"
	Then I should see "Project has been created"


