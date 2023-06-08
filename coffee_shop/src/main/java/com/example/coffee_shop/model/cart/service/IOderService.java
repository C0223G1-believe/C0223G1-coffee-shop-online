package com.example.coffee_shop.model.cart.service;

import com.example.coffee_shop.model.cart.model.Cart;
import com.example.coffee_shop.model.user.model.User;

public interface IOderService {
    void addOrder(User user, Cart cart, String comment, String address);
}
