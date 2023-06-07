package com.example.coffee_shop.order.repository;

import com.example.coffee_shop.order.model.DetailOrder;
import com.example.coffee_shop.order.model.Order;
import com.example.coffee_shop.order.model.StatusOrder;

import java.util.List;

public interface IOrderRepository{
    //display
    List<Order> displayOrder();
    //add

    //edit
    boolean editOrder(int idOrder, int idStatus);
    //findByid
    List<DetailOrder> findById(int id);
    Order order(int id);
    //delete
    boolean deleteOrder(int id);



}
