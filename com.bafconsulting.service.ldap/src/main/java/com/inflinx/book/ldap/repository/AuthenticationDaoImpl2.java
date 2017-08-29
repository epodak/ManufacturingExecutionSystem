package com.inflinx.book.ldap.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.ldap.core.LdapTemplate;
import org.springframework.stereotype.Repository;

@Repository("authenticationDao2")
public class AuthenticationDaoImpl2 implements AuthenticationDao {

	@Autowired
	@Qualifier("ldapTemplate")
	private LdapTemplate ldapTemplate;
	
	@Override
	public boolean authenticate(String userid, String password) {
		return ldapTemplate.authenticate("","(uid=" + userid + ")", password);
	}
}

