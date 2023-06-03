package com.example.coffee_shop.user.repository.repoUser;

import com.example.coffee_shop.user.model.User;

import java.util.List;

public interface IUserCoffeeRepository {
    // display
    List<User> displayUser();
    // add
    boolean addUser(User user);
    // edit
    boolean editUser(User user);
    // find
    User findById(int id);
    // Search
    List<User> searchUser(String name);
    boolean checkUserName(String userName);
}
