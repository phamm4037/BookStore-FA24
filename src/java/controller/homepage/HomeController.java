/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.homepage;

import constant.CommonConst;
import dal.implement.CategoryDAO;
import dal.implement.ProductDAO;
import entity.Category;
import entity.PageControl;
import entity.Product;
import jakarta.servlet.ServletException;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author phamm
 */
public class HomeController extends HttpServlet {
    ProductDAO productDAO = new ProductDAO();
    CategoryDAO categoryDAO = new CategoryDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        PageControl pageControl = new PageControl();
        List<Product> listProduct = findProductDoGet(request, pageControl);
        List<Category> listCategory = categoryDAO.findAll();
        
        
        
        //set 2 list vao trogn sesssion
        HttpSession session = request.getSession();
        session.setAttribute(CommonConst.SESSION_PRODUCT, listProduct);
        session.setAttribute(CommonConst.SESSION_CATEGORY, listCategory);
        request.setAttribute("pageControl", pageControl);
        
        request.getRequestDispatcher("view/homepage/home.jsp").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.sendRedirect("home");
    }

    private List<Product> findProductDoGet(HttpServletRequest request, PageControl pageControl) {
        //get va page
        String pageRaw = request.getParameter("page");
        //valid page 
        int page;
        try {
            page = Integer.parseInt(pageRaw);
            if(page <= 0){
                page = 1;
            }
        } catch (Exception e) {
            page = 1;
        }
        //get ve cai SEARCH xem user dang lm gi ??? 
        String actionSearch = request.getParameter("search") == null 
                                    ? "default" 
                                    : request.getParameter("search");
        //get list productDAO
        List<Product> listProduct;
        //get req URl
        String requestURL = request.getRequestURL().toString();
        //total record
        int totalRecord = 0;
        switch (actionSearch) {
            case "category":
                String categoryId = request.getParameter("categoryId");
                totalRecord = productDAO.findTotalRecordByCategoryId(categoryId);
                listProduct = productDAO.findByCategoryId(categoryId, page);
                pageControl.setUrlPattern(requestURL + "?search=category&categoryId=" + categoryId + "&");
                break;
            case "searchByName":   
                String keyword = request.getParameter("keyword");
                totalRecord = productDAO.findTotalRecordByName(keyword);
                listProduct = productDAO.findByName(keyword, page);
                pageControl.setUrlPattern(requestURL + "?search=searchByName&keyword=" + keyword + "&");
                break;
            default:
                totalRecord = productDAO.findTotalRecord();
                listProduct = productDAO.findByPage(page);
                pageControl.setUrlPattern(requestURL + "?");
        }
        //total page
        int totalPage = (totalRecord % CommonConst.RECORD_PER_PAGE) == 0 
                        ? (totalRecord / CommonConst.RECORD_PER_PAGE) 
                        : (totalRecord / CommonConst.RECORD_PER_PAGE) + 1;
        //set total record, total page, page vao page control
        pageControl.setPage(page);
        pageControl.setTotalPage(totalPage);
        pageControl.setTotalRecord(totalRecord);
        
        
        return listProduct;
    }

}
