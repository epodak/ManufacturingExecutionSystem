package test.java.org.test.mocking;

import main.java.org.test.mocking.AreaFinder;
import main.java.org.test.mocking.Calculator;

import org.jmock.Expectations;
import org.jmock.Mockery;
import org.jmock.Sequence;
import org.testng.Assert;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Test;

public class AreaFinderJmockTest{
	//Creating a context object for macking purpose
	private final Mockery context = new Mockery();

	private AreaFinder areaFinder;

	/*
	 * Creating a mock object using mcking context earlier created for 
	 * the Calculator interface as there is no implementation for it 
	 * existing.
	 */
	private Calculator calculator = context.mock(Calculator.class);

	@BeforeMethod
	public void setUp() {
		areaFinder = new AreaFinder(calculator);
	}

	@Test(expectedExceptions = IllegalArgumentException.class)
	public void getAreaOfCircleShouldThrowIllegalArgumentExceptionForNegativeRadius() {
		areaFinder.getAreaOfCircle(-1.2);
	}
	
	@Test
	public void getAreaOfCircleShouldThrowIllegalArgumentExceptionForNegativeRadius() {
		Assert.asser areaFinder.getAreaOfCircle(0);
	}

	@Test
	public void getAreaOfSquareShouldReturnExpectedValue() {
		final double radius = 4.1;
		final double radiusSquare = 5.3;
		final double expectedArea = 10.9;
		/*
		 * Mocking the return values for the calculator methods suing the 
		 * context 
		 */
		context.checking(new Expectations() {
			final Sequence sequence = context.sequence("circle-area-sequence");
			{	//Mocking the square method in calculator and returning a particular value
				oneOf(calculator).square(radius);
				will(returnValue(radiusSquare));
				inSequence(sequence);
			}
			{
				oneOf(calculator).multiply(Math.PI, radiusSquare);
				will(returnValue(expectedArea));
				inSequence(sequence);
			}
		});
		Assert.assertEquals(areaFinder.getAreaOfCircle(radius), expectedArea, 0);
	}
}
