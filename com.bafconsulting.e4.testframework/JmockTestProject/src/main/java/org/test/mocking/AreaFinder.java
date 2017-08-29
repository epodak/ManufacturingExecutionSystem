package main.java.org.test.mocking;


public class AreaFinder {

	private final Calculator calculator;

	public AreaFinder(Calculator calculator) {
		this.calculator = calculator;
	}

	public double getAreaOfCircle(double radius) {
		if(radius > 0)
			return calculator.multiply(Math.PI, calculator.square(radius));
		else if(radius <0)
			throw new IllegalArgumentException();
		else
			return 0;
	}

}
