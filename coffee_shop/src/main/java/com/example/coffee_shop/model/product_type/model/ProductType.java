package com.example.coffee_shop.model.product_type.model;

public class ProductType {
    int productTypeId ;
    String productTypeName;

    public ProductType() {
    }

    public ProductType(String productTypeName) {
        this.productTypeName = productTypeName;
    }

    public ProductType(int productTypeId, String productTypeName) {
        this.productTypeId = productTypeId;
        this.productTypeName = productTypeName;
    }

    public int getProductTypeId() {
        return productTypeId;
    }

    public void setProductTypeId(int productTypeId) {
        this.productTypeId = productTypeId;
    }

    public String getProductTypeName() {
        return productTypeName;
    }

    public void setProductTypeName(String productTypeName) {
        this.productTypeName = productTypeName;
    }
}
