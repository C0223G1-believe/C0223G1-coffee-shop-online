package com.example.coffee_shop.model.order.model;

public class StatusOrder {
    private int id;
    private String nameStatus;

    public StatusOrder(int id) {
        this.id = id;
    }

    public StatusOrder(int id, String nameStatus) {
        this.id = id;
        this.nameStatus = nameStatus;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNameStatus() {
        return nameStatus;
    }

    public void setNameStatus(String nameStatus) {
        this.nameStatus = nameStatus;
    }
}
