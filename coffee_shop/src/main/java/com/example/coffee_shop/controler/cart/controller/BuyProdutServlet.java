package com.example.coffee_shop.controler.cart.controller;


import com.example.coffee_shop.model.cart.model.Cart;
import com.example.coffee_shop.model.cart.model.Item;
import com.example.coffee_shop.model.cart.service.OderService;
import com.example.coffee_shop.model.product.model.Product;
import com.example.coffee_shop.model.product.service.ProductService;
import com.example.coffee_shop.model.product_type.model.ProductType;
import com.example.coffee_shop.model.product_type.service.ProductTypeService;
import com.example.coffee_shop.model.user.model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "BuyProdutServlet", value = "/BuyProdutServlet")
public class BuyProdutServlet extends HttpServlet {
    OderService oderService = new OderService();
    ProductService productService = new ProductService();
    ProductTypeService productTypeService = new ProductTypeService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> productList = productService.productList();
        request.setAttribute("productList" , productList);
        List<ProductType> typeProductList = productTypeService.displayListProductType();
        request.setAttribute("typeProductList",typeProductList);
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user!=null){
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
            request.setAttribute("check","sa");
            request.getRequestDispatcher("/home.jsp").forward(request,response);
        }else{
            response.sendRedirect("/view/login-signUp/login.jsp");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
