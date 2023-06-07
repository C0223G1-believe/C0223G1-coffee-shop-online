package com.example.coffee_shop.user;

public class Regex {

    public static boolean validFullName(String name) {
        String regEx = "^(\\w+)$";
        return name.matches(regEx);
    }
}
