package com.example.coffee_shop.model.user.service;

public class Regex {

    public static boolean validFullName(String name) {
        String regEx = "^(\\w+)$";
        return name.matches(regEx);
    }
}
