package com.inflinx.book.ldap.parser;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.inflinx.book.ldap.repository.AuthenticationDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:repositoryContext-test.xml")
public class AuthenticationDao2Test {
	@Autowired
	@Qualifier("authenticationDao2")
	private AuthenticationDao authenticationDao;
	
	@Test
	public void testAuthenticate() {
		boolean authResult = authenticationDao.authenticate("patron0", "password");
		Assert.assertTrue(authResult);
		
		authResult = authenticationDao.authenticate("patron0", "invalidPassword");
		Assert.assertFalse(authResult);
	}
}