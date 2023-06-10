package com.example.coffee_shop.model.order.service;

import com.example.coffee_shop.model.order.model.DetailOrder;
import com.example.coffee_shop.model.order.model.Order;
import com.example.coffee_shop.model.order.model.StatusOrder;

import java.util.List;

public interface IOrderService {
    //display
    List<Order> displayOrder();
    List<StatusOrder> displayStatus();
    //add

    //edit
    boolean editOrder(int idOrder, int idStatus);

    //findByid
    List<DetailOrder> findById(int id);
    Order showOrder(int id);
    //delete
    boolean deleteOrder(int id);
    List<Order> searchOrder(String userName, String status);

}
