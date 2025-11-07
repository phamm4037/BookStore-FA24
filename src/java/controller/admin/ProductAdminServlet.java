/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dal.implement.CategoryDAO;
import dal.implement.ProductDAO;
import entity.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.math.BigDecimal;
import java.nio.file.Paths;

/**
 *
 * @author phamm
 */
@MultipartConfig
public class ProductAdminServlet extends HttpServlet {

    ProductDAO proDAO = new ProductDAO();
    CategoryDAO cateDAO = new CategoryDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //set UTF-8
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        //get Session
        HttpSession session = request.getSession();
        //get action
        String action = request.getParameter("action") == null
                ? ""
                : request.getParameter("action");
        switch (action) {
            case "add":
                addProduct(request);
                break;
            case "delete":
                deleteProduct(request);
                break;
            case "edit":
                editProduct(request);
                break;
            default:
                throw new AssertionError();
        }
        response.sendRedirect("dashboard");
    }

    private void addProduct(HttpServletRequest request) throws IOException, ServletException {
        try {
            // Lấy các giá trị từ form
            String title = request.getParameter("title");
            String author = request.getParameter("author");
            String publisher = request.getParameter("publisher");

            // Parse số nguyên an toàn
            int publicationYear = 0;
            try {
                publicationYear = Integer.parseInt(request.getParameter("publication_year"));
            } catch (NumberFormatException e) {
                System.err.println("Publication year không hợp lệ!");
            }

            int categoryId = Integer.parseInt(request.getParameter("category"));

            int stockQuantity = 0;
            try {
                stockQuantity = Integer.parseInt(request.getParameter("quantity"));
            } catch (NumberFormatException e) {
                System.err.println("Stock quantity không hợp lệ!");
            }

            // Parse BigDecimal cho giá
            BigDecimal price = BigDecimal.ZERO;
            String priceStr = request.getParameter("price");
            if (priceStr != null && !priceStr.trim().isEmpty()) {
                try {
                    priceStr = priceStr.replace(",", "").trim(); // bỏ dấu ngăn cách
                    price = new BigDecimal(priceStr);
                } catch (NumberFormatException e) {
                    System.err.println("Giá không hợp lệ: " + priceStr);
                }
            }

            // Lấy ảnh từ form
            Part part = request.getPart("image");
            String imagePath = null;

            if (part == null 
                    || part.getSubmittedFileName() == null 
                    || part.getSubmittedFileName().trim().isEmpty()) {
                imagePath = null;
            } else {
                // Đường dẫn thư mục lưu ảnh trong project
                String path = request.getServletContext().getRealPath("/images");
                File dir = new File(path);

                // Tạo thư mục nếu chưa tồn tại
                if (!dir.exists()) {
                    dir.mkdirs();
                }

                // Ghi file vào thư mục /images
                File imageFile = new File(dir, part.getSubmittedFileName());
                part.write(imageFile.getAbsolutePath());

                // Tạo URL có thể truy cập ảnh từ trình duyệt
                // request.getContextPath() ví dụ: /BookStore
                imagePath = request.getContextPath() + "/images/" + imageFile.getName();
            }

            Product product = Product.builder()
                    .title(title)
                    .price(price)
                    .stock_quantity(stockQuantity)
                    .category_id(categoryId)
                    .author(author)
                    .publisher(publisher)
                    .publication_year(publicationYear)
                    .image_url(imagePath)
                    .build();

            // Gọi DAO để lưu vào DB
            proDAO.insert(product);

        } catch (NumberFormatException | IOException | ServletException ex) {
            ex.printStackTrace();
        }
    }

    private void deleteProduct(HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("id"));
        proDAO.deleteById(id);
    }

    private void editProduct(HttpServletRequest request) {
        try {
            // Lấy các giá trị từ form
            int id = Integer.parseInt(request.getParameter("id"));
            String title = request.getParameter("title");
            String author = request.getParameter("author");
            String publisher = request.getParameter("publisher");

            // Parse số nguyên an toàn
            int publicationYear = 0;
            try {
                publicationYear = Integer.parseInt(request.getParameter("publication_year"));
            } catch (NumberFormatException e) {
                System.err.println("Publication year không hợp lệ!");
            }

            int categoryId = Integer.parseInt(request.getParameter("category"));

            int stockQuantity = 0;
            try {
                stockQuantity = Integer.parseInt(request.getParameter("quantity"));
            } catch (NumberFormatException e) {
                System.err.println("Stock quantity không hợp lệ!");
            }

            // Parse BigDecimal cho giá
            BigDecimal price = BigDecimal.ZERO;
            String priceStr = request.getParameter("price");
            if (priceStr != null && !priceStr.trim().isEmpty()) {
                try {
                    priceStr = priceStr.replace(",", "").trim(); // bỏ dấu ngăn cách
                    price = new BigDecimal(priceStr);
                } catch (NumberFormatException e) {
                    System.err.println("Giá không hợp lệ: " + priceStr);
                }
            }

            // Lấy ảnh từ form
            Part part = request.getPart("image");
            String imagePath = null;

            if (part == null 
                    || part.getSubmittedFileName() == null 
                    || part.getSubmittedFileName().trim().isEmpty()) {
                imagePath = request.getParameter("currentImage");;
            } else {
                // Đường dẫn thư mục lưu ảnh trong project
                String path = request.getServletContext().getRealPath("/images");
                File dir = new File(path);

                // Tạo thư mục nếu chưa tồn tại
                if (!dir.exists()) {
                    dir.mkdirs();
                }

                // Ghi file vào thư mục /images
                File imageFile = new File(dir, part.getSubmittedFileName());
                part.write(imageFile.getAbsolutePath());

                // Tạo URL có thể truy cập ảnh từ trình duyệt
                // request.getContextPath() ví dụ: /BookStore
                imagePath = request.getContextPath() + "/images/" + imageFile.getName();
            }

            Product product = Product.builder()
                    .product_id(id)
                    .title(title)
                    .price(price)
                    .stock_quantity(stockQuantity)
                    .category_id(categoryId)
                    .author(author)
                    .publisher(publisher)
                    .publication_year(publicationYear)
                    .image_url(imagePath)
                    .build();

            // Gọi DAO để lưu vào DB
            proDAO.update(product);

        } catch (NumberFormatException | IOException | ServletException ex) {
            ex.printStackTrace();
        }
    }
}
