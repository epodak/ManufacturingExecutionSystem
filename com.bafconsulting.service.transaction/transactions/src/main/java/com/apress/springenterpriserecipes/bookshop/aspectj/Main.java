package com.apress.springenterpriserecipes.bookshop.aspectj;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/* 
 * TO RUN:
 * 
 * You need the Spring AspectJ load time weaver, spring-instrument-3.0.0.x.jar. If you built the source tree with Maven, 
 * there will be a target/lib/ folder in your 'transactions' folder. 
 * 
 * Thus, you can add this to your invocation of the java command: 
 * 
 * -javaagent:target/lib/spring-instrument-3.0.0.x.jar
 *   
 */
public class Main {

    public static void main(String[] args) {
        ApplicationContext context = 
            new ClassPathXmlApplicationContext("aspectj-beans.xml");

        Book book = new Book("0001", "My First Book", 30);
        book.purchase("user1");
    }
}
