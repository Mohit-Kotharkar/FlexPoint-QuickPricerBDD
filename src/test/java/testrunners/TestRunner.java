package testrunners;

import org.testng.annotations.DataProvider;

import io.cucumber.testng.AbstractTestNGCucumberTests;
import io.cucumber.testng.CucumberOptions;

@CucumberOptions(
        features = {
        //     "src/test/java/features/LLPAAdjustment_NONQM_MultiUnit_MixedUse.feature",
        //     "src/test/java/features/LLPAAdjustment_NONQM_CES_NOO.feature",
        //     "src/test/java/features/LLPAAdjustment_NONQM_DSCR.feature",
        //     "src/test/java/features/LLPAAdjustment_NONQM_FullDoc.feature",
            "src/test/java/features/LLPAAdjustment_NONQM_ExpandedDoc.feature"
        },
        glue = {"stepdefinitions"},
        plugin = {
                "pretty", "html:target/cucumber-reports.html",
                // write failed scenario locations to a rerun file for easy re-run tooling
                "rerun:target/rerun.txt",
        },
        monochrome = true
)

public class TestRunner extends AbstractTestNGCucumberTests {
        @Override
        @DataProvider(parallel = false)
        public Object[][] scenarios() {
                return super.scenarios();
        }
}
