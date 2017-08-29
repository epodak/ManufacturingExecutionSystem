package com.inflinx.book.ldap.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.ldap.core.LdapTemplate;
import org.springframework.stereotype.Repository;

@Repository("authenticationDao3")
public class AuthenticationDaoImpl3 implements AuthenticationDao {
	
	@Autowired
	@Qualifier("ldapTemplate")
	private LdapTemplate ldapTemplate;
	
	@Override
	public boolean authenticate(String userid, String password) {
		EmployeeAuthenticationErrorCallback errorCallback = new EmployeeAuthenticationErrorCallback();
		boolean isAuthenticated = ldapTemplate.authenticate("","(uid=" + userid + ")", password, errorCallback);
		if(!isAuthenticated) {
			System.out.println(errorCallback.getAuthenticationException());
		}
		return isAuthenticated;
	}
}

