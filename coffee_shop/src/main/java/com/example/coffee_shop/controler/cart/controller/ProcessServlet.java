package com.example.coffee_shop.controler.cart.controller;

import com.example.coffee_shop.model.cart.model.Cart;
import com.example.coffee_shop.model.cart.model.Item;
import com.example.coffee_shop.model.cart.service.OderService;
import com.example.coffee_shop.model.product.model.Product;
import com.example.coffee_shop.model.product.service.ProductService;
import com.example.coffee_shop.model.user.model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProcessServlet", value = "/process")
public class ProcessServlet extends HttpServlet {
    OderService oderService = new OderService();
    ProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
//        Cart cart = null;
//        if (o!=null){
//            cart = (Cart)o;
//        }else {
//            cart = new Cart();
//        }
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "quanitity":
                updateQuanitity(request, response, session);
                break;
            case "delete":
                deleteItem(request, response, session);
                break;
            case "back":
                backHome(request, response);
                break;

        }

    }

    private void backHome(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> productList = productService.productList();
        request.setAttribute("productList", productList);
        request.getRequestDispatcher("/home.jsp").forward(request, response);
    }

    private void deleteItem(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ServletException, IOException {
        Cart cart = (Cart) session.getAttribute("cart");
        int id = Integer.parseInt(request.getParameter("id"));
        cart.removeItem(id);
        List<Item> list = cart.getItems();
        session.setAttribute("cart", cart);
        session.setAttribute("size", list.size());
        request.getRequestDispatcher("/cart.jsp").forward(request, response);
    }

    private void updateQuanitity(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ServletException, IOException {
        Cart cart = (Cart) session.getAttribute("cart");
        int num = Integer.parseInt(request.getParameter("num"));
        int id = Integer.parseInt(request.getParameter("id"));

        if ((num == -1) && (cart.getQuantityById(id) <= 1)) {
            cart.removeItem(id);
        } else {
            Product p = productService.getProductById(id);
            Item t = new Item(p, num);
            cart.addItem(t);
        }
        List<Item> list = cart.getItems();
        session.setAttribute("cart", cart);
        session.setAttribute("size", list.size());
        request.getRequestDispatcher("/cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        User user = (User) session.getAttribute("user");
        String address = request.getParameter("address");
        String note = request.getParameter("note");
        oderService.addOrder(user,cart,note,address);
        Cart cart1 = null;
        session.setAttribute("cart",cart1);
        session.setAttribute("size", "");

        List<Product> productList = productService.productList();
        request.setAttribute("productList", productList);
        request.getRequestDispatcher("/home.jsp").forward(request, response);
        
    }
}