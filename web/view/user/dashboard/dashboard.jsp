<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    </head>

    <body id="page-top">

        <!-- Navbar -->
        <jsp:include page="../../common/user/NavBar.jsp"></jsp:include>

            <div id="wrapper">

                <!-- Sidebar -->
            <jsp:include page="../../common/user/SideBar.jsp"></jsp:include>

                <div id="content-wrapper">

                    <div class="container-fluid">

                        <!-- Breadcrumbs-->
                    <jsp:include page="../../common/user/Breadcrumbs.jsp"></jsp:include>

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
                                                <th>Order ID</th>
                                                <th>Product</th>
                                                <th>Category</th>
                                                <th>Quantity</th>
                                                <th>Price</th>
                                                <th>Date</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <!-- Duy?t qua t?ng ??n hàng -->
                                        <c:forEach var="order" items="${listOrders}">
                                            <!-- Duy?t qua t?ng order detail c?a ??n hàng -->
                                            <c:forEach var="od" items="${order.listOrderDetails}">
                                                <!-- Duy?t qua s?n ph?m ?? l?y tên và giá -->
                                                <c:forEach var="p" items="${listProduct}">
                                                    <c:if test="${p.product_id eq od.product_id}">
                                                        <tr>
                                                            <td>${order.id}</td>
                                                            <td>${p.title}</td>
                                                            <td>
                                                                <!-- Duy?t qua category ?? l?y tên -->
                                                                <c:forEach var="c" items="${listCategory}">
                                                                    <c:if test="${c.category_id eq p.category_id}">
                                                                        ${c.category_name}
                                                                    </c:if>
                                                                </c:forEach>
                                                            </td>
                                                            <td>${od.quantity}</td>
                                                            <td>${p.price}</td>
                                                            <td>
                                                    <fmt:formatDate value="${order.creatAt}" pattern="dd/MM/yyyy HH:mm:ss"/>
                                                    </td>
                                                    </tr>
                                                </c:if>
                                            </c:forEach>
                                        </c:forEach>
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
                <jsp:include page="../../common/user/footer.jsp"></jsp:include>

                </div>
                <!-- /.content-wrapper -->

            </div>
            <!-- /#wrapper -->

            <!-- Logout Modal-->
        <jsp:include page="../../common/user/LogoutModal.jsp"></jsp:include>

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