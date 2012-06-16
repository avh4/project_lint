Feature: Remove jbehave

Scenario: Java project with jbehave

	Given a java project using jbehave
	When I run project_lint
	Then I will be told "+ Migrate from jbehave to cucumber-jvm"

Scenario: Java project with cucumber-jvm

	Given a java project using cucumber-jvm
	When I run project_lint
	Then I will not see any messages about jbehave
