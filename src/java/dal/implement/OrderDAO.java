/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package dal.implement;


import dal.GenericDAO;
import entity.Order;
import java.lang.*;
import java.util.*;
import java.io.*;

/**
 *
 * @author phamm
 */
public class OrderDAO extends GenericDAO<Order>{


    @Override
    public int insert(Order t) {
        String sql = "INSERT INTO [dbo].[Order]\n"
                + "           ([amount]\n"
                + "           ,[account_id]\n"
                + "           ,[creatAt])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?)";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("amount", t.getAmount());
        parameterMap.put("account_id", t.getAccount_id());
        parameterMap.put("creatAt", t.getCreatAt());
        return insertGenericDAO(sql, parameterMap);
    }
    
    public List<Order> getOrdersByAccountId(int accountId){
        String sql = "SELECT *\n"
                + "  FROM [dbo].[Order]\n"
                + "  WHERE account_id = ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("accountId", accountId);
        return queryGenericDAO(Order.class, sql, parameterMap);
    }
        
    @Override
    public List<Order> findAll() {
        return queryGenericDAO(Order.class);
    }
    
    public static void main(String[] args) {
        System.out.println(new OrderDAO().getOrdersByAccountId(16));
                
    }
}
