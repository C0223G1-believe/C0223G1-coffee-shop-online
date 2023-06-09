package com.example.coffee_shop.model.product.service;

import com.example.coffee_shop.model.product.model.Product;

import java.util.List;

public interface IProductService {
    List<Product> productList();

    boolean findByName (String name);

    void createProduct(Product product, int id);

    void updateProduct(int id, Product product, String name);

    void deleteProduct(int id);

    Product searchProduct(String name);

    public Product getProductById(int id);

    List<Product> productListByType(int idType);
}