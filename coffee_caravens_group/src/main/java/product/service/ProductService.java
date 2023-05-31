package product.service;

import product.model.Product;

import java.util.List;

public interface ProductService {
    //    display
    List<Product> displayProduct();

    //    add
    boolean addOrder(List<Product> orderList);

    //  edit
    boolean editProduct(List<Product> orderList);

    //    delete
    boolean deleteProduct(int id);
}
