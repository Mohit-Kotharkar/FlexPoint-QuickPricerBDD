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
    public void i_set_fico_score_to(String fico) {
        driver = Hooks.getDriver();
        // Use the same logic as QuickPricerSteps
        WebElement ficoInput = driver.findElement(By.cssSelector("input#ficoScore, input[type='number'][placeholder='Score']"));
        int ficoValue = parseFico(fico);
        ficoInput.clear();
        ficoInput.sendKeys(String.valueOf(ficoValue));
    }

    @When("I set LTV to {int}")
    public void i_set_ltv_to(int ltv) {
        driver = Hooks.getDriver();
        WebElement ltvInput = driver.findElement(By.cssSelector("input#ltvRatio, input[type='number'][placeholder='LTV %']"));
        ltvInput.clear();
        ltvInput.sendKeys(String.valueOf(ltv));
    }

    @Then("the LLPA adjustment should be {double}")
    public void the_llpa_adjustment_should_be(double expectedAdjustment) {
        driver = Hooks.getDriver();
        WebElement adjustmentElem = driver.findElement(By.cssSelector("#llpaAdjustment, .llpa-adjustment, [data-testid='llpa-adjustment']"));
        String actual = adjustmentElem.getText().replace("%", "").trim();
        Assert.assertEquals(actual, expectedAdjustment, "LLPA adjustment mismatch");
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
}
