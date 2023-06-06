package com.example.coffee_shop.order.repository;

import com.example.coffee_shop.BaseRepository;
import com.example.coffee_shop.order.model.Order;

import java.sql.Connection;
import java.util.List;

public class OrderRepostiory implements IOrderRepository {
    private BaseRepository baseRepository = new BaseRepository();
    private static final String SELECT_ORDER = " SELECT * FROM `order` as o " +
            " JOIN detail_order as detail on detail.order_id = o.order_id " +
            " JOIN product as pro on pro.product_id = detail.order_id " +
            " JOIN `status` as sta on sta.id = o.id_status " +
            " JOIN `user` on `user`.user_id = o.user_id ";
    @Override
    public List<Order> displayOrder() {
        Connection connection = baseRepository.getConnection();

        return null;
    }

    @Override
    public boolean editOrder(Order order) {
        return false;
    }

    @Override
    public Order findById(int id) {
        return null;
    }

    @Override
    public boolean deleteOrder(int id) {
        return false;
    }
}
