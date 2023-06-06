package com.example.coffee_shop.order.service;

import com.example.coffee_shop.order.model.Order;

import java.util.List;

public interface IOrderService {
    //display
    List<Order> displayOrder();
    //add

    //edit
    boolean editOrder(Order order);
    //findByid
    Order findById(int id);
    //delete
    boolean deleteOrder(int id);

}
