package com.example.coffee_shop;

import com.example.coffee_shop.product.model.Product;
import com.example.coffee_shop.product.service.IProductService;
import com.example.coffee_shop.product.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "HomeServlet", value = "")
public class HomeServlet extends HttpServlet {
    IProductService productService = new ProductService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> productList = productService.productList();
        request.setAttribute("productList" , productList);
        String check = "aaaaa";
        request.setAttribute("check",check);
request.getRequestDispatcher("/home.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
