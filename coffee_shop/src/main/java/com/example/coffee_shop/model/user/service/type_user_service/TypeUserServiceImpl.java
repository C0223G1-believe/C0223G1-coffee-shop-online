package com.example.coffee_shop.model.user.service.type_user_service;

import com.example.coffee_shop.model.user.model.Role;
import com.example.coffee_shop.model.user.repository.repoTypeUser.ITypeUserRepository;
import com.example.coffee_shop.model.user.repository.repoTypeUser.TypeUserRepositoryImpl;

import java.util.List;

public class TypeUserServiceImpl implements ITypeUserService{
    ITypeUserRepository typeUserRepository = new TypeUserRepositoryImpl();

    @Override
    public List<Role> displayRole() {
        return typeUserRepository.displayRole();
    }
}
