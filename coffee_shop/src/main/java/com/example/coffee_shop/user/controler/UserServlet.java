package com.example.coffee_shop.user.controler;

import com.example.coffee_shop.user.model.Role;
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
        request.setAttribute("listRole",roleList);
        showFromAdd(request, "/view/user/form-edit.jsp", response);
    }

    private void displayUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> listUser = userService.displayUser();
        request.setAttribute("listUser", listUser);
        showFromAdd(request, "/view/user/display.jsp", response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action== null){
            action= "";
        }
        switch (action){
            case "add":
                addUser(request, response);
                break;
            case "edit":
                editUser(request, response);
                break;
            case "delete":
                deleteUser(request, response);
                break;
            case"search":
                searchUser(request, response);
                break;

        }
    }

    private void searchUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        List<User> listUser =  userService.searchUser(email,phone);
        request.setAttribute("listUser", listUser);
      request.getRequestDispatcher("/view/user/display.jsp").forward(request,response);


    }

    private void addUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String phoneNumber =  request.getParameter("phone");
        String email = request.getParameter("email");
        String userName = request.getParameter("userName");
        String password1 = request.getParameter("password1");
        String password2 = request.getParameter("password2");
        if (password1==password2 && password1!=""||password2!=""){
            userService.addUser(new User(userName,password1,email,phoneNumber));
            request.getRequestDispatcher("/view/login-signUp/login.jsp").forward(request, response);
        }
            request.getRequestDispatcher("/view/login-signUp/sign-up.jsp").forward(request,response);

    }

    private  void editUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        int idRole = Integer.parseInt(request.getParameter("role"));
        Role role =new Role(idRole);
        User user = new User(id,userName,password,email,phoneNumber,role);
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
