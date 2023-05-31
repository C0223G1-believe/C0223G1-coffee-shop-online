package order.service;

import order.model.Order;

import java.util.List;

public interface OrderSevice {
    //    display
    List<Order> displayOrder();
    //    add
    boolean addOrder(List<Order> orderList);
    //  edit
    boolean editOrder(List<Order> orderList);
    //    delete
    boolean deleteOrder( int id);
}
