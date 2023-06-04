package com.example.coffee_shop.product.service;

import com.example.coffee_shop.product.model.Product;

import java.util.List;

public interface IProductService {
    List<Product> productList();
    void createProduct (Product product);
    void updateProduct (int id,Product product);
    void deleteProduct (int id);
}
