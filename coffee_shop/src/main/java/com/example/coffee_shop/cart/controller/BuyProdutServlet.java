package com.example.coffee_shop.cart.controller;


import com.example.coffee_shop.cart.model.Cart;
import com.example.coffee_shop.cart.model.Item;
import com.example.coffee_shop.cart.service.OderService;
import com.example.coffee_shop.product.model.Product;
import com.example.coffee_shop.product.service.ProductService;
import com.example.coffee_shop.user.model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "BuyProdutServlet", value = "/BuyProdutServlet")
public class BuyProdutServlet extends HttpServlet {
    OderService oderService = new OderService();
    ProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> productList = productService.productList();
        request.setAttribute("productList" , productList);
        HttpSession session = request.getSession();
        Cart cart = null;
        Object o = session.getAttribute("cart");
        if (o != null) {
            cart = (Cart) o;
        } else {
            cart = new Cart();
        }
        int num,id;
            num = Integer.parseInt(request.getParameter("num"));
            id = Integer.parseInt(request.getParameter("id"));
            Product product = productService.getProductById(id);
            Item item = new Item(product, num);
            cart.addItem(item);

        List<Item> list = cart.getItems();
        session.setAttribute("cart",cart);
        session.setAttribute("size",list.size());
        String toast = request.getParameter("toast");
        if (toast==null){
            toast="";
        }
        String check = toast+"a";
        request.setAttribute("check",check);
        request.getRequestDispatcher("/home.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
