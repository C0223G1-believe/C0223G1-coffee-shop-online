package com.example.coffee_shop.model.cart.repository;

import com.example.coffee_shop.BaseRepository;
import com.example.coffee_shop.model.cart.model.Cart;
import com.example.coffee_shop.model.cart.model.Item;
import com.example.coffee_shop.model.user.model.User;

import java.sql.*;
import java.time.LocalDate;

public class OderRepository {
    BaseRepository baseRepository = new BaseRepository();
    private static final String ADD_ORDER = "INSERT INTO `order` (order_date, comment, address, user_id, id_status) VALUES (?,?,?,?,?)";

    public void addOrder(User user, Cart cart, String comment, String address) {
        //add vao order
        Connection connection = baseRepository.getConnection();
        LocalDate curDate = java.time.LocalDate.now();
        String date = curDate.toString();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(ADD_ORDER);
            preparedStatement.setString(1, date);
            preparedStatement.setString(2, comment);
            preparedStatement.setString(3, address);
            preparedStatement.setInt(4, user.getId());
            preparedStatement.setInt(5, 1);
            preparedStatement.executeUpdate();
            // lay id cua oder vua add
            PreparedStatement preparedStatement1 = connection.prepareStatement("select * from  `order` order by order_id desc limit 1");
            ResultSet resultSet = preparedStatement1.executeQuery();
            //add vao order_detail
            if (resultSet.next()){
                int idOrder = resultSet.getInt("order_id");
                for (Item i: cart.getItems()) {
                    PreparedStatement preparedStatement2 = connection.prepareStatement("INSERT INTO detail_order (quality, order_id, product_id) VALUES (?,?,?)");
                    preparedStatement2.setInt(1,i.getQuanitity());
                    preparedStatement2.setInt(2,idOrder);
                    preparedStatement2.setInt(3,i.getProduct().getProductID());
                    preparedStatement2.executeUpdate();
                }

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

//    ----------------------------------------------------------------------
//
//
//
//
//
//    public void addOrder1(User user, String comment, String address) {
//        Connection connection = baseRepository.getConnection();
//        LocalDate curDate = java.time.LocalDate.now();
//        String date = curDate.toString();
//        try {
//            PreparedStatement preparedStatement = connection.prepareStatement(ADD_ORDER);
//            preparedStatement.setString(1, date);
//            preparedStatement.setString(2, comment);
//            preparedStatement.setString(3, address);
//            preparedStatement.setInt(4, user.getId());
//            preparedStatement.setInt(5, 1);
//            preparedStatement.executeUpdate();
//
//    }catch (SQLException e) {
//            e.printStackTrace();
//        }
//    }
//
//    public void addOrder2(User user,Cart cart, String comment, String address) {
//        Connection connection = baseRepository.getConnection();
//        PreparedStatement preparedStatement1 = null;
//        try {
//            preparedStatement1 = connection.prepareStatement("select * from  `order` order by order_id desc limit 1");
//            ResultSet resultSet = preparedStatement1.executeQuery();
//            if (resultSet.next()){
//                int idOrder = resultSet.getInt("order_id");
//                for (Item i: cart.getItems()) {
//                    PreparedStatement preparedStatement2 = connection.prepareStatement("INSERT INTO detail_order (quality, order_id, product_id) VALUES (?,?,?)");
//                    preparedStatement2.setInt(1,i.getQuanitity());
//                    preparedStatement2.setInt(2,idOrder);
//                    preparedStatement2.setInt(2,i.getProduct().getProductID());
//                    preparedStatement.executeUpdate();
//                    p
//                }
//
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//
//
//
//
//    }
}

