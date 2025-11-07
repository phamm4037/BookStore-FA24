<%-- 
    Document   : dashboard
    Created on : Oct 27, 2025, 12:18:51 PM
    Author     : phamm
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>SB Admin - Dashboard</title>

        <!-- Custom fonts for this template-->
        <link href="${pageContext.request.contextPath}/vendor-admin/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

        <!-- Page level plugin CSS-->
        <link href="${pageContext.request.contextPath}/vendor-admin/datatables/dataTables.bootstrap4.css" rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="${pageContext.request.contextPath}/css/sb-admin.css" rel="stylesheet">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/colReorder-bootstrap4.css">
        <style>
            .error{
                color:red;
            }
        </style>
    </head>

    <body id="page-top">
        <!--Navbar-->
        <jsp:include page="../common/admin/navbar.jsp"></jsp:include>

        <div id="wrapper">

            <!-- Sidebar -->
        <jsp:include page="../common/admin/sildeBar.jsp"></jsp:include>

            <div id="content-wrapper">

                <div class="container-fluid">

                    <!-- Breadcrumbs-->
                <jsp:include page="../common/admin/breadcrumbs.jsp"></jsp:include>

                    <!-- Icon Cards-->

                    <!-- DataTables Example -->
                    <div class="card mb-3">
                        <div class="card-header">
                            <i class="fas fa-table"></i>
                            Data Table Example
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Category</th>
                                            <th>Title</th>
                                            <th>Author</th>
                                            <th>Publisher</th>
                                            <th>Publication Year</th>
                                            <th>Price</th>
                                            <th>Img URL</th>
                                            <th>Stock Quantity</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${listProduct}" var="p">
                                        <tr>
                                            <td name="id">${p.product_id}</td>
                                            <td name="category_id">
                                                <c:forEach items="${listCategory}" var="c">
                                                    <c:if test="${c.category_id == p.category_id}">
                                                        ${c.category_name}
                                                    </c:if>
                                                </c:forEach>
                                            </td>
                                            <td name="title">${p.title}</td>
                                            <td name="author">${p.author}</td>
                                            <td name="publisher">${p.publisher}</td>
                                            <td name="publication_year">${p.publication_year}</td>
                                            <td name="price">${p.price}</td>
                                            <td name="imgage_url">${p.image_url}</td>
                                            <td name="stock_quantity">${p.stock_quantity}</td>
                                            <td>
                                                    <button type="button" class="btn btn-primary"
                                                            data-toggle="modal" 
                                                            data-target="#editProductModal"
                                                            onclick="editProductModal(this)">
                                                        Edit
                                                    </button>
                                                    <button type="button" class="btn btn-danger" 
                                                            data-toggle="modal" data-target="#delete-product-modal"
                                                            onclick="deleteProductModal(${p.product_id})">
                                                        Delete
                                                    </button>
                                                </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                    </div>

                </div>
                <!-- /.container-fluid -->

                <!-- Sticky Footer -->
                <jsp:include page="../common/admin/stickyFooter.jsp"></jsp:include>

            </div>
            <!-- /.content-wrapper -->

        </div>
        <!-- /#wrapper -->

        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

        <!-- Logout Modal-->
        <jsp:include page="../common/admin/Logout Modal.jsp"></jsp:include>
        
        <jsp:include page="addProductModal.jsp"></jsp:include>
        <jsp:include page="deleteProductModal.jsp"></jsp:include>
        <jsp:include page="editProductModal.jsp"></jsp:include>
        <!-- Bootstrap core JavaScript-->
        <script src="${pageContext.request.contextPath}/vender-admin/jquery/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/vender-admin/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="${pageContext.request.contextPath}/vender-admin/jquery-easing/jquery.easing.min.js"></script>

        <!-- Page level plugin JavaScript-->
        <script src="${pageContext.request.contextPath}/vender-admin/chart.js/Chart.min.js"></script>
        <script src="${pageContext.request.contextPath}/vender-admin/datatables/jquery.dataTables.js"></script>
        <script src="${pageContext.request.contextPath}/vender-admin/datatables/dataTables.bootstrap4.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="${pageContext.request.contextPath}/js/admin/sb-admin.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/admin/colReorder-bootstrap4-min.js"></script>
        <script src="${pageContext.request.contextPath}/js/admin/colReorder-dataTables-min.js"></script>

        <!-- Demo scripts for this page-->
        <script src="${pageContext.request.contextPath}/js/admin/demo/datatables-demo.js"></script>
        <script src="${pageContext.request.contextPath}/js/admin/demo/chart-area-demo.js"></script>
        <script src="${pageContext.request.contextPath}/js/admin/colReorder-dataTables-min.js"></script>
        <script src="${pageContext.request.contextPath}/js/admin/colReorder-bootstrap4-min.js"></script>

    </body>

</html>