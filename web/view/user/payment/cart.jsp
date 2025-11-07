<%-- 
    Document   : cart
    Created on : Oct 30, 2025, 1:58:19 PM
    Author     : phamm
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <!--<< Header Area >>-->


    <!-- Mirrored from gramentheme.com/html/bookle/shop-cart.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 25 Oct 2025 11:39:01 GMT -->
    <head>
        <!-- ========== Meta Tags ========== -->
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="author" content="gramentheme">
        <meta name="description" content="Bookle - Book Store WooCommerce Html Template ">
        <!-- ======== Page title ============ -->
        <title>Bookle - Book Store WooCommerce Html Template</title>
        <!--<< Favcion >>-->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/favicon.png">
        <!--<< Bootstrap min.css >>-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
        <!--<< All Min Css >>-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/all.min.css">
        <!--<< Animate.css >>-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.css">
        <!--<< Magnific Popup.css >>-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/magnific-popup.css">
        <!--<< MeanMenu.css >>-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/meanmenu.css">
        <!--<< Swiper Bundle.css >>-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/swiper-bundle.min.css">
        <!--<< Nice Select.css >>-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nice-select.css">
        <!--<< Icomoon.css >>-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/icomoon.css">
        <!--<< Main.css >>-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    </head>

    <body>
        <!-- Cursor follower -->
        <div class="cursor-follower"></div>

        <!-- Preloader start -->
        <jsp:include page="../../common/hompage/Preloader.jsp"></jsp:include>

            <!-- Back To Top start -->
            <button id="back-top" class="back-to-top">
                <i class="fa-solid fa-chevron-up"></i>
            </button>

            <!-- Offcanvas Area start  -->
        <jsp:include page="../../common/hompage/Offcanvas Area.jsp"></jsp:include>
            <div class="offcanvas__overlay"></div>

        <jsp:include page="../../common/hompage/header top.jsp"></jsp:include>

            <!-- Sticky Header Section start  -->
        <jsp:include page="../../common/hompage/Sticky Header.jsp"></jsp:include>

            <!-- Main Header Section start  -->
        <jsp:include page="../../common/hompage/Main Header Section.jsp"></jsp:include>

            <!-- Login Modal -->
        <jsp:include page="../../authen/Login Modal.jsp"></jsp:include>

            <!-- Registration Modal -->
        <jsp:include page="../../authen/register.jsp"></jsp:include>

            <!-- Breadcumb Section Start -->
        <jsp:include page="../../common/hompage/Breadcumb Section.jsp"></jsp:include>

            <!-- Shop Cart Section Start -->
            <div class="cart-section section-padding">
                <div class="container">
                    <div class="main-cart-wrapper">
                        <div class="row g-5">
                            <div class="col-xl-9">
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>Product</th>
                                                <th>Price</th>
                                                <th>Quantity</th>
                                                <th>Subtotal</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${cart.listOrderDetails}" var="od">
                                            <c:forEach items="${listProduct}" var="pro">
                                                <c:if test="${pro.product_id == od.product_id}">
                                                    <c:set var="p" value="${pro}"></c:set>
                                                </c:if>
                                            </c:forEach>
                                            <tr>
                                                <!-- product -->
                                                <td>
                                                    <span class="d-flex gap-5 align-items-center">
                                                        <!-- delete -->
                                                        <form action="payment?action=delete" method="POST">
                                                            <input type="hidden" name="id" value="${p.product_id}"/>
                                                            <a href="#" onclick="return this.closest('form').submit()" class="remove-icon">
                                                                <img src="${pageContext.request.contextPath}/img/icon/icon-9.svg" alt="img">
                                                            </a>
                                                        </form>
                                                        <span class="cart">
                                                            <img src="${pageContext.request.contextPath}/img/shop-cart/01.png" alt="img">
                                                        </span>
                                                        <span class="cart-title">
                                                            ${p.title}
                                                        </span>
                                                    </span>
                                                </td>
                                                <!-- price -->
                                                <td>
                                                    <span class="cart-price">${p.price}</span>
                                                </td>
                                                <!-- quantity -->
                                        <form action="payment?action=change-quantity" method="POST">
                                            <td>
                                                <span class="quantity-basket">
                                                    <span class="qty">
                                                        <input type="hidden" name="id" value="${p.product_id}"/>

                                                        <button class="qtyminus" aria-hidden="true">−</button>

                                                        <input type="number" name="quantity" id="qty2" min="1" max="10" step="1"
                                                               value="${od.quantity}" 
                                                               onchange="return this.closest('form').submit()">

                                                        <button class="qtyplus" aria-hidden="true">+</button>

                                                    </span>
                                                </span>
                                            </td>
                                        </form>
                                        <!-- total price -->
                                        <td class="subtotal-price">
                                            <span class="subtotal-price">${p.price * od.quantity}</span>
                                        </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <!-- update cart -->
                            <div class="cart-wrapper-footer">
                                <form action="" >
                                    <a href="shop-cart.html" class="theme-btn">
                                        Update Cart
                                    </a>
                                </form>
                            </div>
                        </div>
                        <div class="col-xl-3">
                            <div class="table-responsive cart-total">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>Cart Total</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>
                                                <span class="d-flex gap-5 align-items-center justify-content-between">
                                                    <span class="sub-title">Subtotal:</span>
                                                    <span id="subtotal" class="sub-price"></span>
                                                </span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <span class="d-flex gap-5 align-items-center  justify-content-between">
                                                    <span class="sub-title">Shipping:</span>
                                                    <span class="sub-text">
                                                        Free
                                                    </span>
                                                </span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <span class="d-flex gap-5 align-items-center  justify-content-between">
                                                    <span class="sub-title">Total:  </span>
                                                    <span id="totalCart" class="sub-price sub-price-total"></span>
                                                </span>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <form action="payment?action=check-out" method="POST">
                                    <a href="#" onclick="return this.closest('form').submit()" class="theme-btn">Proceed to checkout</a>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer Section Start -->
        <jsp:include page="../../common/hompage/Footer Section.jsp"></jsp:include>

            <!--<< All JS Plugins >>-->
            <script src="${pageContext.request.contextPath}/js/jquery-3.7.1.min.js"></script>
        <!--<< Viewport Js >>-->
        <script src="${pageContext.request.contextPath}/js/viewport.jquery.js"></script>
        <!--<< Bootstrap Js >>-->
        <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
        <!--<< Nice Select Js >>-->
        <script src="${pageContext.request.contextPath}/js/jquery.nice-select.min.js"></script>
        <!--<< Waypoints Js >>-->
        <script src="${pageContext.request.contextPath}/js/jquery.waypoints.js"></script>
        <!--<< Counterup Js >>-->
        <script src="${pageContext.request.contextPath}/js/jquery.counterup.min.js"></script>
        <!--<< Swiper Slider Js >>-->
        <script src="${pageContext.request.contextPath}/js/swiper-bundle.min.js"></script>
        <!--<< MeanMenu Js >>-->
        <script src="${pageContext.request.contextPath}/js/jquery.meanmenu.min.js"></script>
        <!--<< Magnific Popup Js >>-->
        <script src="${pageContext.request.contextPath}/js/jquery.magnific-popup.min.js"></script>
        <!--<< Wow Animation Js >>-->
        <script src="${pageContext.request.contextPath}/js/wow.min.js"></script>
        <!-- Gsap -->
        <script src="${pageContext.request.contextPath}/js/gsap.min.js"></script>
        <!--<< Main.js >>-->
        <script src="${pageContext.request.contextPath}/js/main.js"></script>

        <script>
                                                                           window.onload = updateSubTotal();

                                                                           function updateSubTotal() {
                                                                               let totalPriceOfEachProduct = document.querySelectorAll('td.subtotal-price');
                                                                               let totalCart = 0;
                                                                               totalPriceOfEachProduct.forEach(e => {
                                                                                   let totalPrice = parseFloat(e.textContent.trim());
                                                                                   totalCart += totalPrice;
                                                                               });
                                                                               document.querySelector('#subtotal').innerHTML = totalCart + "vnd";
                                                                               document.querySelector('#totalCart').innerHTML = totalCart + "vnd";
                                                                           }
        </script>
        <script>
            document.querySelectorAll('.qtyplus').forEach(btn => {
                btn.addEventListener('click', function () {
                    const input = this.parentElement.querySelector('input[type="number"]');
                    input.stepUp(); // tăng giá trị
                    input.form.submit(); // gửi form ngay
                });
            });

            document.querySelectorAll('.qtyminus').forEach(btn => {
                btn.addEventListener('click', function () {
                    const input = this.parentElement.querySelector('input[type="number"]');
                    input.stepDown(); // giảm giá trị
                    input.form.submit(); // gửi form ngay
                });
            });
        </script>
    </body>


    <!-- Mirrored from gramentheme.com/html/bookle/shop-cart.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 25 Oct 2025 11:39:02 GMT -->
</html>