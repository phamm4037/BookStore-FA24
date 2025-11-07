/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user;

import constant.CommonConst;
import dal.implement.CategoryDAO;
import dal.implement.OrderDAO;
import dal.implement.OrderDetailsDAO;
import dal.implement.ProductDAO;
import entity.Account;
import entity.Category;
import entity.Order;
import entity.OrderDetails;
import entity.Product;
import jakarta.servlet.ServletException;
import java.io.IOException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author phamm
 */
public class DashboardUserServlet extends HttpServlet {

    CategoryDAO categoryDAO = new CategoryDAO();
    ProductDAO productDAO = new ProductDAO();
    OrderDAO orderDAO = new OrderDAO();
    OrderDetailsDAO orderDetailsDAO = new OrderDetailsDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        Account account = (Account) session.getAttribute("account");
        if (account == null) {
            response.sendRedirect("login");
            return;
        }

        int accountId = account.getId();
        List<Order> listOrders = orderDAO.getOrdersByAccountId(accountId);

        // 🔥 Thêm đoạn này sau khi lấy được listOrders
        List<OrderDetails> allOrderDetails = new ArrayList<>();
        for (Order o : listOrders) {
            List<OrderDetails> listOD = orderDetailsDAO.getOrderDetailsByOrderId(o.getId());
            o.setListOrderDetails(listOD);
            allOrderDetails.addAll(listOD);
        }
        request.setAttribute("orderDetailsList", allOrderDetails);
        // 🔥 hết đoạn thêm

        List<Product> listProduct = productDAO.findAll();
        List<Category> listCategory = categoryDAO.findAll();

        request.setAttribute("listOrders", listOrders);
        request.setAttribute("listProduct", listProduct);
        request.setAttribute("listCategory", listCategory);

        request.getRequestDispatcher("view/user/dashboard/dashboard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}
