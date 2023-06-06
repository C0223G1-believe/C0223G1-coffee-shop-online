package com.example.coffee_shop.cart.model;

import com.example.coffee_shop.product.model.Product;

public class Item {
    private Product product;
    private int quanitity;
    private double price;

    public Item() {
    }

    public Item(Product product, int quanitity, double price) {
        this.product = product;
        this.quanitity = quanitity;
        this.price = price;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuanitity() {
        return quanitity;
    }

    public void setQuanitity(int quanitity) {
        this.quanitity = quanitity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

}
