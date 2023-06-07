package com.example.coffee_shop.cart.service;

import com.example.coffee_shop.cart.model.Cart;
import com.example.coffee_shop.cart.repository.OderRepository;
import com.example.coffee_shop.user.model.User;

public class OderService implements  IOderService{
    OderRepository oderRepository = new OderRepository();
    @Override
    public void addOrder(User user, Cart cart, String comment, String address) {

        oderRepository.addOrder(user,cart,comment,address);
    }
}
