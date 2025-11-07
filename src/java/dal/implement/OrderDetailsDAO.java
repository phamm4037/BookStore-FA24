/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package dal.implement;


import dal.GenericDAO;
import entity.Order;
import entity.OrderDetails;
import java.lang.*;
import java.util.*;
import java.io.*;

/**
 *
 * @author phamm
 */
public class OrderDetailsDAO extends GenericDAO<OrderDetails>{

    @Override
    public List<OrderDetails> findAll() {
        return queryGenericDAO(OrderDetails.class);
    }

    @Override
    public int insert(OrderDetails t) {
        String sql = "INSERT INTO [dbo].[OrderDetails]\n"
                + "           ([quanity]\n"
                + "           ,[product_id]\n"
                + "           ,[order_id])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?)";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("quantity", t.getQuantity());
        parameterMap.put("product_id", t.getProduct_id());
        parameterMap.put("order_id", t.getOrder_id());
        return insertGenericDAO(sql, parameterMap);
    }
    
    public List<OrderDetails> getOrderDetailsByOrderId(int orderId) {
        String sql = "SELECT *\n"
                + "  FROM [dbo].[OrderDetails]\n"
                + "  WHERE order_id = ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("orderId", orderId);
        return queryGenericDAO(OrderDetails.class, sql, parameterMap);
    }
    
    public static void main(String[] args) {
         OrderDAO orderDAO = new OrderDAO();
        OrderDetailsDAO orderDetailsDAO = new OrderDetailsDAO();

        int accountId = 16; // 👈 thay bằng account id có trong DB để test
        List<Order> listOrders = orderDAO.getOrdersByAccountId(accountId);

        System.out.println("🧩 Tổng số Order của account " + accountId + ": " + listOrders.size());

        List<OrderDetails> allOrderDetails = new ArrayList<>();

        for (Order o : listOrders) {
            System.out.println("➡️ Order ID: " + o.getId());
            List<OrderDetails> listOD = orderDetailsDAO.getOrderDetailsByOrderId(o.getId());
            System.out.println("   └─ OrderDetail count: " + listOD.size());
            for (OrderDetails od : listOD) {
                System.out.println("      • OrderDetail ID: " + od.getId()
                        + " | ProductID: " + od.getProduct_id()
                        + " | Quantity: " + od.getQuantity());
            }
            o.setListOrderDetails(listOD);
            allOrderDetails.addAll(listOD);
        }

        System.out.println("🔥 Tổng cộng allOrderDetails: " + allOrderDetails.size());
    }

}
