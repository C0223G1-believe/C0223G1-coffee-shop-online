package com.example.coffee_shop.controler.cart.controller;

import com.example.coffee_shop.model.product.model.Product;
import com.example.coffee_shop.model.product.service.ProductService;
import com.example.coffee_shop.model.product_type.model.ProductType;
import com.example.coffee_shop.model.product_type.service.ProductTypeService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ShowListByTypeServlet", value = "/ShowListByTypeServlet")
public class ShowListByTypeServlet extends HttpServlet {
    ProductService productService = new ProductService();
    ProductTypeService productTypeService = new ProductTypeService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int typeId = Integer.parseInt(request.getParameter("typeId"));
        List<Product> productList = productService.productListByType(typeId);
        List<ProductType> typeProductList = productTypeService.displayListProductType();
        request.setAttribute("typeProductList", typeProductList);
        request.setAttribute("productList", productList);
        RequestDispatcher requestDispatcher;
        requestDispatcher = request.getRequestDispatcher("/home.jsp");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
