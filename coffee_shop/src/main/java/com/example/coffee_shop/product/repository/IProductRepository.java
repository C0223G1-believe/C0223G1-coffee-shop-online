package com.example.coffee_shop.product.repository;

import com.example.coffee_shop.product.model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> productList();

    void createProduct(Product product, int id);

    void updateProduct(int id, Product product, String name);

    void deleteProduct(int id);

    Product searchProduct(String name);

    Product getProductById(int id);
}
