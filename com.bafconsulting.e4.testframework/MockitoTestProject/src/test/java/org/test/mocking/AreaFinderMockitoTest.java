package test.java.org.test.mocking;


import main.java.org.test.mocking.AreaFinder;
import main.java.org.test.mocking.Calculator;

import org.mockito.InjectMocks;
import org.mockito.Mock;
import static org.mockito.Mockito.*;
import org.mockito.MockitoAnnotations;
import org.testng.Assert;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Test;



public class AreaFinderMockitoTest{

	

	@InjectMocks private AreaFinder areaFinder;

	
	@Mock private Calculator calculator ;

	@BeforeMethod
	public void setUp() {
		MockitoAnnotations.initMocks(this);
		areaFinder = new AreaFinder(calculator);
	}

	@Test(expectedExceptions = IllegalArgumentException.class)
	public void getAreaOfCircleShouldThrowIllegalArgumentExceptionForNegativeRadius() {
		areaFinder.getAreaOfCircle(-1.2);
	}

	@Test
	public void getAreaOfSquareShouldReturnExpectedValue() {
		final double radius = 4.1;
		final double radiusSquare = 5.3;
		final double expectedArea = 10.9;
		
		when(calculator.square(radius)).thenReturn(radiusSquare);
		when(calculator.multiply(Math.PI, radiusSquare)).thenReturn(expectedArea);
		
		Assert.assertEquals(areaFinder.getAreaOfCircle(radius), expectedArea, 0);
	}
}
