package com.inflinx.book.ldap.repository;

import javax.naming.directory.DirContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.ldap.NamingException;
import org.springframework.ldap.core.ContextSource;
import org.springframework.ldap.core.DistinguishedName;
import org.springframework.ldap.support.LdapUtils;
import org.springframework.stereotype.Repository;

@Repository("authenticationDao")
public class AuthenticationDaoImpl implements AuthenticationDao{

	public static final String BASE_DN = "ou=patrons,dc=inflinx,dc=com";
	
	@Autowired
	@Qualifier("contextSource")
	private ContextSource contextSource;
	
@Override
public boolean authenticate(String userid, String password) {
		
		DistinguishedName dn = new DistinguishedName(BASE_DN);
		dn.add("uid", userid);
		
		DirContext authenticatedContext = null;
		try {
			
			authenticatedContext = contextSource.getContext(dn.toString(), password);
			return true;
		}
		catch(NamingException e) {
			e.printStackTrace();
			return false;
		}
		finally {
			LdapUtils.closeContext(authenticatedContext);
		}
	}
}