package com.example.coffee_shop.order.service;

import com.example.coffee_shop.order.model.DetailOrder;
import com.example.coffee_shop.order.model.Order;
import com.example.coffee_shop.order.model.StatusOrder;
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
    public boolean editOrder(int idOrder, int idStatus) {
        return orderRepository.editOrder(idOrder,idStatus);
    }

    @Override
    public Order showOrder(int id) {
        return orderRepository.order(id);
    }

    @Override
    public List<DetailOrder> findById(int id) {
        return orderRepository.findById(id);
    }

    @Override
    public boolean deleteOrder(int id) {
        return orderRepository.deleteOrder(id);
    }

    @Override
    public List<Order> searchOrder(String userName, String status) {
        return orderRepository.searchOrder(userName, status);
    }
}
