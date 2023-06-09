package com.example.coffee_shop.controler.order.controller;

import com.example.coffee_shop.model.order.model.DetailOrder;
import com.example.coffee_shop.model.order.model.Order;
import com.example.coffee_shop.model.order.service.IOrderService;
import com.example.coffee_shop.model.order.service.OrderService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "OrderServlet", value = "/Order")
public class OrderServlet extends HttpServlet {
    IOrderService orderService = new OrderService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                break;
            case "edit":
                showFromEdit(request, response);
                break;
            default:
                showListOrder(request, response);
        }
    }

    private void showFromEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        List<DetailOrder> listDetailOrder = orderService.findById(id);
        request.setAttribute("listDetailOrder", listDetailOrder);
        request.setAttribute("showOrder", orderService.showOrder(id));
        request.getRequestDispatcher("/view/order/form-edit.jsp").forward(request, response);
    }

    private void showListOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<Order> orderList = orderService.displayOrder();
        request.setAttribute("listOrder", orderList);
        request.getRequestDispatcher("view/order/display-admin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "edit":
                edit(request, response);
                break;
            case "delete":
                delete(request, response);
                break;
            case "search":
                searchOrder(request, response);
                break;
        }
    }

    private void searchOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName = request.getParameter("userName");
        String status = request.getParameter("status");
        List<Order> orderList = orderService.searchOrder(userName, status);
        request.setAttribute("listOrder", orderList);
        request.getRequestDispatcher("view/order/display-admin.jsp").forward(request, response);
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("idDelete"));
        orderService.deleteOrder(id);
        String result = "Delete Success";
        List<Order> orderList = orderService.displayOrder();
        request.setAttribute("listOrder", orderList);
        request.setAttribute("show", result);
        request.getRequestDispatcher("/view/order/display-admin.jsp").forward(request, response);
    }

    private void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idOder = Integer.parseInt(request.getParameter("order"));
        int idStatus = Integer.parseInt(request.getParameter("status"));
        String result = "Successful status change ";
        orderService.editOrder(idOder, idStatus);
        List<Order> orderList = orderService.displayOrder();
        request.setAttribute("listOrder", orderList);
        request.setAttribute("show", result);
        request.getRequestDispatcher("/view/order/display-admin.jsp").forward(request, response);
    }

}
