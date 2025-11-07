/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.user;


import java.sql.Timestamp;
import java.time.LocalDateTime;
import constant.CommonConst;
import dal.implement.OrderDAO;
import dal.implement.OrderDetailsDAO;
import dal.implement.ProductDAO;
import entity.Account;
import entity.Order;
import entity.OrderDetails;
import entity.Product;
import jakarta.servlet.ServletException;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

/**
 *
 * @author phamm
 */
public class PaymentController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        request.getRequestDispatcher("view/user/payment/cart.jsp").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String action = request.getParameter("action") == null
                        ? ""
                        : request.getParameter("action");
        switch (action) {
            case "AddProduct":
                AddProduct(request,response);
                break;
            case "change-quantity":
                changeQuantity(request,response);
                break;    
            case "delete":
                delete(request,response);
                break; 
            case "check-out":
                checkOut(request, response);
                break;    
            default:
                throw new AssertionError();
        }
        response.sendRedirect("payment");
    }

    private void AddProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //get ve session
        HttpSession session = request.getSession();
        //get ve product_id
        int product_id = Integer.parseInt(request.getParameter("id"));
        //get ve quantity
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        //lay ve cart o tren session
        Order cart = (Order) session.getAttribute("cart");
        if(cart == null){
            cart = new Order();
        }
        OrderDetails od = new OrderDetails();
        od.setProduct_id(product_id);
        od.setQuantity(quantity);
        //them orderdetails cao trong cart
        AddOrderDetailsToOrder(od, cart);
        //set cart moi len tren session
        session.setAttribute("cart", cart);
    }

    private void AddOrderDetailsToOrder(OrderDetails od, Order cart) {
        boolean isAdd = false;
        for (OrderDetails obj : cart.getListOrderDetails()) {
            if(obj.getProduct_id() == od.getProduct_id()){
                obj.setQuantity(obj.getQuantity() + od.getQuantity());
                isAdd = true;
            }
        }
        if(isAdd == false){
            cart.getListOrderDetails().add(od);
        }
    }

    private void changeQuantity(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        try {
        //get ve product_id
        int product_id = Integer.parseInt(request.getParameter("id"));
        //get va quantity
        int quantity  = Integer.parseInt(request.getParameter("quantity"));
        //lay ve cart
        Order cart = (Order) session.getAttribute("cart");
        //thay doi quantity            
            for (OrderDetails obj : cart.getListOrderDetails()) {
                if(obj.getProduct_id() == product_id){
                    obj.setQuantity(quantity);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {
        int product_id = Integer.parseInt(request.getParameter("id"));
        HttpSession session = request.getSession();
        Order cart = (Order) session.getAttribute("cart");
        OrderDetails od = null;
        for (OrderDetails obj : cart.getListOrderDetails()) {
            if(obj.getProduct_id() == product_id){
                od = obj;
            }
        }
        cart.getListOrderDetails().remove(od);
        session.setAttribute("cart", cart);
    }

private void checkOut(HttpServletRequest request, HttpServletResponse response) {
    HttpSession session = request.getSession();
    Order cart = (Order) session.getAttribute("cart");
    ProductDAO productDAO = new ProductDAO();
            

    // Lấy account id
    int id = ((Account) session.getAttribute(CommonConst.SESSION_ACCOUNT)).getId();

    // Lấy danh sách sản phẩm
    List<Product> list = (List<Product>) session.getAttribute(CommonConst.SESSION_PRODUCT);

    // Tính tổng tiền
    BigDecimal amount = calculateAmount(cart, list);

    // Gán thông tin đơn hàng
    cart.setAccount_id(id);
    cart.setAmount(amount); 
    cart.setCreatAt(Timestamp.valueOf(LocalDateTime.now()));
    
    // Insert order và order details
    OrderDAO orderDAO = new OrderDAO();
    OrderDetailsDAO odDAO = new OrderDetailsDAO();
    int orderID = orderDAO.insert(cart);

    for (OrderDetails obj : cart.getListOrderDetails()) {
        obj.setOrder_id(orderID);
        odDAO.insert(obj);
    }
    // TODO: trừ số lượng trong DB nếu cần
    session.removeAttribute("cart");
}

private BigDecimal calculateAmount(Order cart, List<Product> list) {
    BigDecimal amount = BigDecimal.ZERO;

    for (OrderDetails od : cart.getListOrderDetails()) {
        BigDecimal price = findPriceById(list, od.getProduct_id());
        BigDecimal quantity = BigDecimal.valueOf(od.getQuantity());

        // amount += price * quantity
        amount = amount.add(price.multiply(quantity));
    }

    return amount;
}

private BigDecimal findPriceById(List<Product> list, int book_id) {
    for (Product obj : list) {
        if (obj.getProduct_id() == book_id) {
            return obj.getPrice();
        }
    }
    return BigDecimal.ZERO;
}



}
