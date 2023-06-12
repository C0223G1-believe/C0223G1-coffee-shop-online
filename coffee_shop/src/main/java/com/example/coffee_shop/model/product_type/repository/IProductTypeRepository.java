package com.example.coffee_shop.model.product_type.repository;

import com.example.coffee_shop.model.product_type.model.ProductType;

import java.util.List;

public interface IProductTypeRepository {
    List<ProductType> displayListProductType();

    void addProductType(ProductType productType);

    void editProductType(ProductType productType);

    void deleteProductType(int id);

    ProductType getProductTypeByName(String name);

    List<ProductType>SearchProductTypeByName(String name);



}
