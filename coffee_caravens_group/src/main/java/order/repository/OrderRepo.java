package order.repository;

import order.model.Order;

import java.util.ArrayList;
import java.util.List;

public interface OrderRepo {
//    display
    List<Order> displayOrder();
//    add
    boolean addOrder(List<Order> orderList);
//  edit
    boolean editOrder(List<Order> orderList);
//    delete
    boolean deleteOrder( int id);
}
