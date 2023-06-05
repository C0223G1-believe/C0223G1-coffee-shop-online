package com.example.coffee_shop.user.controler;

import com.example.coffee_shop.product.model.Product;
import com.example.coffee_shop.product.service.IProductService;
import com.example.coffee_shop.product.service.ProductService;
import com.example.coffee_shop.user.model.User;
import com.example.coffee_shop.user.service.user_service.IUserService;
import com.example.coffee_shop.user.service.user_service.UserServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SignInServlet", value = "/SignInServlet")
public class SignInServlet extends HttpServlet {
    private IUserService userService = new UserServiceImpl();
    private IProductService productService = new ProductService();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String phone = request.getParameter("phone");
        String pass = request.getParameter("password");
        User user = userService.getUserByPhoneAndPass(phone, pass);
        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            if (user.getRole().getId() == 1) {
                List<User> listUser = userService.displayUser();
                request.setAttribute("listUser", listUser);
                request.getRequestDispatcher("/view/user/display.jsp").forward(request, response);
            } else {
                //cus
                List<Product> productList = productService.productList();
                request.setAttribute("productList" , productList);
                request.getRequestDispatcher("/home.jsp").forward(request,response);

            }

        } else {
//khong co
            request.setAttribute("error","The Username or Password is Incorrect");
            RequestDispatcher requestDispatcher;
            requestDispatcher = request.getRequestDispatcher("/view/login-signUp/login.jsp");
            requestDispatcher.forward(request,response);
        }

    }
}
