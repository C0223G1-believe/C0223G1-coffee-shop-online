package com.example.coffee_shop.user.service.type_user_service;

import com.example.coffee_shop.user.model.Role;
import com.example.coffee_shop.user.repository.repoTypeUser.ITypeUserRepository;
import com.example.coffee_shop.user.repository.repoTypeUser.TypeUserRepositoryImpl;

import java.util.List;

public class TypeUserServiceImpl implements ITypeUserService{
    ITypeUserRepository typeUserRepository = new TypeUserRepositoryImpl();

    @Override
    public List<Role> displayRole() {
        return typeUserRepository.displayRole();
    }
}
