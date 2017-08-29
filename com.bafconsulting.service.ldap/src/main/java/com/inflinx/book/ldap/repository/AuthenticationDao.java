package com.inflinx.book.ldap.repository;

public interface AuthenticationDao {
	public boolean authenticate(String userid, String password);
}
