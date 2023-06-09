package com.example.coffee_shop.model.product.service;

import com.example.coffee_shop.model.product.model.Product;
import com.example.coffee_shop.model.product.repository.ProductRepository;

import java.util.List;

public class ProductService implements IProductService{
    ProductRepository productRepository = new ProductRepository();
    @Override
    public List<Product> productList() {
        return productRepository.productList();
    }

    @Override
    public boolean findByName(String name) {
        return productRepository.findByName(name);
    }

    @Override
    public void createProduct(Product product, int id) {
        productRepository.createProduct(product, id);
    }

    @Override
    public void updateProduct(int id, Product product,String name) {
        productRepository.updateProduct(id,product,name);
    }

    @Override
    public void deleteProduct(int id) {
        productRepository.deleteProduct(id);
    }

    @Override
    public List<Product> searchProduct(String name) {
        return productRepository.searchProduct(name);
    }

    @Override
    public Product getProductById(int id) {
        return productRepository.getProductById(id);
    }
}