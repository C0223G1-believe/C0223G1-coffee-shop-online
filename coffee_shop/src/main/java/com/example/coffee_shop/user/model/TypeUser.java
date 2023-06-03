package com.example.coffee_shop.user.model;

public class TypeUser {
    private int id;
    private String name;

    public TypeUser(int id) {
        this.id = id;
    }
    public TypeUser(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


}
