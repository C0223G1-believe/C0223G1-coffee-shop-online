package com.example.coffee_shop.user.service.user_service;

import com.example.coffee_shop.user.model.User;
import com.example.coffee_shop.user.repository.repoUser.IUserCoffeeRepository;
import com.example.coffee_shop.user.repository.repoUser.UserRepositoryImpl;

import java.util.List;

public class UserServiceImpl implements IUserService {
    IUserCoffeeRepository userRepository = new UserRepositoryImpl();
    @Override
    public List<User> displayUser() {
        return userRepository.displayUser();
    }

    @Override
    public boolean addUser(User user) {
        return userRepository.addUser(user);
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
    public List<User> searchUser(String userName, String phone) {
        return userRepository.searchUser(userName,phone);
    }

    @Override
    public boolean checkUserName(String userName, String eimail,String phone) {
        return userRepository.checkUserName(userName,eimail,phone);
    }

    @Override
    public User getUserByPhoneAndPass(String phone, String pass) {
        return userRepository.getUserByPhoneAndPass(phone, pass);
    }
}
