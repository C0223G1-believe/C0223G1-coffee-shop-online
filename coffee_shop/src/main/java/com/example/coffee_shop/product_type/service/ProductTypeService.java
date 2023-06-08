package com.example.coffee_shop.product_type.service;

import com.example.coffee_shop.product_type.model.ProductType;
import com.example.coffee_shop.product_type.repository.ProductTypeRepository;

import java.util.List;

public class ProductTypeService implements IProductTypeService {
    ProductTypeRepository productTypeRepository = new ProductTypeRepository();

    @Override
    public List<ProductType> displayListProductType() {
        return productTypeRepository.displayListProductType();
    }

    @Override
    public void addProductType(ProductType productType) {
        productTypeRepository.addProductType(productType);

    }

    @Override
    public void editProductType(ProductType productType) {
        productTypeRepository.editProductType(productType);
    }

    @Override
    public void deleteProductType(int id) {
        productTypeRepository.deleteProductType(id);

    }

    @Override
    public ProductType getProductTypeById(String name) {
        return null;
    }

    @Override
    public List<ProductType> SearchProductTypeByName(String name) {
        List<ProductType>productTypeList = productTypeRepository.SearchProductTypeByName(name);
        return productTypeList;
    }
}
