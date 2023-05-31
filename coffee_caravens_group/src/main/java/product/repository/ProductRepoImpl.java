package product.repository;

import product.model.Product;

import java.util.List;

public class ProductRepoImpl implements ProductRepo{
    @Override
    public List<Product> displayProduct() {
        return null;
    }

    @Override
    public boolean addOrder(List<Product> orderList) {
        return false;
    }

    @Override
    public boolean editProduct(List<Product> orderList) {
        return false;
    }

    @Override
    public boolean deleteProduct(int id) {
        return false;
    }
}
