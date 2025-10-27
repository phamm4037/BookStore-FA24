/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package dal.implement;


import constant.CommonConst;
import dal.GenericDAO;
import entity.Product;
import java.lang.*;
import java.util.*;
import java.io.*;

/**
 *
 * @author phamm
 */
public class ProductDAO extends GenericDAO<Product>{

    @Override
    public List<Product> findAll() {
        return queryGenericDAO(Product.class);
    }

    @Override
    public int insert(Product t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public Product findById(Product product) {
        String sql = "SELECT [product_id]\n"
                + "      ,[category_id]\n"
                + "      ,[title]\n"
                + "      ,[author]\n"
                + "      ,[publisher]\n"
                + "      ,[publication_year]\n"
                + "      ,[price]\n"
                + "      ,[stock_quantity]\n"
                + "      ,[description]\n"
                + "      ,[image_url]\n"
                + "  FROM [dbo].[Product]\n"
                + "  WHERE product_id = ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("id", product.getProduct_id());
        List<Product> list = queryGenericDAO(Product.class, sql, parameterMap);
        //neu list rong--> ko tim thay = null va nguoc lai tim thay thi tra ve vi tri dau tien 
          return list.isEmpty() ? null : list.get(0);
    }

    public List<Product> findByCategoryId(String categoryId, int page) {
        //sql
        String sql = "SELECT *\n"
                + "  FROM [dbo].[Product]\n"
                + "  WHERE category_id = ?\n"
                + "  ORDER BY product_id\n"
                + "  OFFSET ? ROWS\n" //(PAGE - 1) * Y
                + "  FETCH NEXT ? ROWS ONLY"; //NUMBER_RECORD_PER_PAGE
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("category_id", categoryId);
        parameterMap.put("offset", (page - 1) * CommonConst.RECORD_PER_PAGE);
        parameterMap.put("fetch", CommonConst.RECORD_PER_PAGE);
        return queryGenericDAO(Product.class, sql, parameterMap);
    }

    public List<Product> findByName(String keyword, int page) {
        String sql = "SELECT *\n"
                + "  FROM [dbo].[Product]\n"
                + "  WHERE title like ?\n"
                + "  ORDER BY product_id\n"
                + "  OFFSET ? ROWS\n" //(PAGE - 1) * Y
                + "  FETCH NEXT ? ROWS ONLY"; //NUMBER_RECORD_PER_PAGE
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("title", "%" + keyword + "%");
        parameterMap.put("offset", (page - 1) * CommonConst.RECORD_PER_PAGE);
        parameterMap.put("fetch", CommonConst.RECORD_PER_PAGE);
        return queryGenericDAO(Product.class, sql, parameterMap);
    }

    public int findTotalRecordByCategoryId(String categoryId) {
        String sql = "SELECT count(*)\n"
                + "FROM [Product]\n"
                + "WHERE category_id = ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("category_id", categoryId);
        return findTotalRecordGenericDAO(Product.class, sql, parameterMap);
                
    }

    public int findTotalRecordByName(String keyword) {
        String sql = "SELECT count(*)\n"
                + "  FROM Product\n"
                + "  where [title] like ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("title", "%" + keyword + "%");
        return findTotalRecordGenericDAO(Product.class, sql, parameterMap);   
    }
    
        public int findTotalRecord() {
        String sql = "SELECT count(*)\n"
                + "  FROM Product\n";
        parameterMap = new LinkedHashMap<>();
        return findTotalRecordGenericDAO(Product.class, sql, parameterMap);
    }
}
