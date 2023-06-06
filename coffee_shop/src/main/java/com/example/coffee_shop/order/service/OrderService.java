package com.example.coffee_shop.order.service;

import com.example.coffee_shop.order.model.Order;
import com.example.coffee_shop.order.repository.IOrderRepository;
import com.example.coffee_shop.order.repository.OrderRepostiory;

import java.util.List;

public class OrderService implements IOrderService {
    IOrderRepository orderRepository = new OrderRepostiory();
    @Override
    public List<Order> displayOrder() {
        return orderRepository.displayOrder() ;
    }

    @Override
    public boolean editOrder(Order order) {
        return orderRepository.editOrder(order);
    }

    @Override
    public Order findById(int id) {
        return orderRepository.findById(id);
    }

    @Override
    public boolean deleteOrder(int id) {
        return orderRepository.deleteOrder(id);
    }
}
