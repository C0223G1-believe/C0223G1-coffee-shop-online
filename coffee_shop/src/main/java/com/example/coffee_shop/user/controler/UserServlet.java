package com.example.coffee_shop.user.controler;

import com.example.coffee_shop.user.model.TypeUser;
import com.example.coffee_shop.user.model.User;
import com.example.coffee_shop.user.service.type_user_service.ITypeUserService;
import com.example.coffee_shop.user.service.type_user_service.TypeUserServiceImpl;
import com.example.coffee_shop.user.service.user_service.IUserService;
import com.example.coffee_shop.user.service.user_service.UserServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "User", value = "/User")
public class UserServlet extends HttpServlet {
    IUserService userService = new UserServiceImpl();
    ITypeUserService typeUserService = new TypeUserServiceImpl();

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
                showFormEdit(request, response);
                break;
            default:
                displayUser(request, response);
        }
    }



    private void showFormEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = userService.findById(id);
        List<TypeUser> listTypeUser = typeUserService.displayTypeUser();
        request.setAttribute("user", user);
        request.setAttribute("listTypeUser",listTypeUser);
        request.getRequestDispatcher("/view/user/form-edit.jsp").forward(request, response);
    }

    private void displayUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> listUser = userService.displayUser();
        request.setAttribute("listUser", listUser);
        request.getRequestDispatcher("/view/user/display.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action== null){
            action= "";
        }
        switch (action){
            case "add":
                break;
            case "edit":
                editUser(request, response);
                break;
            case "delete":
                deleteUser(request, response);

        }
    }

    private  void editUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        int typeUserId = Integer.parseInt(request.getParameter("typeUser"));
        TypeUser typeUser =new TypeUser(typeUserId);
        User user = new User(id,userName,password,email,phoneNumber,typeUser);
        if (userService.checkUserName(userName,email,phoneNumber)){
            response.sendRedirect("/User");
        }else {
            if (userService.editUser(user)){
                response.sendRedirect("/User");
            }
        }

    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("idDelete"));
        userService.deleteUser(id);
        response.sendRedirect("/User");
    }
}
