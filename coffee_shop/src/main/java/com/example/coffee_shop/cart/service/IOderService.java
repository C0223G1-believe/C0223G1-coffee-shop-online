package com.example.coffee_shop.cart.service;

import com.example.coffee_shop.cart.model.Cart;
import com.example.coffee_shop.user.model.User;

public interface IOderService {
    void addOrder(User user, Cart cart, String comment, String address);
}
