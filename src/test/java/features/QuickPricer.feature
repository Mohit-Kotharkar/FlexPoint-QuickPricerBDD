Feature: Quick Pricer Rate and Price Display
  As a user of the Quick Pricer
  I want to see the correct Rate and Price options based on the selected Program

  Scenario: Verify the respective Price and Rate options are displayed based on the selected Program
    Given I am on the Quick Pricer page
    When I select the program "NON-QM Expanded Doc"
    Then the respective rate and price options should be displayed for "NON-QM Expanded Doc"
