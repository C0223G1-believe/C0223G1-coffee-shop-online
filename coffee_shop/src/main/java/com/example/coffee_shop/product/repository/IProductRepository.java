package com.example.coffee_shop.product.repository;

import com.example.coffee_shop.product.model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> productList();

    void createProduct(Product product);

    void updateProduct(int id, Product product);

    void deleteProduct(int id);

    Product searchProduct(int id);

    public Product getProductById(int id);
}
