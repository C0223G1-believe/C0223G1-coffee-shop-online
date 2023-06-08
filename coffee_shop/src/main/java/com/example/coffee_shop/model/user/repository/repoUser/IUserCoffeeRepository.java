package com.example.coffee_shop.model.user.repository.repoUser;

import com.example.coffee_shop.model.user.model.User;

import java.util.List;

public interface IUserCoffeeRepository {
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
    List<User> searchUser(String userName,String phone);

    boolean checkUserName(String userName, String eimail, String phone);

    User getUserByPhoneAndPass(String phone, String pass);
}
