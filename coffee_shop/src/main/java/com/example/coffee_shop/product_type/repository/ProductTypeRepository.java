package com.example.coffee_shop.product_type.repository;

import com.example.coffee_shop.BaseRepository;
import com.example.coffee_shop.product_type.model.ProductType;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductTypeRepository implements IProductTypeRepository {
    BaseRepository baseRepository = new BaseRepository();
    private static final String LIST_PRODUCT_SQL = "select * from product_type;";
    private static final String INSERT_PRODUCT_SQL = "INSERT INTO product_type (product_type_name) VALUES (?);";
    private static final String UPDATE_PRODUCT_SQL = "UPDATE product_type SET product_type_name = ? WHERE product_type_id = ?;";
    private static final String GET_PRODUCT_BY_NAME = "select * from product_type where (product_type_name =?)";
    private static final String DELETE_PRODUCT_BY_ID = "delete from product_type where product_type_id = ?;";

    @Override
    public List<ProductType> displayListProductType() {

        List<ProductType> productTypeList = new ArrayList<>();
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(LIST_PRODUCT_SQL);
            preparedStatement.executeQuery();
            ResultSet resultSet = preparedStatement.getResultSet();
            while (resultSet.next()) {
                int id = resultSet.getInt("product_type_id");
                String name = resultSet.getString("product_type_name");
                ProductType productType = new ProductType(id, name);
                productTypeList.add(productType);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productTypeList;
    }

    @Override
    public void addProductType(ProductType productType) {
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PRODUCT_SQL);
            preparedStatement.setString(1, productType.getProductTypeName());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

    }

    @Override
    public void editProductType(ProductType productType) {
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_PRODUCT_SQL);
            preparedStatement.setString(1, productType.getProductTypeName());
            preparedStatement.setInt(2, productType.getProductTypeId());
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

    }

    @Override
    public void deleteProductType(int id) {
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_PRODUCT_BY_ID);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    @Override
    public ProductType getProductTypeByName(String name) {
        ProductType productType = null;
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(GET_PRODUCT_BY_NAME);
            preparedStatement.setString(1, name);
            ResultSet resultSet = preparedStatement.getResultSet();
            while (resultSet.next()) {
                String id = String.valueOf(resultSet.getInt("product_type_id"));
                productType = new ProductType(name);
            }
            preparedStatement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productType;
    }

    @Override
    public List<ProductType> SearchProductTypeByName(String name) {
        List<ProductType>productTypeList = new ArrayList<>();
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(GET_PRODUCT_BY_NAME);
            preparedStatement.setString(1,name);
            preparedStatement.executeQuery();
            ResultSet resultSet = preparedStatement.getResultSet();
            while (resultSet.next()){
                int id = resultSet.getInt("product_type_id");
                String nameSearch = resultSet.getString("product_type_name");
                productTypeList.add(new ProductType(id,nameSearch));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productTypeList;
    }
}
