package testrunners;

import io.cucumber.testng.AbstractTestNGCucumberTests;
import io.cucumber.testng.CucumberOptions;

@CucumberOptions(
        features = "src/test/java/features/LLPAAdjustments.feature",
        // features = "src/test/java/features/",
        glue = {"stepdefinitions"},
        plugin = {
                "pretty", "html:target/cucumber-reports.html",
        // write failed scenario locations to a rerun file for easy re-run tooling
                "rerun:target/rerun.txt",
        },
        monochrome = true
)
public class TestRunner extends AbstractTestNGCucumberTests {
}
