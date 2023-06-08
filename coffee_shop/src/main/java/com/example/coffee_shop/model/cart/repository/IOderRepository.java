package com.example.coffee_shop.model.cart.repository;

import com.example.coffee_shop.model.cart.model.Cart;
import com.example.coffee_shop.model.user.model.User;

public interface IOderRepository {
    void addOrder(User user, Cart cart, String comment, String address);
}
