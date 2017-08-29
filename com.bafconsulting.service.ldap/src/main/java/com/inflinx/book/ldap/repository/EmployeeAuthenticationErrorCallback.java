package com.inflinx.book.ldap.repository;

import org.springframework.ldap.core.AuthenticationErrorCallback;

public class EmployeeAuthenticationErrorCallback implements AuthenticationErrorCallback {

	private Exception authenticationException;
	
	@Override
	public void execute(Exception e) {
		this.authenticationException = e;
	}

	public Exception getAuthenticationException() {
		return authenticationException;
	}
	
}