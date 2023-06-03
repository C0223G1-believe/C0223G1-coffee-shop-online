package com.example.coffee_shop.user.repository.repoUser;

import com.example.coffee_shop.BaseRepository;
import com.example.coffee_shop.user.model.TypeUser;
import com.example.coffee_shop.user.model.User;
import com.mysql.cj.xdevapi.PreparableStatement;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserRepositoryImpl implements IUserRepository {
    BaseRepository baseRepository = new BaseRepository();
    private static final String INSERT_INTO_USER =
            "INSERT INTO user(name_user,user_name,user_password,user_email,user_phone_number) " +
                    " VALUES(?,?,?,?,?);";
    private static final String SELECT_USER = " SELECT * from user " +
            " JOIN type_user as tus on tus.id_type_user = user.id_type_user;";
    private static final String UPDATE_USER = "UPDATE user " +
            " SET name_user = ?," +
            " user_name = ?," +
            " user_password = ?," +
            " user_email = ?," +
            " user_phone_number = ?" +
            " WHERE id = ?;";

    @Override
    public boolean addUser(User user) {
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO_USER);
            preparedStatement.setString(1, user.getYourName());
            preparedStatement.setString(2, user.getUserName());
            preparedStatement.setString(3, user.getUserPassword());
            preparedStatement.setString(4, user.getUserEmail());
            preparedStatement.setString(5, user.getUserPhoneNumber());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
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
        List<User> userList =new ArrayList<>();

        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SELECT_USER);
            while (resultSet.next()) {
                int id = resultSet.getInt("user_id");
                String yourName = resultSet.getString("name_user");
                String userName = resultSet.getString("user_name");
                String password = resultSet.getString("user_password");
                String email = resultSet.getString("user_email");
                String phoneNumber = resultSet.getString("user_phone_number");
                int idTypeUser = resultSet.getInt("id_type_user");
                String nameTypeUser = resultSet.getString("name_type");
                TypeUser typeUser = new TypeUser(idTypeUser, nameTypeUser);
                userList.add(new User(id,yourName,userName,password,email,phoneNumber,typeUser));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }finally{
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return userList;
    }


    @Override
    public boolean editUser(User user) {
        Connection connection =baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USER);
            preparedStatement.setString(1,user.getYourName());
            preparedStatement.setString(2,user.getUserName());
            preparedStatement.setString(3,user.getUserPassword());
            preparedStatement.setString(4,user.getUserEmail());
            preparedStatement.setString(5,user.getUserPhoneNumber());
            preparedStatement.setInt(6,user.getId());
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

        return false;
    }

    @Override
    public User findById(int id) {
        Connection connection = baseRepository.getConnection();
        User user= null;
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * from user " +
                    " JOIN type_user on type_user.id_type_user = user.id_type_user " +
                    " where user.user_id =" +id);
            while(resultSet.next()){
                String yourName = resultSet.getString("name_user");
                String userName = resultSet.getString("user_name");
                String password = resultSet.getString("user_password");
                String email = resultSet.getString("user_email");
                String phoneNumber = resultSet.getString("user_phone_number");
                int idTypeUser = resultSet.getInt("id_type_user");
                String nameTypeUser = resultSet.getString("name_type");
                TypeUser typeUser = new TypeUser(idTypeUser,nameTypeUser);
                 user = new User(id,yourName,userName,password,email,phoneNumber,typeUser);
             }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }

    @Override
    public List<User> searchUser(String name) {
        return null;
    }

    @Override
    public User checkUserName(String userName) {
        return null ;
    }
}
