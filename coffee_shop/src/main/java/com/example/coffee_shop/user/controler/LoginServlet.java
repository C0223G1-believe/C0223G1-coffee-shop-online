package com.example.coffee_shop.user.controler;

import com.example.coffee_shop.user.model.User;
import com.example.coffee_shop.user.service.user_service.IUserService;
import com.example.coffee_shop.user.service.user_service.UserServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "loginServlet", value = "/loginServlet")
public class LoginServlet extends HttpServlet {
    private IUserService userService = new UserServiceImpl();

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
            if (user.getTypeUser().getId() == 1) {
                response.sendRedirect("/Sang-test-dang-nhap/trang-admin.jsp");
            } else {
                //cus
                response.sendRedirect("/Sang-test-dang-nhap/trang-chu.jsp");
            }

        } else {
//khong co
            request.setAttribute("baoLoi","Ten dang nhap hoac mk khong dung");
            RequestDispatcher requestDispatcher;
            requestDispatcher = request.getRequestDispatcher("/index.jsp");
            requestDispatcher.forward(request,response);
        }

    }
}
