package com.example.coffee_shop.cart.repository;

import com.example.coffee_shop.cart.model.Cart;
import com.example.coffee_shop.user.model.User;

public interface IOderRepository {
    void addOrder(User user, Cart cart, String comment, String address);
}
