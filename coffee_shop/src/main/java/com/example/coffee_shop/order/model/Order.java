package com.example.coffee_shop.order.model;

import com.example.coffee_shop.user.model.User;

import java.util.Date;

public class Order {
    private int id;
    private String orderDate;
    private String comment;
    private String address;
    private User user;
    private StatusOrder statusOrder;

    public Order(int id, User user, StatusOrder statusOrder) {
        this.id = id;
        this.user = user;
        this.statusOrder = statusOrder;
    }

    public Order(String orderDate, String comment, String address, User user, StatusOrder statusOrder) {
        this.orderDate = orderDate;
        this.comment = comment;
        this.address = address;
        this.user = user;
        this.statusOrder = statusOrder;
    }

    public Order(int id, String orderDate, String comment, String address, User user, StatusOrder statusOrder) {
        this.id = id;
        this.orderDate = orderDate;
        this.comment = comment;
        this.address = address;
        this.user = user;
        this.statusOrder = statusOrder;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public StatusOrder getStatusOrder() {
        return statusOrder;
    }

    public void setStatusOrder(StatusOrder statusOrder) {
        this.statusOrder = statusOrder;
    }
}
