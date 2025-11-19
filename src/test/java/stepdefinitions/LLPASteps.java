package stepdefinitions;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.testng.Assert;

import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

public class LLPASteps {
    private WebDriver driver;

    public LLPASteps() {
        this.driver = null; // Will be set in the first step
    }

    @Then("I print the entire page HTML")
    public void print_entire_page_html() {
        driver = Hooks.getDriver();
        System.out.println("--- PAGE HTML START ---");
        System.out.println(driver.getPageSource());
        System.out.println("--- PAGE HTML END ---");
    }

    @When("I set FICO score to {string}")
    public void i_set_fico_score_to(String fico) throws InterruptedException {
        driver = Hooks.getDriver();
        Thread.sleep(1000); // Wait for page/input to be ready
        WebElement ficoInput = driver.findElement(By.cssSelector("input#ficoScore, input[type='number'][placeholder='Score']"));
        System.out.println("[DEBUG] FICO input attributes: type=" + ficoInput.getAttribute("type") + ", placeholder=" + ficoInput.getAttribute("placeholder") + ", id=" + ficoInput.getAttribute("id") + ", name=" + ficoInput.getAttribute("name") + ", value=" + ficoInput.getAttribute("value"));
        int ficoValue = parseFico(fico);
        String targetValue = String.valueOf(ficoValue);
        int attempts = 0;
        while (attempts < 5) {
            ((org.openqa.selenium.JavascriptExecutor) driver).executeScript(
                "arguments[0].value = ''; arguments[0].focus(); arguments[0].value = arguments[1];",
                ficoInput, targetValue);
            Thread.sleep(500);
            String actual = ficoInput.getAttribute("value");
            System.out.println("[DEBUG] FICO input after JS set (attempt " + (attempts+1) + "): value='" + actual + "'");
            if (targetValue.equals(actual)) break;
            attempts++;
        }
        if (targetValue.equals(ficoInput.getAttribute("value"))) {
            ((org.openqa.selenium.JavascriptExecutor) driver).executeScript("arguments[0].blur();", ficoInput);
            System.out.println("[DEBUG] FICO input blurred after successful set.");
        } else {
            System.out.println("[WARN] FICO input did not match expected value after retries!");
        }
        Thread.sleep(1000); // Wait after input
    }

    @When("I set LTV to {string}")
    public void i_set_ltv_to(String ltv) throws InterruptedException {
        driver = Hooks.getDriver();
        Thread.sleep(1000); // Wait for page/input to be ready
        WebElement ltvInput = driver.findElement(By.cssSelector("input#ltvRatio, input[type='number'][placeholder='LTV %']"));
        System.out.println("[DEBUG] LTV input attributes: type=" + ltvInput.getAttribute("type") + ", placeholder=" + ltvInput.getAttribute("placeholder") + ", id=" + ltvInput.getAttribute("id") + ", name=" + ltvInput.getAttribute("name") + ", value=" + ltvInput.getAttribute("value"));
        String targetValue = ltv;
        int attempts = 0;
        while (attempts < 5) {
            ((org.openqa.selenium.JavascriptExecutor) driver).executeScript(
                "arguments[0].value = ''; arguments[0].focus(); arguments[0].value = arguments[1];",
                ltvInput, targetValue);
            Thread.sleep(500);
            String actual = ltvInput.getAttribute("value");
            System.out.println("[DEBUG] LTV input after JS set (attempt " + (attempts+1) + "): value='" + actual + "'");
            if (targetValue.equals(actual)) break;
            attempts++;
        }
        if (targetValue.equals(ltvInput.getAttribute("value"))) {
            ((org.openqa.selenium.JavascriptExecutor) driver).executeScript("arguments[0].blur();", ltvInput);
            System.out.println("[DEBUG] LTV input blurred after successful set.");
        } else {
            System.out.println("[WARN] LTV input did not match expected value after retries!");
        }
        Thread.sleep(1000); // Wait after input
    }

    @Then("the LLPA adjustment should be {string}")
    public void the_llpa_adjustment_should_be(String expectedAdjustment) {
        driver = Hooks.getDriver();
        WebElement adjustmentElem = driver.findElement(By.xpath("//h4[normalize-space(text())='LLPA Adjustments:']/following-sibling::div[1]"));
        String actualSection = adjustmentElem.getText();
        String expected = expectedAdjustment + " bps";
        Assert.assertTrue(actualSection.contains(expected),
            "LLPA adjustment section does not contain expected value: '" + expected + "'. Actual: '" + actualSection + "'");
        driver.quit();
    }

    @Then("I wait for {int} seconds")
    public void I_wait_for_seconds(Integer seconds) throws InterruptedException {
        driver = Hooks.getDriver();
        Thread.sleep(seconds * 1000);
    }

    @When("I see the text for FICO")
    public void I_see_the_text_for_FICO() {
        driver = Hooks.getDriver();
        WebElement ficoScore = driver.findElement(By.xpath("//*[contains(text(),'FICO')]"));
        ficoScore.isDisplayed();
    }

    // Helper to parse FICO string to int (e.g., '760+' -> 760, '700-719' -> 710)
    private int parseFico(String fico) {
        if (fico.endsWith("+")) {
            return Integer.parseInt(fico.replace("+", ""));
        } else if (fico.contains("-")) {
            String[] parts = fico.split("-");
            return (Integer.parseInt(parts[0]) + Integer.parseInt(parts[1])) / 2;
        } else {
            try {
                return Integer.parseInt(fico);
            } catch (Exception e) {
                return 700; // fallback
            }
        }
    }


    @Then("I select the Income Doc Type {string}")
    public void i_select_income_doc_type(String docType) throws InterruptedException {
        selectDropdownByIdAndText("incomeDocType", docType);
    }

    @Then("I select the Loan Term {string}")
    public void i_select_loan_term(String loanTerm) throws InterruptedException {
        selectDropdownByIdAndText("loanTerm", loanTerm);
    }

    @Then("I select the Purpose {string}")
    public void i_select_purpose(String purpose) throws InterruptedException {
        selectDropdownByIdAndText("loanPurpose", purpose);
    }

    @Then("I select the State {string}")
    public void i_select_state(String state) throws InterruptedException {
        selectDropdownByIdAndText("state", state);
    }

    @Then("I select the Citizenship {string}")
    public void i_select_citizenship(String citizenship) throws InterruptedException {
        selectDropdownByIdAndText("citizenship", citizenship);
    }

    @Then("I select the Property Type {string}")
    public void i_select_property_type(String propertyType) throws InterruptedException {
        selectDropdownByIdAndText("propertyType", propertyType);
    }

    @Then("I select the # of Properties {string}")
    public void i_select_number_of_properties(String numProperties) throws InterruptedException {
        selectDropdownByIdAndText("numberOfProperties", numProperties);
    }

    @Then("I select the # of Units {string}")
    public void i_select_number_of_units(String numUnits) throws InterruptedException {
        selectDropdownByIdAndText("numberOfUnits", numUnits);
    }

    // Helper for dropdown selection by id and visible text
    private void selectDropdownByIdAndText(String id, String visibleText) throws InterruptedException {
        driver = Hooks.getDriver();
        WebElement dropdown = driver.findElement(By.id(id));
        System.out.println("[DEBUG] Clicking dropdown with id: " + id + ", current value: '" + dropdown.getText() + "'");
        dropdown.click();
        Thread.sleep(500);
        // Find the option by visible text (span inside dropdown popper)
        WebElement option = driver.findElement(By.xpath("//span[contains(text(), '" + visibleText + "')]"));
        System.out.println("[DEBUG] Selecting option with text: '" + visibleText + "'");
        option.click();
        Thread.sleep(500);
        System.out.println("[DEBUG] Selected '" + visibleText + "' for dropdown id: " + id);
    }
}
