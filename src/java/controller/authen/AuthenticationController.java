/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.authen;

import constant.CommonConst;
import dal.implement.AccountDAO;
import entity.Account;
import jakarta.servlet.ServletException;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author phamm
 */
public class AuthenticationController extends HttpServlet {
    AccountDAO accDAO = new AccountDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        //get action
        String action = request.getParameter("action") == null
                            ? "" 
                            : request.getParameter("action");
        String URL;
        switch (action) {
            case "login":
                URL = loginDoPost(request, response);
                break;
            case "logOut":
                URL = logOut(request, response);
                break;
            default:
                URL = "home";
        }
        
        //chuyen trang
        request.getRequestDispatcher(URL).forward(request, response);
    } 


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        //get action
        String action = request.getParameter("action") == null
                            ? "" 
                            : request.getParameter("action");
        String URL;
        //dua theo action set URL trang can chuyen den 
        switch (action) {
            case "login":
                URL = loginDoPost(request, response);
                break;
            case "signUp":
                URL = signUp(request,response);
                break;
            default:
                URL = "home";
        }
        request.getRequestDispatcher(URL).forward(request, response);
    }

    private String loginDoPost(HttpServletRequest request, HttpServletResponse response) {
        String url = null;
        //get ve cac thong tin nguoi dung nhap
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        //kiem tra thong tin co ton tai trong DB khong ? 
        Account acc = Account.builder()
                             .username(username)
                             .password(password)
                             .build();
        Account accFound = accDAO.findByUserAndPass(acc);
        //true => home.jsp (set account vao trong session)
        if(accFound != null){
            HttpSession session = request.getSession();
            session.setAttribute(CommonConst.SESSION_ACCOUNT, accFound);
            url = "home";
        //false => login.jsp (set thong bao loi)    
        }else {
            request.setAttribute("loginError", "Username or Password is Incorrect");
            url = "view/homepage/home.jsp";
        }
        
        return url;
    }

    private String logOut(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.getSession().removeAttribute(CommonConst.SESSION_ACCOUNT);
        return "home";
    }

    private String signUp(HttpServletRequest request, HttpServletResponse response) {
        String URL;
        //get ve cac thong tin nguoi dung
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String address = request.getParameter("address");
        Account newAcc = Account.builder()
                        .username(username)
                        .email(email)
                        .password(password)
                        .address(address)
                        .build();
        //kiem tra username da ton tai ? 
        boolean isExistUsername = accDAO.checkUsernameExist(newAcc);
        //true thi set ra thong bao loi ==> quay lai trang register
        if (isExistUsername) {
            request.setAttribute("signUpError", "Username exist !!");
            request.setAttribute("showSignUpModal", true);
            URL = "view/homepage/home.jsp";
        }else{
            accDAO.insert(newAcc);
            URL = "home";
        }
        //false ==> quay tro lai trang home (ghi tai khoan vao trong DB)
        return URL;
    }



}
