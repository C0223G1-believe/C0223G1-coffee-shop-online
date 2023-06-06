package com.example.coffee_shop.order.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "OrderServlet", value = "/Order")
public class OrderServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            action="";
        }
        switch (action){
            case"add":
                break;
            case "edit":
                break;
            default:
                showListOrder(request, response);
        }
    }

    private void showListOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("view/order/display-admin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
