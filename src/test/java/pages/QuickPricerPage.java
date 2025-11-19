package pages;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

public class QuickPricerPage {
    private WebDriver driver;

    public QuickPricerPage(WebDriver driver) {
        this.driver = driver;
    }

    public WebElement getProgramDropdown() {
        return driver.findElement(By.id("programCategory"));
    }

    public WebElement getProgramOption(String programName) {
        return driver.findElement(By.xpath("//span[contains(text(), '" + programName + "')]"));
    }

    public WebElement getRate() {
        return driver.findElement(By.xpath("//span[contains(@class,'font-bold') and contains(text(),'%')]"));
    }

    public WebElement getPrice() {
        return driver.findElement(By.xpath("//div[contains(@class,'font-semibold') and text()[contains(.,'.')]]"));
    }
}
