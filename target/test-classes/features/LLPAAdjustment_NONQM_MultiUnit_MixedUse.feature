Feature: FICO/LTV Loan Level Price Adjustments (LLPA) : CES NOO - NON-QM Multi-Unit & Mixed Use
  As a user of the Quick Pricer
  I want to verify that the correct FICO/LTV LLPA adjustments are displayed

  Scenario Outline: Verify LLPA adjustment for FICO and LTV - NON-QM Multi-Unit & Mixed Use
    Given I am on the Quick Pricer page
    Then I wait for 3 seconds
    When I select the program "NON-QM Multi-Unit & Mixed Use"
    Then I wait for 5 seconds
    # Then I select the Income Doc Type "<DocType>"
    # Then I select the Loan Term "30 Years"
    # Then I select the Purpose "Purchase"
    # Then I select the State "California (CA)"
    # Then I select the Citizenship "US Citizen"
    # Then I select the Property Type "Condo"
    # Then I select the # of Properties "1"
    # Then I select the # of Units "1"
    When I set FICO score to "<FICO>"
    And I set LTV to "<LTV>"
    Then I wait for 3 seconds
    Then the LLPA adjustment should have "<FICORange>" "<LTVRange>" "<Adjustment>"

    Examples:
      | FICORange   | LTVRange   | FICO | LTV | Adjustment    |
      | 760+        | 0-50       | 770  | 50  | +1.250       |
      | 760+        | 50.01-55   | 770  | 55  | +1.000       |
      | 760+        | 55.01-60   | 770  | 60  | +0.750       |
      | 760+        | 60.01-65   | 770  | 65  | +0.375       |
      | 760+        | 65.01-70   | 770  | 70  | +0.125       |
      | 760+        | 70.01-75   | 770  | 75  | -0.250       |
      | 740 - 759   | 0-50       | 750  | 50  | +1.125       |
      | 740 - 759   | 50.01-55   | 750  | 55  | +0.875       |
      | 740 - 759   | 55.01-60   | 750  | 60  | +0.500       |
      | 740 - 759   | 60.01-65   | 750  | 65  | +0.250       |
      | 740 - 759   | 65.01-70   | 750  | 70  | -0.125       |
      | 740 - 759   | 70.01-75   | 750  | 75  | -0.625       |
      | 720 - 739   | 0-50       | 730  | 50  | +0.625       |
      | 720 - 739   | 50.01-55   | 730  | 55  | +0.375       |
      | 720 - 739   | 55.01-60   | 730  | 60  | +0.250       |
      | 720 - 739   | 60.01-65   | 730  | 65  | 0.000        |
      | 720 - 739   | 65.01-70   | 730  | 70  | -0.375       |
      | 720 - 739   | 70.01-75   | 730  | 75  | -1.000       |
      | 700 - 719   | 0-50       | 710  | 50  | 0.000        |
      | 700 - 719   | 50.01-55   | 710  | 55  | -0.250       |
      | 700 - 719   | 55.01-60   | 710  | 60  | -0.375       |
      | 700 - 719   | 60.01-65   | 710  | 65  | -0.625       |
      | 700 - 719   | 65.01-70   | 710  | 70  | -1.000       |
      | 700 - 719   | 70.01-75   | 710  | 75  | -1.625       |