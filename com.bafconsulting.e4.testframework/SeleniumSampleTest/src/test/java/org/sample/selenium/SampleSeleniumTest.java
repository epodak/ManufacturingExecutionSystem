package test.java.org.sample.selenium;

import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.testng.Assert;
import org.testng.annotations.AfterMethod;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Test;

public class SampleSeleniumTest {
	WebDriver driver;
	@BeforeMethod
	public void beforeMethod(){
		//Initializing the selenium webdriver object
		driver = new FirefoxDriver();		
	}
	
	@Test
	public void googleTest(){
		//Opening the google page
		driver.navigate().to("http://www.google.com");
		//Finding the search field and entering text to it.
		driver.findElement(By.cssSelector("input[name='q']")).sendKeys("TestNg");
		WebDriverWait wait = new WebDriverWait(driver, 30);
		//Waiting for the serach list to be populated.
		List<WebElement> results=wait.until(ExpectedConditions.presenceOfAllElementsLocatedBy(By.cssSelector("h3.r")));
		//Getting the text of the first search result.
		String searchResult=results.get(0).getText();
		//Verifying the text of first search test result with the expected text
		Assert.assertEquals(searchResult,"TestNG - Welcome");
	}
	
	@AfterMethod
	public void afterMethod(){
		//Quitting the browser.
		driver.quit();
	}

}
