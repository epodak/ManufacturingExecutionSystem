package com.inflinx.book.ldap.parser;

import java.io.File;
import java.io.IOException;

import org.springframework.core.io.ClassPathResource;
import org.springframework.ldap.core.LdapAttributes;
import org.springframework.ldap.ldif.parser.LdifParser;
import org.springframework.ldap.ldif.support.DefaultAttributeValidationPolicy;
import org.springframework.ldap.schema.BasicSchemaSpecification;

public class SimpleLdifParser2  {
	public void parse(File file) throws IOException {
		LdifParser parser = new LdifParser(file);
		parser.setAttributeValidationPolicy(new DefaultAttributeValidationPolicy());
		parser.setRecordSpecification(new BasicSchemaSpecification());
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
		SimpleLdifParser2 parser = new SimpleLdifParser2();
		parser.parse(new ClassPathResource("patrons.ldif").getFile());
	}
}