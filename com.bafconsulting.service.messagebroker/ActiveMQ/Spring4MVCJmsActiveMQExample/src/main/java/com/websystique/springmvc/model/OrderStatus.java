package com.websystique.springmvc.model;

public enum OrderStatus {

	CREATED("Created"),
    PENDING("Pending"),
    CONFIRMED("Confirmed"),
    FAILED("Failed");
	
     
    private String status;
     
    private OrderStatus(final String status){
        this.status = status;
    }
     
    public String getStatus(){
        return this.status;
    }
 
    @Override
    public String toString(){
        return this.status;
    }
 
 
    public String getName(){
        return this.name();
    }
}
