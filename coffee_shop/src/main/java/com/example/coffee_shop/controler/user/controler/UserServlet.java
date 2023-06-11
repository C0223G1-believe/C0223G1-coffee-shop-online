package com.example.coffee_shop.controler.user.controler;

import com.example.coffee_shop.model.user.model.Role;
import com.example.coffee_shop.model.user.model.User;
import com.example.coffee_shop.model.user.service.type_user_service.ITypeUserService;
import com.example.coffee_shop.model.user.service.type_user_service.TypeUserServiceImpl;
import com.example.coffee_shop.model.user.service.user_service.IUserService;
import com.example.coffee_shop.model.user.service.user_service.UserServiceImpl;

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
                showFromAdd(request, "/view/login-signUp/sign-up.jsp", response);
                break;
            case "edit":
                showFormEdit(request, response);
                break;
            default:
                displayUser(request, response);
        }
    }

    private static void showFromAdd(HttpServletRequest request, String path, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher(path).forward(request, response);
    }


    private void showFormEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = userService.findById(id);
        List<Role> roleList = typeUserService.displayRole();
        request.setAttribute("user", user);
        request.setAttribute("listRole", roleList);
        showFromAdd(request, "/view/user/form-edit.jsp", response);
    }

    private void displayUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> listUser = userService.displayUser();
        String result = "Hello Admin";
        request.setAttribute("show",result);
        request.setAttribute("listUser", listUser);
        showFromAdd(request, "/view/user/display.jsp", response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                addUser(request, response);
                break;
            case "edit":
                editUser(request, response);
                break;
            case "delete":
                deleteUser(request, response);
                break;
            case "search":
                searchUser(request, response);
                break;

        }
    }

    private void searchUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String phone = request.getParameter("phone");
        List<User> listUser = userService.searchUser(phone);
        request.setAttribute("listUser", listUser);
        request.getRequestDispatcher("/view/user/display.jsp").forward(request, response);


    }

    private void addUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (userService.addUser(request,response)){
            String notification = "successfully added new";
            request.setAttribute("notification",notification);
            request.getRequestDispatcher("/view/login-signUp/login.jsp").forward(request, response);
        }else {
            String error = "* Do not use special characters for the field User and Password or appeared";
            request.setAttribute("error",error);
            request.getRequestDispatcher("/view/login-signUp/sign-up.jsp").forward(request, response);
        }



    }

    private void editUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        int idRole = Integer.parseInt(request.getParameter("role"));
        Role role = new Role(idRole);
        User user = new User(id, userName, password, email, phoneNumber, role);
        if (userService.checkUserName(email, phoneNumber)) {
            response.sendRedirect("/User?action=edit&id=" + id);
        } else {
            if (userService.editUser(user)) {
                String result = "Edit Success";
                request.setAttribute("show",result);
                List<User> listUser = userService.displayUser();
                request.setAttribute("listUser", listUser);
                request.getRequestDispatcher("/view/user/display.jsp").forward(request,response);
            }
        }

    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("idDelete"));
        userService.deleteUser(id);
        String result = "Delete Success";
        request.setAttribute("show",result);
        List<User> listUser = userService.displayUser();
        request.setAttribute("listUser", listUser);
        try {
            request.getRequestDispatcher("/view/user/display.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        }
    }
}
