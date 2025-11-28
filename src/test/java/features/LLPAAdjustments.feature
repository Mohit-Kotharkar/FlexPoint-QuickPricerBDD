Feature: FICO/LTV Loan Level Price Adjustments (LLPA) : NON-QM Expanded Doc
  As a user of the Quick Pricer
  I want to verify that the correct FICO/LTV LLPA adjustments are displayed

  Scenario Outline: Verify LLPA adjustment for FICO and LTV
    Given I am on the Quick Pricer page
    Then I wait for 3 seconds
    When I select the program "NON-QM Expanded Doc"
    Then I wait for 5 seconds
    Then I select the Income Doc Type "24 mo BS"
    Then I select the Loan Term "30 Years"
    Then I select the Purpose "Refinance Cash Out"
    Then I select the State "California (CA)"
    Then I select the Citizenship "US Citizen"
    Then I select the Property Type "Condo"
    Then I select the # of Properties "1"
    Then I select the # of Units "1"
    When I set FICO score to "<FICO>"
    And I set LTV to "<LTV>"
    Then I wait for 3 seconds
    Then the LLPA adjustment should have "<FICORange>" "<LTVRange>" "<Adjustment>"

    Examples:
      | FICORange | LTVRange | FICO | LTV | Adjustment |
      # |      760+ |     0-50 |  770 |  50 |     +1.500 |
      # |      760+ | 50.01-55 |  770 |  55 |       +1.500 |
      # |      760+ | 55.01-60 |  770 |  60 |       +1.375 |
      # |      760+ | 60.01-65 |  770 |  65 |       +1.250 |
      # |      760+ | 65.01-70 |  770 |  70 |       +1.125 |
      # |      760+ | 70.01-75 |  770 |  75 |       +0.750 |
      # |      760+ | 75.01-80 |  770 |  80 |       +0.250 |
      # |      760+ | 80.01-85 |  770 |  85 |       -1.375 |
      # |      760+ | 85.01-90 |  770 |  90 |       -2.750 |
      # | 740 - 759 |     0-50 |  750 |  50 |       +1.500 |
      # | 740 - 759 | 50.01-55 |  750 |  55 |       +1.375 |
      # | 740 - 759 | 55.01-60 |  750 |  60 |       +1.250 |
      # | 740 - 759 | 60.01-65 |  750 |  65 |       +1.125 |
      # | 740 - 759 | 65.01-70 |  750 |  70 |       +1.000 |
      # | 740 - 759 | 70.01-75 |  750 |  75 |       +0.500 |
      # | 740 - 759 | 75.01-80 |  750 |  80 |        0.000 |
      # | 740 - 759 | 80.01-85 |  750 |  85 |       -1.875 |
      # | 740 - 759 | 85.01-90 |  750 |  90 |       -3.000 |
      # | 720 - 739 |     0-50 |  730 |  50 |       +1.375 |
      # | 720 - 739 | 50.01-55 |  730 |  55 |       +1.250 |
      # | 720 - 739 | 55.01-60 |  730 |  60 |       +1.125 |
      # | 720 - 739 | 60.01-65 |  730 |  65 |       +1.000 |
      # | 720 - 739 | 65.01-70 |  730 |  70 |       +0.625 |
      # | 720 - 739 | 70.01-75 |  730 |  75 |       +0.250 |
      # | 720 - 739 | 75.01-80 |  730 |  80 |       -0.500 |
      # | 720 - 739 | 80.01-85 |  730 |  85 |       -2.125 |
      # | 720 - 739 | 85.01-90 |  730 |  90 |       -4.000 |
      # | 700 - 719 |     0-50 |  710 |  50 |       +1.250 |
      # | 700 - 719 | 50.01-55 |  710 |  55 |       +1.125 |
      # | 700 - 719 | 55.01-60 |  710 |  60 |       +0.875 |
      # | 700 - 719 | 60.01-65 |  710 |  65 |       +0.625 |
      # | 700 - 719 | 65.01-70 |  710 |  70 |       +0.375 |
      # | 700 - 719 | 70.01-75 |  710 |  75 |       -0.125 |
      # | 700 - 719 | 75.01-80 |  710 |  80 |       -1.125 |
      # | 700 - 719 | 80.01-85 |  710 |  85 |       -2.500 |
      # | 700 - 719 | 85.01-90 |  710 |  90 |       -4.500 |
      # | 680 - 699 |     0-50 |  690 |  50 |       +0.750 |
      # | 680 - 699 | 50.01-55 |  690 |  55 |       +0.625 |
      # | 680 - 699 | 55.01-60 |  690 |  60 |       +0.375 |
      # | 680 - 699 | 60.01-65 |  690 |  65 |        0.000 |
      # | 680 - 699 | 65.01-70 |  690 |  70 |       -0.375 |
      # | 680 - 699 | 70.01-75 |  690 |  75 |       -1.250 |
      # | 680 - 699 | 75.01-80 |  690 |  80 |       -1.750 |
      # | 680 - 699 | 80.01-85 |  690 |  85 |       -3.375 |
      # | 680 - 699 | 85.01-90 |  690 |  90 |       -5.000 |
      # | 660 - 679 |     0-50 |  670 |  50 |        0.000 |
      # | 660 - 679 | 50.01-55 |  670 |  55 |        0.000 |
      # | 660 - 679 | 55.01-60 |  670 |  60 |       -0.250 |
      # | 660 - 679 | 60.01-65 |  670 |  65 |       -0.500 |
      # | 660 - 679 | 65.01-70 |  670 |  70 |       -1.125 |
      # | 660 - 679 | 70.01-75 |  670 |  75 |       -1.875 |
      # | 660 - 679 | 75.01-80 |  670 |  80 |       -2.750 |
      # | 660 - 679 | 80.01-85 |  670 |  85 | Not Eligible |
      # | 660 - 679 | 85.01-90 |  670 |  90 | Not Eligible |
      # | 640 - 659 |     0-50 |  650 |  50 |       -3.000 |
      # | 640 - 659 | 50.01-55 |  650 |  55 |       -3.125 |
      # | 640 - 659 | 55.01-60 |  650 |  60 |       -3.250 |
      # | 640 - 659 | 60.01-65 |  650 |  65 |       -3.500 |
      # | 640 - 659 | 65.01-70 |  650 |  70 |       -3.750 |
      # | 640 - 659 | 70.01-75 |  650 |  75 |       -4.125 |
      # | 640 - 659 | 75.01-80 |  650 |  80 |       -5.250 |
      # | 640 - 659 | 80.01-85 |  650 |  85 | Not Eligible |
      # | 640 - 659 | 85.01-90 |  650 |  90 | Not Eligible |

  Scenario Outline: Verify LLPA adjustment for NON-QM Full Doc
    Given I am on the Quick Pricer page
    Then I wait for 3 seconds
    When I select the program "NON-QM Full Doc"
    Then I wait for 5 seconds
    Then I select the Income Doc Type "12 mo Full Doc"
    Then I select the Loan Term "30 Years"
    Then I select the Purpose "Refinance Cash Out"
    Then I select the State "California (CA)"
    Then I select the Citizenship "US"
    Then I select the Property Type "Condo"
    Then I select the # of Properties "1"
    Then I select the # of Units "1"
    When I set FICO score to "<FICO>"
    And I set LTV to "<LTV>"
    Then I wait for 3 seconds
    Then the LLPA adjustment should have "<FICORange>" "<LTVRange>" "<Adjustment>"

    Examples:

    Examples:
      | FICORange | LTVRange | FICO | LTV | Adjustment |
      # |      760+ |     0-50 |  770 |  50 |     +1.500 |
      # |      760+ | 50.01-55 |  770 |  55 |       +1.500 |
      # |      760+ | 55.01-60 |  770 |  60 |       +1.375 |
      # |      760+ | 60.01-65 |  770 |  65 |       +1.250 |
      # |      760+ | 65.01-70 |  770 |  70 |       +1.125 |
      # |      760+ | 70.01-75 |  770 |  75 |       +0.750 |
      # |      760+ | 75.01-80 |  770 |  80 |       +0.250 |
      # |      760+ | 80.01-85 |  770 |  85 |       -1.375 |
      # |      760+ | 85.01-90 |  770 |  90 |       -2.750 |
      # | 740 - 759 |     0-50 |  750 |  50 |       +1.500 |
      # | 740 - 759 | 50.01-55 |  750 |  55 |       +1.375 |
      # | 740 - 759 | 55.01-60 |  750 |  60 |       +1.250 |
      # | 740 - 759 | 60.01-65 |  750 |  65 |       +1.125 |
      # | 740 - 759 | 65.01-70 |  750 |  70 |       +1.000 |
      # | 740 - 759 | 70.01-75 |  750 |  75 |       +0.500 |
      # | 740 - 759 | 75.01-80 |  750 |  80 |        0.000 |
      # | 740 - 759 | 80.01-85 |  750 |  85 |       -1.875 |
      # | 740 - 759 | 85.01-90 |  750 |  90 |       -3.000 |
      # | 720 - 739 |     0-50 |  730 |  50 |       +1.375 |
      # | 720 - 739 | 50.01-55 |  730 |  55 |       +1.250 |
      # | 720 - 739 | 55.01-60 |  730 |  60 |       +1.125 |
      # | 720 - 739 | 60.01-65 |  730 |  65 |       +1.000 |
      # | 720 - 739 | 65.01-70 |  730 |  70 |       +0.625 |
      # | 720 - 739 | 70.01-75 |  730 |  75 |       +0.250 |
      # | 720 - 739 | 75.01-80 |  730 |  80 |       -0.500 |
      # | 720 - 739 | 80.01-85 |  730 |  85 |       -2.125 |
      # | 720 - 739 | 85.01-90 |  730 |  90 |       -4.000 |
      # | 700 - 719 |     0-50 |  710 |  50 |       +1.250 |
      # | 700 - 719 | 50.01-55 |  710 |  55 |       +1.125 |
      # | 700 - 719 | 55.01-60 |  710 |  60 |       +0.875 |
      # | 700 - 719 | 60.01-65 |  710 |  65 |       +0.625 |
      # | 700 - 719 | 65.01-70 |  710 |  70 |       +0.375 |
      # | 700 - 719 | 70.01-75 |  710 |  75 |       -0.125 |
      # | 700 - 719 | 75.01-80 |  710 |  80 |       -1.125 |
      # | 700 - 719 | 80.01-85 |  710 |  85 |       -2.500 |
      # | 700 - 719 | 85.01-90 |  710 |  90 |       -4.500 |
      # | 680 - 699 |     0-50 |  690 |  50 |       +0.750 |
      # | 680 - 699 | 50.01-55 |  690 |  55 |       +0.625 |
      # | 680 - 699 | 55.01-60 |  690 |  60 |       +0.375 |
      # | 680 - 699 | 60.01-65 |  690 |  65 |        0.000 |
      # | 680 - 699 | 65.01-70 |  690 |  70 |       -0.375 |
      # | 680 - 699 | 70.01-75 |  690 |  75 |       -1.250 |
      # | 680 - 699 | 75.01-80 |  690 |  80 |       -1.750 |
      # | 680 - 699 | 80.01-85 |  690 |  85 |       -3.375 |
      # | 680 - 699 | 85.01-90 |  690 |  90 |       -5.000 |
      # | 660 - 679 |     0-50 |  670 |  50 |        0.000 |
      # | 660 - 679 | 50.01-55 |  670 |  55 |        0.000 |
      # | 660 - 679 | 55.01-60 |  670 |  60 |       -0.250 |
      # | 660 - 679 | 60.01-65 |  670 |  65 |       -0.500 |
      # | 660 - 679 | 65.01-70 |  670 |  70 |       -1.125 |
      # | 660 - 679 | 70.01-75 |  670 |  75 |       -1.875 |
      # | 660 - 679 | 75.01-80 |  670 |  80 |       -2.750 |
      # | 660 - 679 | 80.01-85 |  670 |  85 | Not Eligible |
      # | 660 - 679 | 85.01-90 |  670 |  90 | Not Eligible |
      # | 640 - 659 |     0-50 |  650 |  50 |       -3.000 |
      # | 640 - 659 | 50.01-55 |  650 |  55 |       -3.125 |
      # | 640 - 659 | 55.01-60 |  650 |  60 |       -3.250 |
      # | 640 - 659 | 60.01-65 |  650 |  65 |       -3.500 |
      # | 640 - 659 | 65.01-70 |  650 |  70 |       -3.750 |
      # | 640 - 659 | 70.01-75 |  650 |  75 |       -4.125 |
      # | 640 - 659 | 75.01-80 |  650 |  80 |       -5.250 |
      # | 640 - 659 | 80.01-85 |  650 |  85 | Not Eligible |
      # | 640 - 659 | 85.01-90 |  650 |  90 | Not Eligible |

  Scenario Outline: Verify LLPA adjustment for Doc Type and LTV (NON-QM Expanded Doc)
    Given I am on the Quick Pricer page
    Then I wait for 1 seconds
    When I select the program "NON-QM Expanded Doc"
    Then I wait for 1 seconds
    Then I select the Income Doc Type "<DocType>"
    Then I select the Loan Term "30 Years"
    Then I select the Purpose "Refinance Cash Out"
    Then I select the State "California (CA)"
    Then I select the Citizenship "US Citizen"
    Then I select the Property Type "Condo"
    Then I select the # of Properties "1"
    Then I select the # of Units "1"
    When I set LTV to "<LTV>"
    Then I wait for 1 seconds
    Then the LLPA adjustment should have "<DocType>" "" "<Adjustment>"

    Examples:
      | LTV | DocType                      | LTVRange | Adjustment   |
      |  45 |                     24 mo BS | <=50     |        0.250 |
      |  52 |                     24 mo BS | 50.01-55 |        0.250 |
      |  58 |                     24 mo BS | 55.01-60 |        0.250 |
      |  63 |                     24 mo BS | 60.01-65 |        0.250 |
      |  68 |                     24 mo BS | 65.01-70 |        0.250 |
      |  73 |                     24 mo BS | 70.01-75 |        0.250 |
      |  78 |                     24 mo BS | 75.01-80 |        0.125 |
      |  83 |                     24 mo BS | 80.01-85 |        0.000 |
      |  88 |                     24 mo BS | 85.01-90 |        0.000 |
      |  48 | CPA P&L w/ BS                | <=50     |       -0.375 |
      |  54 | CPA P&L w/ BS                | 50.01-55 |       -0.375 |
      |  58 | CPA P&L w/ BS                | 55.01-60 |       -0.500 |
      |  63 | CPA P&L w/ BS                | 60.01-65 |       -0.500 |
      |  68 | CPA P&L w/ BS                | 65.01-70 |       -0.500 |
      |  73 | CPA P&L w/ BS                | 70.01-75 |       -0.500 |
      |  78 | CPA P&L w/ BS                | 75.01-80 |       -0.625 |
      |  83 | CPA P&L w/ BS                | 80.01-85 |       -1.000 |
      |  88 | CPA P&L w/ BS                | 85.01-90 | Not Eligible |
      |  48 | CPA P&L w/o BS               | <=50     |       -0.750 |
      |  54 | CPA P&L w/o BS               | 50.01-55 |       -0.750 |
      |  58 | CPA P&L w/o BS               | 55.01-60 |       -1.000 |
      |  63 | CPA P&L w/o BS               | 60.01-65 |       -1.000 |
      |  68 | CPA P&L w/o BS               | 65.01-70 |       -1.000 |
      |  73 | CPA P&L w/o BS               | 70.01-75 |       -1.000 |
      |  78 | CPA P&L w/o BS               | 75.01-80 |       -1.250 |
      |  83 | CPA P&L w/o BS               | 80.01-85 | Not Eligible |
      |  88 | CPA P&L w/o BS               | 85.01-90 | Not Eligible |
      |  48 | Asset Util / WVOE / 12 mo BS | <=50     |        0.000 |
      |  54 | Asset Util / WVOE / 12 mo BS | 50.01-55 |        0.000 |
      |  58 | Asset Util / WVOE / 12 mo BS | 55.01-60 |        0.000 |
      |  63 | Asset Util / WVOE / 12 mo BS | 60.01-65 |        0.000 |
      |  68 | Asset Util / WVOE / 12 mo BS | 65.01-70 |        0.000 |
      |  73 | Asset Util / WVOE / 12 mo BS | 70.01-75 |        0.000 |
      |  78 | Asset Util / WVOE / 12 mo BS | 75.01-80 |        0.000 |
      |  83 | Asset Util / WVOE / 12 mo BS | 80.01-85 |        0.000 |
      |  88 | Asset Util / WVOE / 12 mo BS | 85.01-90 |        0.000 |
