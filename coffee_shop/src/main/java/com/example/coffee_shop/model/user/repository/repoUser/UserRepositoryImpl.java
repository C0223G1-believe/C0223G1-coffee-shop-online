package com.example.coffee_shop.model.user.repository.repoUser;

import com.example.coffee_shop.BaseRepository;

import com.example.coffee_shop.model.user.model.Role;
import com.example.coffee_shop.model.user.model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserRepositoryImpl implements IUserCoffeeRepository{
    BaseRepository baseRepository = new BaseRepository();
    private static final String INSERT_INTO_USER =
            "INSERT INTO user(user_name,user_password,user_email,user_phone_number) " +
                    " VALUES(?,?,?,?);";
    private static final String SELECT_USER = " SELECT * from user " +
            " JOIN role as tus on tus.id_role= user.id_role;";
    private static final String UPDATE_USER = "UPDATE user " +
            " SET user_name = ?," +
            " user_password = ?," +
            " user_email = ?," +
            " user_phone_number = ?," +
            " id_role = ? " +
            " WHERE user_id = ?";
    private static final String DELETE_USER =" DELETE from user where user.user_id = ? ";
    private static final String SELECT_USER_BY_PHONE_AND_PASS ="SELECT * FROM user " +
            "JOIN role ON role.id_role = user.id_role " +
            "WHERE  user_phone_number =? && user_password =?;";

    @Override
    public boolean addUser(User user) {
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO_USER);
            preparedStatement.setString(1, user.getUserName());
            preparedStatement.setString(2, user.getUserPassword());
            preparedStatement.setString(3, user.getUserEmail());
            preparedStatement.setString(4, user.getUserPhoneNumber());
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
                String userName = resultSet.getString("user_name");
                String password = resultSet.getString("user_password");
                String email = resultSet.getString("user_email");
                String phoneNumber = resultSet.getString("user_phone_number");
                int idRole = resultSet.getInt("id_role");
                String nameRole = resultSet.getString("name_role");
                Role role = new Role(idRole, nameRole);
                userList.add(new User(id,userName,password,email,phoneNumber,role));
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
            preparedStatement.setString(1,user.getUserName());
            preparedStatement.setString(2,user.getUserPassword());
            preparedStatement.setString(3,user.getUserEmail());
            preparedStatement.setString(4,user.getUserPhoneNumber());
            preparedStatement.setInt(5,user.getRole().getId());
            preparedStatement.setInt(6,user.getId());
            preparedStatement.executeUpdate();
            return true;
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
    public void deleteUser(int id) {
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_USER);
            preparedStatement.setInt(1, id);
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
    }

    @Override
    public User findById(int id) {
        Connection connection = baseRepository.getConnection();
        User user= null;
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * from user " +
                    " JOIN role on role.id_role = user.id_role" +
                    " where user.user_id =" +id);
            while(resultSet.next()){
                String userName = resultSet.getString("user_name");
                String password = resultSet.getString("user_password");
                String email = resultSet.getString("user_email");
                String phoneNumber = resultSet.getString("user_phone_number");
                int idRole = resultSet.getInt("id_role");
                String nameRole = resultSet.getString("name_role");
                Role typeUser = new Role(idRole,nameRole);
                user = new User(id,userName,password,email,phoneNumber,typeUser);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }

    @Override
    public List<User> searchUser(String phone) {
        Connection connection = baseRepository.getConnection();
        List<User> userList = new ArrayList<>();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * from user " +
                    " join role ON role.id_role = user.id_role " +
                    " WHERE user.user_phone_number like '%"+phone+"%' ");
            while(resultSet.next()){
                int id = resultSet.getInt("user_id");
                String name = resultSet.getString("user_name");
                String password = resultSet.getString("user_password");
                String email = resultSet.getString("user_email");
                String phoneNumber = resultSet.getString("user_phone_number");
                int idRole = resultSet.getInt("id_role");
                String nameRole = resultSet.getString("role.name_role");
                Role role = new Role(idRole,nameRole);
                userList.add(new User(id,name,password,email,phoneNumber,role));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return userList;
    }

    @Override
    public boolean checkUserName(String eimail, String phone) {
        Connection connection = baseRepository.getConnection();
        int id;
        String password;
        String email = null;
        String phoneNumber = null;
        String userNam = null;
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * from user");
            while(resultSet.next()){
                id = resultSet.getInt("user_id");
                userNam =resultSet.getString("user_name");
                password = resultSet.getString("user_password");
                email = resultSet.getString("user_email");
                phoneNumber = resultSet.getString("user_phone_number");
                if (email.equals(eimail)&&phoneNumber.equals(phone)){
                    return true;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return false ;
    }

    @Override
    public User getUserByPhoneAndPass(String phone, String pass) {
        Connection connection = baseRepository.getConnection();
        User user = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_PHONE_AND_PASS);
            preparedStatement.setString(1,phone);
            preparedStatement.setString(2,pass);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("user_id");
                String userName = resultSet.getString("user_name");
                String password = resultSet.getString("user_password");
                String email = resultSet.getString("user_email");
                String phoneNumber = resultSet.getString("user_phone_number");
                int idRole = resultSet.getInt("id_role");
                String nameRole = resultSet.getString("name_role");
                Role role = new Role(idRole, nameRole);
                user = new User(id,userName,password,email,phoneNumber,role);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
}