Feature: FICO/LTV Loan Level Price Adjustments (LLPA) : CES NOO - NON-QM DSCR
  As a user of the Quick Pricer
  I want to verify that the correct FICO/LTV LLPA adjustments are displayed

  Scenario Outline: Verify LLPA adjustment for FICO and LTV - NON-QM DSCR
    Given I am on the Quick Pricer page
    Then I wait for 3 seconds
    When I select the program "NON-QM DSCR"
    Then I wait for 5 seconds
    # Then I select the Income Doc Type "24 mo BS"
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
      | FICORange | LTVRange | FICO | LTV | Adjustment   |
      |      760+ |     0-50 |  770 |  50 |       +1.750 |
      |      760+ | 50.01-55 |  770 |  55 |       +1.625 |
      |      760+ | 55.01-60 |  770 |  60 |       +1.500 |
      |      760+ | 60.01-65 |  770 |  65 |       +1.250 |
      |      760+ | 65.01-70 |  770 |  70 |       +1.000 |
      |      760+ | 70.01-75 |  770 |  75 |       +0.500 |
      |      760+ | 75.01-80 |  770 |  80 |       -0.250 |
      |      760+ | 80.01-85 |  770 |  85 |       -3.875 |
      | 740 - 759 |     0-50 |  750 |  50 |       +1.625 |
      | 740 - 759 | 50.01-55 |  750 |  55 |       +1.500 |
      | 740 - 759 | 55.01-60 |  750 |  60 |       +1.375 |
      | 740 - 759 | 60.01-65 |  750 |  65 |       +1.000 |
      | 740 - 759 | 65.01-70 |  750 |  70 |       +0.875 |
      | 740 - 759 | 70.01-75 |  750 |  75 |       +0.375 |
      | 740 - 759 | 75.01-80 |  750 |  80 |       -0.500 |
      | 740 - 759 | 80.01-85 |  750 |  85 |       -4.375 |
      | 720 - 739 |     0-50 |  730 |  50 |       +1.500 |
      | 720 - 739 | 50.01-55 |  730 |  55 |       +1.375 |
      | 720 - 739 | 55.01-60 |  730 |  60 |       +1.000 |
      | 720 - 739 | 60.01-65 |  730 |  65 |       +0.875 |
      | 720 - 739 | 65.01-70 |  730 |  70 |       +0.500 |
      | 720 - 739 | 70.01-75 |  730 |  75 |       -0.125 |
      | 720 - 739 | 75.01-80 |  730 |  80 |       -0.750 |
      | 720 - 739 | 80.01-85 |  730 |  85 | Not Eligible |
      | 700 - 719 |     0-50 |  710 |  50 |       +1.375 |
      | 700 - 719 | 50.01-55 |  710 |  55 |       +1.000 |
      | 700 - 719 | 55.01-60 |  710 |  60 |       +0.750 |
      | 700 - 719 | 60.01-65 |  710 |  65 |       +0.500 |
      | 700 - 719 | 65.01-70 |  710 |  70 |       +0.125 |
      | 700 - 719 | 70.01-75 |  710 |  75 |       -0.625 |
      | 700 - 719 | 75.01-80 |  710 |  80 |       -2.125 |
      | 700 - 719 | 80.01-85 |  710 |  85 | Not Eligible |
      | 680 - 699 |     0-50 |  690 |  50 |       +1.000 |
      | 680 - 699 | 50.01-55 |  690 |  55 |       +0.750 |
      | 680 - 699 | 55.01-60 |  690 |  60 |       +0.250 |
      | 680 - 699 | 60.01-65 |  690 |  65 |       -0.250 |
      | 680 - 699 | 65.01-70 |  690 |  70 |       -0.750 |
      | 680 - 699 | 70.01-75 |  690 |  75 |       -1.375 |
      | 680 - 699 | 75.01-80 |  690 |  80 | Not Eligible |
      | 680 - 699 | 80.01-85 |  690 |  85 | Not Eligible |
      | 660 - 679 |     0-50 |  670 |  50 |       +0.250 |
      | 660 - 679 | 50.01-55 |  670 |  55 |        0.000 |
      | 660 - 679 | 55.01-60 |  670 |  60 |       -0.250 |
      | 660 - 679 | 60.01-65 |  670 |  65 |       -1.000 |
      | 660 - 679 | 65.01-70 |  670 |  70 |       -1.500 |
      | 660 - 679 | 70.01-75 |  670 |  75 |       -3.625 |
      | 660 - 679 | 75.01-80 |  670 |  80 | Not Eligible |
      | 660 - 679 | 80.01-85 |  670 |  85 | Not Eligible |
      | 640 - 659 |     0-50 |  650 |  50 |       -2.500 |
      | 640 - 659 | 50.01-55 |  650 |  55 |       -2.500 |
      | 640 - 659 | 55.01-60 |  650 |  60 |       -3.000 |
      | 640 - 659 | 60.01-65 |  650 |  65 |       -3.500 |
      | 640 - 659 | 65.01-70 |  650 |  70 |       -4.000 |
      | 640 - 659 | 70.01-75 |  650 |  75 |       -4.625 |
      | 640 - 659 | 75.01-80 |  650 |  80 | Not Eligible |
      | 640 - 659 | 80.01-85 |  650 |  85 | Not Eligible |

  Scenario Outline: Verify LLPA adjustment for DSCR Ratio and LTV - NON-QM DSCR
    Given I am on the Quick Pricer page
    Then I wait for 3 seconds
    When I select the program "NON-QM DSCR"
    Then I wait for 5 seconds
    Then I select the DSCR Ratio "<DSCRRatio>"
    And I set LTV to "<LTV>"
    Then I wait for 3 seconds
    Then the LLPA adjustment should have "<DSCRRatio>" "" "<Adjustment>"

    Examples:
      | DSCRRatio              | LTVRange    | LTV | Adjustment   |
      | No Ratio (DSCR < 0.75) | <= 50%      |  50 |       -1.500 |
      | No Ratio (DSCR < 0.75) | 50.01 - 55% |  55 |       -1.500 |
      | No Ratio (DSCR < 0.75) | 55.01 - 60% |  60 |       -1.500 |
      | No Ratio (DSCR < 0.75) | 60.01 - 65% |  65 |       -2.000 |
      | No Ratio (DSCR < 0.75) | 65.01 - 70% |  70 |       -2.000 |
      | No Ratio (DSCR < 0.75) | 70.01 - 75% |  75 |       -2.000 |
      | No Ratio (DSCR < 0.75) | 75.01 - 80% |  80 | Not Eligible |
      | No Ratio (DSCR < 0.75) | 80.01 - 85% |  85 | Not Eligible |
      | DSCR 0.75 - 0.99       | <= 50%      |  50 |       -0.500 |
      | DSCR 0.75 - 0.99       | 50.01 - 55% |  55 |       -0.500 |
      | DSCR 0.75 - 0.99       | 55.01 - 60% |  60 |       -0.500 |
      | DSCR 0.75 - 0.99       | 60.01 - 65% |  65 |       -0.500 |
      | DSCR 0.75 - 0.99       | 65.01 - 70% |  70 |       -0.500 |
      | DSCR 0.75 - 0.99       | 70.01 - 75% |  75 |       -0.500 |
      | DSCR 0.75 - 0.99       | 75.01 - 80% |  80 | Not Eligible |
      | DSCR 0.75 - 0.99       | 80.01 - 85% |  85 | Not Eligible |
      | DSCR 1.00 - 1.24       | <= 50%      |  50 |        0.000 |
      | DSCR 1.00 - 1.24       | 50.01 - 55% |  55 |        0.000 |
      | DSCR 1.00 - 1.24       | 55.01 - 60% |  60 |        0.000 |
      | DSCR 1.00 - 1.24       | 60.01 - 65% |  65 |        0.000 |
      | DSCR 1.00 - 1.24       | 65.01 - 70% |  70 |        0.000 |
      | DSCR 1.00 - 1.24       | 70.01 - 75% |  75 |        0.000 |
      | DSCR 1.00 - 1.24       | 75.01 - 80% |  80 |        0.000 |
      | DSCR 1.00 - 1.24       | 80.01 - 85% |  85 | Not Eligible |
      | DSCR => 1.25           | <= 50%      |  50 |       +0.500 |
      | DSCR => 1.25           | 50.01 - 55% |  55 |       +0.500 |
      | DSCR => 1.25           | 55.01 - 60% |  60 |       +0.500 |
      | DSCR => 1.25           | 60.01 - 65% |  65 |       +0.500 |
      | DSCR => 1.25           | 65.01 - 70% |  70 |       +0.375 |
      | DSCR => 1.25           | 70.01 - 75% |  75 |       +0.250 |
      | DSCR => 1.25           | 75.01 - 80% |  80 |       +0.125 |
      | DSCR => 1.25           | 80.01 - 85% |  85 |        0.000 |

  Scenario Outline: Verify LLPA adjustment for Loan Purpose and LTV - NON-QM DSCR
    Given I am on the Quick Pricer page
    Then I wait for 3 seconds
    When I select the program "NON-QM DSCR"
    Then I wait for 5 seconds
    Then I select the Purpose "<LoanPurpose>"
    And I set LTV to "<LTV>"
    Then I wait for 3 seconds
    Then the LLPA adjustment should have "<LoanPurpose>" "" "<Adjustment>"

    Examples:
      | LoanPurpose                | LTVRange    | LTV | Adjustment   |
      | Purchase                   | <= 50%      |  50 |        0.000 |
      | Purchase                   | 50.01 - 55% |  55 |        0.000 |
      | Purchase                   | 55.01 - 60% |  60 |        0.000 |
      | Purchase                   | 60.01 - 65% |  65 |        0.000 |
      | Purchase                   | 65.01 - 70% |  70 |        0.000 |
      | Purchase                   | 70.01 - 75% |  75 |        0.000 |
      | Purchase                   | 75.01 - 80% |  80 |        0.000 |
      | Purchase                   | 80.01 - 85% |  85 |        0.000 |
      | Refinance R/T              | <= 50%      |  50 |        0.000 |
      | Refinance R/T              | 50.01 - 55% |  55 |        0.000 |
      | Refinance R/T              | 55.01 - 60% |  60 |        0.000 |
      | Refinance R/T              | 60.01 - 65% |  65 |        0.000 |
      | Refinance R/T              | 65.01 - 70% |  70 |        0.000 |
      | Refinance R/T              | 70.01 - 75% |  75 |        0.000 |
      | Refinance R/T              | 75.01 - 80% |  80 |        0.000 |
      | Refinance R/T              | 80.01 - 85% |  85 |        0.000 |
      | Refinance C/O & FICO >=700 | <= 50%      |  50 |       -0.625 |
      | Refinance C/O & FICO >=700 | 50.01 - 55% |  55 |       -0.625 |
      | Refinance C/O & FICO >=700 | 55.01 - 60% |  60 |       -0.625 |
      | Refinance C/O & FICO >=700 | 60.01 - 65% |  65 |       -0.625 |
      | Refinance C/O & FICO >=700 | 65.01 - 70% |  70 |       -0.750 |
      | Refinance C/O & FICO >=700 | 70.01 - 75% |  75 |       -1.125 |
      | Refinance C/O & FICO >=700 | 75.01 - 80% |  80 | Not Eligible |
      | Refinance C/O & FICO >=700 | 80.01 - 85% |  85 | Not Eligible |
      | Refinance C/O & FICO < 700 | <= 50%      |  50 |       -0.750 |
      | Refinance C/O & FICO < 700 | 50.01 - 55% |  55 |       -0.750 |
      | Refinance C/O & FICO < 700 | 55.01 - 60% |  60 |       -0.750 |
      | Refinance C/O & FICO < 700 | 60.01 - 65% |  65 |       -0.750 |
      | Refinance C/O & FICO < 700 | 65.01 - 70% |  70 |       -1.000 |
      | Refinance C/O & FICO < 700 | 70.01 - 75% |  75 | Not Eligible |
      | Refinance C/O & FICO < 700 | 75.01 - 80% |  80 | Not Eligible |
      | Refinance C/O & FICO < 700 | 80.01 - 85% |  85 | Not Eligible |

  Scenario Outline: Verify LLPA adjustment for Property Type and LTV - NON-QM DSCR
    Given I am on the Quick Pricer page
    Then I wait for 3 seconds
    When I select the program "NON-QM DSCR"
    Then I wait for 5 seconds
    Then I select the Property Type "<PropertyType>"
    And I set LTV to "<LTV>"
    Then I wait for 3 seconds
    Then the LLPA adjustment should have "<PropertyType>" "" "<Adjustment>"

    Examples:
      | PropertyType           | LTVRange      | LTV | Adjustment   |
      | SFR                    | <= 50%        |  50 |        0.000 |
      | SFR                    | 50.01 - 55%   |  55 |        0.000 |
      | SFR                    | 55.01 - 60%   |  60 |        0.000 |
      | SFR                    | 60.01 - 65%   |  65 |        0.000 |
      | SFR                    | 65.01 - 70%   |  70 |        0.000 |
      | SFR                    | 70.01 - 75%   |  75 |        0.000 |
      | SFR                    | 75.01 - 80%   |  80 |        0.000 |
      | SFR                    | 80.01 - 85%   |  85 |        0.000 |
      | Condo                  | <= 50%        |  50 |      -0.250  |
      | Condo                  | 50.01 - 55%   |  55 |      -0.250  |
      | Condo                  | 55.01 - 60%   |  60 |      -0.250  |
      | Condo                  | 60.01 - 65%   |  65 |      -0.250  |
      | Condo                  | 65.01 - 70%   |  70 |      -0.375  |
      | Condo                  | 70.01 - 75%   |  75 |      -0.500  |
      | Condo                  | 75.01 - 80%   |  80 | Not Eligible |
      | Condo                  | 80.01 - 85%   |  85 | Not Eligible |
      | Non-Warrantable Condo  | <= 50%        |  50 |      -0.500  |
      | Non-Warrantable Condo  | 50.01 - 55%   |  55 |      -0.500  |
      | Non-Warrantable Condo  | 55.01 - 60%   |  60 |      -0.500  |
      | Non-Warrantable Condo  | 60.01 - 65%   |  65 |      -0.500  |
      | Non-Warrantable Condo  | 65.01 - 70%   |  70 |      -0.750  |
      | Non-Warrantable Condo  | 70.01 - 75%   |  75 |      -1.000  |
      | Non-Warrantable Condo  | 75.01 - 80%   |  80 | Not Eligible |
      | Non-Warrantable Condo  | 80.01 - 85%   |  85 | Not Eligible |
      | Condotel               | <= 50%        |  50 |      -1.000  |
      | Condotel               | 50.01 - 55%   |  55 |      -1.000  |
      | Condotel               | 55.01 - 60%   |  60 |      -1.000  |
      | Condotel               | 60.01 - 65%   |  65 |      -1.000  |
      | Condotel               | 65.01 - 70%   |  70 |      -1.500  |
      | Condotel               | 70.01 - 75%   |  75 |      -2.000  |
      | Condotel               | 75.01 - 80%   |  80 | Not Eligible |
      | Condotel               | 80.01 - 85%   |  85 | Not Eligible |
      | 2-4 Units              | <= 50%        |  50 |      -0.250  |
      | 2-4 Units              | 50.01 - 55%   |  55 |      -0.250  |
      | 2-4 Units              | 55.01 - 60%   |  60 |      -0.250  |
      | 2-4 Units              | 60.01 - 65%   |  65 |      -0.250  |
      | 2-4 Units              | 65.01 - 70%   |  70 |      -0.375  |
      | 2-4 Units              | 70.01 - 75%   |  75 |      -0.500  |
      | 2-4 Units              | 75.01 - 80%   |  80 |      -0.750  |
      | 2-4 Units              | 80.01 - 85%   |  85 | Not Eligible |
