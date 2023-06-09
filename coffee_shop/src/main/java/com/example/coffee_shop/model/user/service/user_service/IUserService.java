package com.example.coffee_shop.model.user.service.user_service;

import com.example.coffee_shop.model.user.model.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public interface IUserService {
    // display
    List<User> displayUser();

    // add
    boolean addUser(HttpServletRequest request, HttpServletResponse response);

    // edit
    boolean editUser(User user);

    //delete
    void deleteUser(int id);

    // find
    User findById(int id);

    // Search
    List<User> searchUser( String phone);

    boolean checkUserName(String eimail,String phone);

    User getUserByPhoneAndPass(String phone, String pass);
}
