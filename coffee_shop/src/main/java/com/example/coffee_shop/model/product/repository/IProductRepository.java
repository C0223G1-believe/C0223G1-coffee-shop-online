package com.example.coffee_shop.model.product.repository;

import com.example.coffee_shop.model.product.model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> productList();

    boolean findByName(String name);

    void createProduct(Product product, int id);

    void updateProduct(int id, Product product, String name);

    void deleteProduct(int id);

    List<Product> searchProduct(String name);

    Product getProductById(int id);
}