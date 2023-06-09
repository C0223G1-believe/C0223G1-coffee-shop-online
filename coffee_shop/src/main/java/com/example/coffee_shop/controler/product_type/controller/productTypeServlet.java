package com.example.coffee_shop.controler.product_type.controller;

import com.example.coffee_shop.model.product_type.model.ProductType;
import com.example.coffee_shop.model.product_type.service.ProductTypeService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "productTypeServlet", value = "/productType")
public class productTypeServlet extends HttpServlet {
    ProductTypeService productTypeService = new ProductTypeService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showFormCreateProductType(request, response);
                break;
            case "edit":
                showFormEditProductType(request, response);
                break;
            case "delete":
                deleteProductType(request, response);
                break;
            default:
                showProductTypeList(request, response);
                break;
        }
    }

    private void deleteProductType(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("idDelete"));
        productTypeService.deleteProductType(id);
        request.setAttribute("success", "success");
        showProductTypeList(request,response);
    }

    private void showFormEditProductType(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        request.setAttribute("id",id);
        request.setAttribute("name", name);

        try {
            request.getRequestDispatcher("/view/product_type/edit-product-type.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormCreateProductType(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("/view/product_type/create-product-type.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showProductTypeList(HttpServletRequest request, HttpServletResponse response) {
        List<ProductType> productTypeList = productTypeService.displayListProductType();
        request.setAttribute("productTypeList", productTypeList);
        try {
            request.getRequestDispatcher("/view/product_type/show-list-product-type.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createProductType(request, response);
                break;
            case "edit":
                editProductType(request, response);
                break;
            case "delete":
                deleteProductType(request, response);
                break;
            case "search":
                searchProductTypeByName(request, response);
            default:
                break;
        }
    }

    private void searchProductTypeByName(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        List<ProductType> productTypeList = productTypeService.SearchProductTypeByName(name);
        request.setAttribute("productTypeList",productTypeList);
        try {
            request.getRequestDispatcher("/view/product_type/show-list-product-type.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void editProductType(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        ProductType productType = new ProductType(id, name);
        productTypeService.editProductType(productType);
        try {
            response.sendRedirect("/productType");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void createProductType(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("productType");
        ProductType productType = new ProductType(name);
        productTypeService.addProductType(productType);
        try {
            response.sendRedirect("/productType");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
