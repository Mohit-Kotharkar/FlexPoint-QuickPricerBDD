package stepdefinitions;

import java.util.List;
import java.util.concurrent.TimeUnit;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

public class QuickPricerSteps {
    private WebDriver driver;

    @Given("I am on the Quick Pricer page")
    public void i_am_on_the_quick_pricer_page() {
        driver = Hooks.getDriver();
        driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);
        driver.manage().window().maximize();
        driver.get("https://brokersfirstfunding.buildyourai.consulting/quick-pricer");
    }

    @When("I select the program {string}")
    public void i_select_the_program(String programName) {
        WebElement programDropdown = driver.findElement(By.id("programCategory"));
        programDropdown.click();
        // Wait for the dropdown options to be visible
        try { Thread.sleep(500); } catch (InterruptedException e) { }
        // Select the program from the dropdown using standard Selenium click (previously working logic)
        WebElement option = driver.findElement(By.xpath("//span[contains(text(), '" + programName + "')]"));
        option.click();
    }

    

    @Then("the respective rate and price options should be displayed for {string}")
    public void the_respective_rate_and_price_options_should_be_displayed(String programName) {
        // Click the rate dropdown
        WebElement rateDropdown = driver.findElement(By.id("rate-selector"));
        rateDropdown.click();

        // Hardcoded expected values for NON-QM Expanded Doc
        String[] expectedRates = {
            "6.25", "6.375", "6.5", "6.625", "6.75", "6.875", "7", "7.125", "7.25", "7.375", "7.5", "7.625", "7.75", "7.875", "8", "8.125", "8.25", "8.375", "8.5", "8.625", "8.75", "8.875", "9", "9.125", "9.25", "9.375"
        };
        String[] expectedPrices = {
            "97.875", "98.875", "99.625", "100", "100.375", "100.75", "101.125", "101.375", "101.625", "101.875", "102.125", "102.375", "102.625", "102.875", "103.125", "103.375", "103.625", "103.875", "104.125", "104.375", "104.625", "104.75", "104.875", "105", "105.125", "105.25"
        };

        // Wait for the dynamic dropdown to appear
        WebElement popperContent = null;
        for (int i = 0; i < 10; i++) { // try for up to 5 seconds
            try {
                popperContent = driver.findElement(By.cssSelector("div[data-radix-popper-content-wrapper]"));
                if (popperContent.isDisplayed()) break;
            } catch (Exception e) {
                // not found yet
            }
            try { Thread.sleep(500); } catch (InterruptedException e) { }
        }
        if (popperContent == null) {
            throw new AssertionError("Dropdown content not found");
        }

        // Find all rate/price option rows using the actual HTML structure
        // Each option is a div with role="option" and contains a span with class 'font-bold text-lg' (rate) and a div with the price
        List<WebElement> optionRows = popperContent.findElements(By.cssSelector("div[role='option']"));

        // Extract the rate and price values from each row, normalize by removing trailing zeros and decimal points
        java.util.Set<String> foundPairs = new java.util.HashSet<>();
        for (WebElement row : optionRows) {
            String rate = null, price = null;
            try {
                WebElement rateSpan = row.findElement(By.cssSelector("span.font-bold.text-lg"));
                rate = rateSpan.getText().replace("%", "").trim();
            } catch (Exception e) { /* ignore */ }
            try {
                WebElement priceDiv = row.findElement(By.cssSelector("div.inline-flex.items-center.rounded-full.border"));
                price = priceDiv.getText().replaceAll("[^0-9.]", "").trim();
            } catch (Exception e) { /* ignore */ }
            if (rate != null && price != null && !rate.isEmpty() && !price.isEmpty()) {
                String normRate = normalizeDecimal(rate);
                String normPrice = normalizeDecimal(price);
                foundPairs.add(normRate + ":" + normPrice);
                System.out.println("Extracted from dropdown: Rate=" + rate + "% , Price=" + price + " (normalized: Rate=" + normRate + ", Price=" + normPrice + ")");
            }
        }

        // Helper to normalize decimals (remove trailing zeros and decimal point if integer)
        // Place this method at the end of the class
        // private String normalizeDecimal(String value) { ... }

        // Check all expected pairs are present and print each verification
        boolean allMatch = true;
        for (int i = 0; i < expectedRates.length; i++) {
            String normRate = normalizeDecimal(expectedRates[i]);
            String normPrice = normalizeDecimal(expectedPrices[i]);
            String pair = normRate + ":" + normPrice;
            if (foundPairs.contains(pair)) {
                System.out.println("Verified: Rate=" + expectedRates[i] + "% , Price=" + expectedPrices[i]);
            } else {
                allMatch = false;
                System.out.println("Missing option: Rate=" + expectedRates[i] + "% , Price=" + expectedPrices[i]);
            }
        }
        org.testng.Assert.assertTrue(allMatch, "Not all expected rate/price options are present in the dropdown");
        driver.quit();
    }

    // Helper to normalize decimals (remove trailing zeros and decimal point if integer)
    private String normalizeDecimal(String value) {
        if (value == null) return null;
        try {
            java.math.BigDecimal bd = new java.math.BigDecimal(value);
            bd = bd.stripTrailingZeros();
            String norm = bd.toPlainString();
            // Remove trailing . if integer
            if (norm.endsWith(".")) norm = norm.substring(0, norm.length() - 1);
            return norm;
        } catch (Exception e) {
            return value;
        }
    }
}
