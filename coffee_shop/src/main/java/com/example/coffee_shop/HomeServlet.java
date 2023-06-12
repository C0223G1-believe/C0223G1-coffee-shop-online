package com.example.coffee_shop;

import com.example.coffee_shop.model.product.model.Product;
import com.example.coffee_shop.model.product.model.TypeProduct;
import com.example.coffee_shop.model.product.service.IProductService;
import com.example.coffee_shop.model.product.service.ProductService;
import com.example.coffee_shop.model.product_type.model.ProductType;
import com.example.coffee_shop.model.product_type.service.ProductTypeService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "HomeServlet", value = "")
public class HomeServlet extends HttpServlet {
    IProductService productService = new ProductService();
    ProductTypeService productTypeService = new ProductTypeService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> productList = productService.productList();
        List<ProductType> typeProductList = productTypeService.displayListProductType();
        request.setAttribute("typeProductList",typeProductList);
        request.setAttribute("productList", productList);
        String check = "aaaaa";
        request.setAttribute("check", check);
        request.getRequestDispatcher("/home.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
