package com.example.coffee_shop.user.controler;

import com.example.coffee_shop.product.model.Product;
import com.example.coffee_shop.product.service.IProductService;
import com.example.coffee_shop.product.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "LogOutServlet", value = "/LogOutServlet")
public class LogOutServlet extends HttpServlet {
    IProductService productService = new ProductService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.invalidate();
//        response.sendRedirect("/home.jsp");
        List<Product> productList = productService.productList();
        request.setAttribute("productList" , productList);
        request.getRequestDispatcher("/home.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
