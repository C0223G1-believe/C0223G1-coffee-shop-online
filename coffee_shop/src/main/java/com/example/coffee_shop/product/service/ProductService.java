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
    public Product searchProduct(String name) {
        return productRepository.searchProduct(name);
    }
}
