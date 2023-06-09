package com.example.coffee_shop.model.user.service.user_service;


import com.example.coffee_shop.model.user.model.User;
import com.example.coffee_shop.model.user.repository.repoUser.IUserCoffeeRepository;
import com.example.coffee_shop.model.user.repository.repoUser.UserRepositoryImpl;
import com.example.coffee_shop.model.user.service.Regex;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class UserServiceImpl implements IUserService {
    IUserCoffeeRepository userRepository = new UserRepositoryImpl();
    @Override
    public List<User> displayUser() {
        return userRepository.displayUser();
    }

    @Override
    public boolean addUser(HttpServletRequest request, HttpServletResponse response) {
        String phoneNumber = request.getParameter("phone");
        String email = request.getParameter("email");
        String userName = request.getParameter("userName");
        String password1 = request.getParameter("password1");
        String password2 = request.getParameter("password2");
        User user = new User(userName, password1, email, phoneNumber);
        if (!Regex.validFullName(userName)) {
            return false;
        } else if (!Regex.validFullName(password1)) {
            return false;
        } else if (password1 == password2 && password1 != "" || password2 != "") {
            userRepository.addUser(user);
            return true;
        } else {
            return false;
        }

    }

    @Override
    public boolean editUser(User user) {
        return userRepository.editUser(user);
    }

    @Override
    public void deleteUser(int id) {
        userRepository.deleteUser(id);
    }

    @Override
    public User findById(int id) {
        return userRepository.findById(id);
    }

    @Override
    public List<User> searchUser(String phone) {
        return userRepository.searchUser(phone);
    }

    @Override
    public boolean checkUserName(String eimail, String phone) {
        return userRepository.checkUserName(eimail,phone);
    }

    @Override
    public User getUserByPhoneAndPass(String phone, String pass) {
        return userRepository.getUserByPhoneAndPass(phone, pass);
    }
}
