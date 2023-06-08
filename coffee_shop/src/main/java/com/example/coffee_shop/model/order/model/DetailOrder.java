package com.example.coffee_shop.model.order.model;

import com.example.coffee_shop.model.product.model.Product;

public class DetailOrder {
    private int id;
    private int quality;
    private Order order;
    private Product product;

    public DetailOrder(int quality, Order order, Product product) {
        this.quality = quality;
        this.order = order;
        this.product = product;
    }

    public DetailOrder(int id, int quality, Order order, Product product) {
        this.id = id;
        this.quality = quality;
        this.order = order;
        this.product = product;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getQuality() {
        return quality;
    }

    public void setQuality(int quality) {
        this.quality = quality;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
}
