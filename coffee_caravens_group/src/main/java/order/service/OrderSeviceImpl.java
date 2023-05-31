package order.service;

import order.model.Order;
import order.repository.OrderRepo;
import order.repository.OrderRepoImpl;

import java.util.List;

public class OrderSeviceImpl implements OrderSevice{
    OrderRepo orderRepo = new OrderRepoImpl();
    @Override
    public List<Order> displayOrder() {
        return orderRepo.displayOrder();
    }

    @Override
    public boolean addOrder(List<Order> orderList) {
        if (orderRepo.addOrder(orderList)){
            return true;
        }
        return false;
    }

    @Override
    public boolean editOrder(List<Order> orderList) {
        if (orderRepo.editOrder(orderList)){
            return true;
        }
        return false;
    }

    @Override
    public boolean deleteOrder(int id) {
        if (orderRepo.deleteOrder(id)){
            return true;
        }
        return false;
    }
}
