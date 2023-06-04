package com.example.coffee_shop.user.service.user_service;

import com.example.coffee_shop.user.model.User;

import java.util.List;

public interface IUserService {
    // display
    List<User> displayUser();
    // add
    boolean addUser(User user);
    // edit
    boolean editUser(User user);
    //delete
    void deleteUser(int id);
    // find
    User findById(int id);
    // Search
    List<User> searchUser(String userName);
    boolean checkUserName(String userName);
}
