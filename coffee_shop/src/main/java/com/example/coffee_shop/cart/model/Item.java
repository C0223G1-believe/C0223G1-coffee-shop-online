package com.example.coffee_shop.cart.model;

import com.example.coffee_shop.product.model.Product;

public class Item {
    private Product product;
    private int quanitity;

    public Item() {
    }

    public Item(Product product, int quanitity) {
        this.product = product;
        this.quanitity = quanitity;
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


}
