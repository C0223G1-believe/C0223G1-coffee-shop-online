package com.example.coffee_shop.model.product_type.service;

import com.example.coffee_shop.model.product_type.model.ProductType;

import java.util.List;

public interface IProductTypeService {
    List<ProductType> displayListProductType();

    void addProductType(ProductType productType);

    void editProductType(ProductType productType);

    void deleteProductType(int id);

    ProductType getProductTypeById(String name);

    List<ProductType>SearchProductTypeByName(String name);
}
