package product.repository;

import order.model.Order;
import product.model.Product;

import java.util.List;

public interface ProductRepo {
    //    display
    List<Product> displayProduct();

    //    add
    boolean addOrder(List<Product> orderList);

    //  edit
    boolean editProduct(List<Product> orderList);

    //    delete
    boolean deleteProduct(int id);
}
