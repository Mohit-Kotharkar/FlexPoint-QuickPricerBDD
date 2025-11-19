Feature: FICO/LTV Loan Level Price Adjustments (LLPA)
  As a user of the Quick Pricer
  I want to verify that the correct FICO/LTV LLPA adjustments are displayed

  Scenario Outline: Verify LLPA adjustment for FICO and LTV
    Given I am on the Quick Pricer page
    When I select the program "NON-QM Expanded Doc"
    Then I wait for 10 seconds
    Then I select the Income Doc Type "24 Month Bank Statement"
    Then I select the Loan Term "30 Years"
    Then I select the Purpose "Refinance Cash Out"
    Then I select the State "California (CA)"
    Then I select the Citizenship "US Citizen"
    Then I select the Property Type "Condoo"
    Then I select the # of Properties "1"
    Then I select the # of Units "1"
    # And I see the text for FICO
    # And I print the entire page HTML
    When I set FICO score to "<FICO>"
    And I set LTV to "<LTV>"
    Then I wait for 5 seconds
    Then the LLPA adjustment should be "<Adjustment>"
    Then I wait for 15 seconds

    Examples:
      | FICO | LTV | Adjustment |
      |  770 |  70 |        +1.125 |
      # |  731 |  79 |        +1.500 |
      # |  701 |  99 |        +1.500 |
   
