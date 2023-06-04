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
    public User findById(int id) {
        return userRepository.findById(id);
    }

    @Override
    public List<User> searchUser(String userName) {
        return userRepository.searchUser(userName);
    }

    @Override
    public boolean checkUserName(String userName) {

        return false;
    }
}
