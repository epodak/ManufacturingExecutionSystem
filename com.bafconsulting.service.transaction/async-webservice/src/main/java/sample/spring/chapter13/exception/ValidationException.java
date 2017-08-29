package sample.spring.chapter13.exception;

public class ValidationException extends RuntimeException {
	private static final long serialVersionUID = 98361438798096656L;

	public ValidationException(String message) {
		super(message);
	}
}
