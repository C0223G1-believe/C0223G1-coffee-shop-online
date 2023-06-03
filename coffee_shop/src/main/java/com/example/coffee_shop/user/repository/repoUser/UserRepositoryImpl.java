package com.example.coffee_shop.user.repository.repoUser;

import com.example.coffee_shop.BaseRepository;
import com.example.coffee_shop.user.model.User;

import java.sql.*;
import java.util.Collections;
import java.util.List;

public class UserRepositoryImpl implements IUserRepository {
    BaseRepository baseRepository = new BaseRepository();
    private static final String INSERT_INTO_USER =
            "INSERT INTO user(name_user,user_name,user_password,user_email,user_phone_number) " +
            " VALUES(?,?,?,?,?);";
    private static final String SELECT_USER = "SELECT * from user " +
            " JOIN type_user as tus on tus.id_type_user=user.id_type_user;";
    private static final String UPDATE_USER = "";

    @Override
    public boolean addUser(User user) {
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO_USER);
            preparedStatement.setString(1,user.getNameUser());
            preparedStatement.setString(2,user.getUserName());
            preparedStatement.setString(3,user.getUserPassword());
            preparedStatement.setString(4,user.getUserEmail());
            preparedStatement.setString(5,user.getUserPhoneNumber());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally{
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return true;
    }


    @Override
    public List<User> displayUser() {
        Connection connection = baseRepository.getConnection();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SELECT_USER);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }


    @Override
    public boolean editUser(User user) {
        return false;
    }

    @Override
    public User findById(int id) {
        return null;
    }

    @Override
    public List<User> searchUser(String name) {
        return null;
    }
}
