package com.example.coffee_shop.product.controller;

import com.example.coffee_shop.product.model.Product;
import com.example.coffee_shop.product.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/product")
public class ProductServlet extends HttpServlet {
    private ProductService productService = new ProductService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
            case "create":
                showCreateForm(request,response);
                break;
            case "update":
                showUpdateForm(request,response);
                break;

            default:
                showListProduct(request,response);
        }
    }
    public void showListProduct (HttpServletRequest request, HttpServletResponse response){
        List<Product> productList = productService.productList();
        request.setAttribute("productList" , productList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/product/list-product.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public void showCreateForm (HttpServletRequest request, HttpServletResponse response){
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/product/create-product.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public void showUpdateForm (HttpServletRequest request, HttpServletResponse response){
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        String image = request.getParameter("image");
        String typeProduct =request.getParameter("type");
        request.setAttribute("id",id);
        request.setAttribute("name",name);
        request.setAttribute("price",price);
        request.setAttribute("description",description);
        request.setAttribute("image",image);
        request.setAttribute("type",typeProduct);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/product/update-product.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       String action = request.getParameter("action");
       if (action == null){
           action = "";
       }
       switch (action){
           case "create":
               createProduct(request,response);
               break;
           case "delete":
               deleteProduct(request,response);
               break;
           case "search":
               searchProduct(request,response);
               break;
           case "update":
               updateProduct(request,response);
               break;
       }
    }
    public void createProduct (HttpServletRequest request, HttpServletResponse response){
        String name  = request.getParameter("name");
        double price  = Double.parseDouble(request.getParameter("price"));
        String description  = request.getParameter("description");
        String image  = request.getParameter("image");
        int  typeProduct = Integer.parseInt(request.getParameter("type"));
        productService.createProduct(new Product(name,price,description,image),typeProduct);
        try {
            response.sendRedirect("/product");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void deleteProduct (HttpServletRequest request, HttpServletResponse response){
        int id = Integer.parseInt(request.getParameter("idDelete"));
        productService.deleteProduct(id);
        try {
            response.sendRedirect("/product");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void updateProduct (HttpServletRequest request, HttpServletResponse response){
        int id = Integer.parseInt(request.getParameter("id"));
        String name  = request.getParameter("name");
        double price  = Double.parseDouble(request.getParameter("price"));
        String description  = request.getParameter("description");
        String image  = request.getParameter("image");
        String typeProduct = request.getParameter("type");
        Product product = new Product(name, price,description,image);
        productService.updateProduct(id,product,typeProduct);

        try {
            response.sendRedirect("/product");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public void searchProduct (HttpServletRequest request, HttpServletResponse response){
        String name = request.getParameter("name");
        Product product = productService.searchProduct(name);
        List<Product> list = new ArrayList<>();
        list.add(product);
        request.setAttribute("productList",list);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/product/list-product.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
