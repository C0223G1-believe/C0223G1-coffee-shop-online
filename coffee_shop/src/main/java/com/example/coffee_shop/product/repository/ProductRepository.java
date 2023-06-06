package com.example.coffee_shop.product.repository;

import com.example.coffee_shop.BaseRepository;
import com.example.coffee_shop.product.model.Product;
import com.example.coffee_shop.product.model.TypeProduct;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository{
    BaseRepository baseRepository = new BaseRepository();
    private static final String SELECT_ALL_PRODUCT =  " select * from product " +
            "join product_type on product_type.product_type_id = product.product_type_id; ";
    private static final String INSERT_PRODUCT = "insert into product(product_name,product_price,product_description,product_image) " +
                                                   "values (?,?,?,?);";

    private static final String DELETE_BY_ID = "delete from product where product_id = ?;";
    private static final String UPDATE_PRODUCT = "UPDATE product SET product_name = ?, product_price =?, product_description = ?, product_image = ? WHERE product_id = ?;";
    private static final String SELECT_PRODUCT_BY_ID = "select * from product where product_id = ?;";

    @Override
    public List<Product> productList() {
        Connection connection = baseRepository.getConnection();
        List<Product> productList = new ArrayList<>();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SELECT_ALL_PRODUCT);
            while (resultSet.next()){
                int id = resultSet.getInt("product_id");
                String name = resultSet.getString("product_name");
                double price = resultSet.getDouble("product_price");
                String description = resultSet.getString("product_description");
                String image = resultSet.getString("product_image");
                int idTypeProduct = resultSet.getInt("product.product_type_id");
                String nameTypeProduct = resultSet.getString("product_type_name");
                TypeProduct typeProduct = new TypeProduct(idTypeProduct,nameTypeProduct);
                productList.add(new Product(id,name,price,description,image,typeProduct));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return productList;
    }

    @Override
    public void createProduct(Product product) {
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PRODUCT);
            preparedStatement.setString(1,product.getProductName());
            preparedStatement.setDouble(2,product.getProductPrice());
            preparedStatement.setString(3,product.getProductDescription());
            preparedStatement.setString(4,product.getProductImage());
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
    public void updateProduct(int id, Product product) {
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_PRODUCT);
            preparedStatement.setString(1,product.getProductName());
            preparedStatement.setDouble(2,product.getProductPrice());
            preparedStatement.setString(3,product.getProductDescription());
            preparedStatement.setString(4,product.getProductImage());
            preparedStatement.setInt(5,id);
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
    public void deleteProduct(int id) {
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_BY_ID);
            preparedStatement.setInt(1,id);
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
    public Product searchProduct(int id) {
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PRODUCT_BY_ID);
            preparedStatement.setInt(1,id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return null ;


    }

}
