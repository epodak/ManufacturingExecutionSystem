package com.apress.springenterpriserecipes.bookshop.spring;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Main {

    public static void main(String[] args) {
        ApplicationContext context = 
            new ClassPathXmlApplicationContext("spring-beans.xml");

//        BookShop bookShop = (BookShop) context.getBean("bookShop");
//        bookShop.purchase("0001", "user1");

//        Cashier cashier = (Cashier) context.getBean("cashier");
//        List<String> isbnList =
//                Arrays.asList(new String[] { "0001", "0002" });
//        cashier.checkout(isbnList, "user1");

        final BookShop bookShop = (BookShop) context.getBean("bookShop");

        Thread thread1 = new Thread(new Runnable() {
            public void run() {
                bookShop.checkStock("0001");
            }
        }, "Thread 1");

        Thread thread2 = new Thread(new Runnable() {
            public void run() {
                try {
                    bookShop.increaseStock("0001", 5);
                } catch (RuntimeException e) {}
            }
        }, "Thread 2");

        thread1.start();
        try {
            Thread.sleep(5000);
        } catch (InterruptedException e) {}
        thread2.start();
    }
}
