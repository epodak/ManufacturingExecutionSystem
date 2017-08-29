package com.inflinx.book.ldap.parser;

import java.io.File;
import java.io.IOException;

import org.springframework.core.io.ClassPathResource;
import org.springframework.ldap.core.LdapAttributes;
import org.springframework.ldap.ldif.parser.LdifParser;

public class SimpleLdifParser {
	public void parse(File file) throws IOException {
		LdifParser parser = new LdifParser(file);
		parser.open();
		int count = 0;
		while(parser.hasMoreRecords()) {
			LdapAttributes attributes = parser.getRecord();
			count ++;
		}
		parser.close();
		System.out.println(count);
	}
	
	public static void main(String[] args) throws IOException {
		SimpleLdifParser parser = new SimpleLdifParser();
		parser.parse(new ClassPathResource("patrons.ldif").getFile());
	}
}