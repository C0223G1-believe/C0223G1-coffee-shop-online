package com.example.coffee_shop.product.service;

import com.example.coffee_shop.product.model.Product;
import com.example.coffee_shop.product.repository.ProductRepository;

import java.util.List;

public class ProductService implements IProductService{
    ProductRepository productRepository = new ProductRepository();
    @Override
    public List<Product> productList() {
        return productRepository.productList();
    }

    @Override
    public void createProduct(Product product) {
        productRepository.createProduct(product);
    }

    @Override
    public void updateProduct(int id, Product product) {
        productRepository.updateProduct(id,product);
    }

    @Override
    public void deleteProduct(int id) {
         productRepository.deleteProduct(id);
    }
}
