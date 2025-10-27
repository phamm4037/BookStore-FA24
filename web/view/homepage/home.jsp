<%-- 
    Document   : home
    Created on : Oct 25, 2025, 5:09:20 PM
    Author     : phamm
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!doctype html>
<!DOCTYPE html>
<html lang="en">
<!--<< Header Area >>-->


<!-- Mirrored from gramentheme.com/html/bookle/shop.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 25 Oct 2025 11:37:10 GMT -->
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
    <jsp:include page="../common/hompage/Preloader.jsp"></jsp:include>

    <!-- Back To Top start -->
    <button id="back-top" class="back-to-top">
        <i class="fa-solid fa-chevron-up"></i>
    </button>

    <!-- Offcanvas Area start  -->
    <jsp:include page="../common/hompage/Offcanvas Area.jsp"></jsp:include>
    <div class="offcanvas__overlay"></div>
    <jsp:include page="../common/hompage/Preloader.jsp"></jsp:include>

    <!-- Sticky Header Section start  -->
    <jsp:include page="../common/hompage/Sticky Header.jsp"></jsp:include>

    <!-- Main Header Section start  -->
    <jsp:include page="../common/hompage/Main Header Section.jsp"></jsp:include>

     <!-- Login Modal -->
    <jsp:include page="../common/hompage/Login Modal.jsp"></jsp:include>
    
    <!-- Registration Modal -->
    <jsp:include page="../common/hompage/Registration Modal.jsp"></jsp:include>

    <!-- Breadcumb Section Start -->
    <jsp:include page="../common/hompage/Breadcumb Section.jsp"></jsp:include>
    <!-- Shop Section Start -->
    <section class="shop-section fix section-padding">
        <div class="container">
            <div class="shop-default-wrapper">
                <div class="row">
                    <div class="col-12">
                        <div class="woocommerce-notices-wrapper wow fadeInUp" data-wow-delay=".3s">
                            <p>Showing 1-3 Of 34 Results </p>
                            <div class="form-clt">
                                <div class="nice-select" tabindex="0">
                                    <span class="current">
                                        Default Sorting
                                    </span>
                                    <ul class="list">
                                        <li data-value="1" class="option selected focus">
                                            Default sorting
                                        </li>
                                        <li data-value="1" class="option">
                                            Sort by popularity
                                        </li>
                                        <li data-value="1" class="option">
                                            Sort by average rating
                                        </li>
                                        <li data-value="1" class="option">
                                            Sort by latest
                                        </li>
                                    </ul>
                                </div>
                                <div class="icon">
                                    <a href="shop-list.html"><i class="fas fa-list"></i></a>
                                </div>
                                <div class="icon-2 active">
                                    <a href="shop.html"><i class="fa-sharp fa-regular fa-grid-2"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-4 order-2 order-md-1 wow fadeInUp" data-wow-delay=".3s">
                        <div class="main-sidebar">
                            <div class="single-sidebar-widget">
                                <div class="wid-title">
                                    <h5>Search</h5>
                                </div>
                                <form action="home" class="search-toggle-box" method="GET">
                                    <input type="hidden" name="search" value="searchByName">
                                    <div class="input-area search-container">
                                        <input class="search-input" type="text" placeholder="Search here" name="keyword">
                                        <a onclick="return this.closest('form').submit()">
                                        <button class="cmn-btn search-icon">
                                            <i class="far fa-search"></i>
                                        </button>
                                        </a>
                                    </div>
                                </form>
                            </div>
                            <div class="single-sidebar-widget">
                                <div class="wid-title">
                                    <h5>Categories</h5>
                                </div>
                                <div class="categories-list">
                                    <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                                        <c:forEach items="${listCategory}" var="c">
                                            <li class="nav-item" role="presentation">
                                                <a href="home?search=category&categoryId=${c.category_id}">
                                                    <button class="nav-link" id="pills-arts-tab" data-bs-toggle="pill"
                                                            data-bs-target="#pills-arts" type="button" role="tab"
                                                            aria-controls="pills-arts" aria-selected="true">${c.getCategory_name()}</button>
                                                </a>
                                            </li>
                                         </c:forEach>
                                    </ul>
                                </div>
                            </div>
                            <div class="single-sidebar-widget">
                                <div class="wid-title">
                                    <h5>Product Status</h5>
                                </div>
                                <div class="product-status">
                                    <div class="product-status_stock  gap-6 d-flex align-items-center">
                                        <div class="nice-select category" tabindex="0"><span class="current">
                                                In Stock
                                            </span>
                                            <ul class="list">
                                                <li data-value="1" class="option selected">
                                                    In Stock
                                                </li>
                                                <li data-value="1" class="option">
                                                    Castle In The Sky
                                                </li>
                                                <li data-value="1" class="option">
                                                    The Hidden Mystery Behind
                                                </li>
                                                <li data-value="1" class="option">
                                                    Flovely And Unicom Erna
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="product-status_sale gap-6 d-flex align-items-center">
                                        <div class="nice-select category" tabindex="0">
                                            <span class="current">
                                                On Sale
                                            </span>
                                            <ul class="list">
                                                <li data-value="1" class="option selected">
                                                    On Sale
                                                </li>
                                                <li data-value="1" class="option">
                                                    Flovely And Unicom Erna
                                                </li>
                                                <li data-value="1" class="option">
                                                    Castle In The Sky
                                                </li>
                                                <li data-value="1" class="option">
                                                    How Deal With Very Bad BOOK
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="single-sidebar-widget mb-50">
                                <div class="wid-title">
                                    <h5>Filter By Price</h5>
                                </div>
                                <div class="range__barcustom">
                                    <div class="slider">
                                        <div class="progress" style="left: 15.29%; right: 58.9%;"></div>
                                    </div>
                                    <div class="range-input">
                                        <input type="range" class="range-min" min="0" max="10000" value="2500">
                                        <input type="range" class="range-max" min="100" max="10000" value="7500">
                                    </div>
                                    <div class="range-items">
                                        <div class="price-input">
                                            <div class="d-flex align-items-center">
                                                <a href="shop-left-sidebar.html" class="filter-btn mt-2 me-3">Filter</a>
                                                <div class="field">
                                                    <span>Price:</span>
                                                </div>
                                                <div class="field">
                                                    <span>$</span>
                                                    <input type="number" class="input-min" value="100">
                                                </div>
                                                <div class="separators">-</div>
                                                <div class="field">
                                                    <span>$</span>
                                                    <input type="number" class="input-max" value="1000">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="single-sidebar-widget mb-0">
                                <div class="wid-title">
                                    <h5>By Review</h5>
                                </div>
                                <div class="categories-list">
                                    <label class="checkbox-single d-flex align-items-center">
                                        <span class="d-flex gap-xl-3 gap-2 align-items-center">
                                            <span class="checkbox-area d-center">
                                                <input type="checkbox">
                                                <span class="checkmark d-center"></span>
                                            </span>
                                            <span class="text-color">
                                                <span class="star">
                                                    <i class="fa-solid fa-star"></i>
                                                    <i class="fa-solid fa-star"></i>
                                                    <i class="fa-solid fa-star"></i>
                                                    <i class="fa-solid fa-star"></i>
                                                    <i class="fa-solid fa-star"></i>
                                                </span>
                                                35
                                            </span>
                                        </span>
                                    </label>
                                    <label class="checkbox-single d-flex align-items-center">
                                        <span class="d-flex gap-xl-3 gap-2 align-items-center">
                                            <span class="checkbox-area d-center">
                                                <input type="checkbox">
                                                <span class="checkmark d-center"></span>
                                            </span>
                                            <span class="text-color">
                                                <span class="star">
                                                    <i class="fa-solid fa-star"></i>
                                                    <i class="fa-solid fa-star"></i>
                                                    <i class="fa-solid fa-star"></i>
                                                    <i class="fa-solid fa-star"></i>
                                                    <i class="fa-sharp fa-light fa-star"></i>
                                                </span>
                                                24
                                            </span>
                                        </span>
                                    </label>
                                    <label class="checkbox-single d-flex align-items-center">
                                        <span class="d-flex gap-xl-3 gap-2 align-items-center">
                                            <span class="checkbox-area d-center">
                                                <input type="checkbox">
                                                <span class="checkmark d-center"></span>
                                            </span>
                                            <span class="text-color">
                                                <span class="star">
                                                    <i class="fa-solid fa-star"></i>
                                                    <i class="fa-solid fa-star"></i>
                                                    <i class="fa-solid fa-star"></i>
                                                    <i class="fa-sharp fa-light fa-star"></i>
                                                    <i class="fa-sharp fa-light fa-star"></i>
                                                </span>
                                                15
                                            </span>
                                        </span>
                                    </label>
                                    <label class="checkbox-single d-flex align-items-center">
                                        <span class="d-flex gap-xl-3 gap-2 align-items-center">
                                            <span class="checkbox-area d-center">
                                                <input type="checkbox">
                                                <span class="checkmark d-center"></span>
                                            </span>
                                            <span class="text-color">
                                                <span class="star">
                                                    <i class="fa-solid fa-star"></i>
                                                    <i class="fa-solid fa-star"></i>
                                                    <i class="fa-sharp fa-light fa-star"></i>
                                                    <i class="fa-sharp fa-light fa-star"></i>
                                                    <i class="fa-sharp fa-light fa-star"></i>
                                                </span>
                                                2
                                            </span>
                                        </span>
                                    </label>
                                    <label class="checkbox-single d-flex align-items-center">
                                        <span class="d-flex gap-xl-3 gap-2 align-items-center">
                                            <span class="checkbox-area d-center">
                                                <input type="checkbox">
                                                <span class="checkmark d-center"></span>
                                            </span>
                                            <span class="text-color">
                                                <span class="star">
                                                    <i class="fa-solid fa-star"></i>
                                                    <i class="fa-sharp fa-light fa-star"></i>
                                                    <i class="fa-sharp fa-light fa-star"></i>
                                                    <i class="fa-sharp fa-light fa-star"></i>
                                                    <i class="fa-sharp fa-light fa-star"></i>
                                                </span>
                                                1
                                            </span>
                                        </span>
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-xl-9 col-lg-8 order-1 order-md-2">
                        <div class="tab-content" id="pills-tabContent">
                            <div class="tab-pane fade show active" id="pills-arts" role="tabpanel"
                                aria-labelledby="pills-arts-tab" tabindex="0">
                                <div class="row">
                                    <c:forEach items="${listProduct}" var="p">
                                        <div class="col-xl-3 col-lg-4 col-md-6 wow fadeInUp" data-wow-delay=".2s">
                                        <div class="shop-box-items">
                                            <div class="book-thumb center">
                                                <a href="product-details?id=${p.getProduct_id()}"><img src="${pageContext.request.contextPath}/img/book/01.png" alt="img"></a>
                                                <ul class="shop-icon d-grid justify-content-center align-items-center">
                                                    <li>
                                                        <a href="shop-cart.html"><i class="far fa-heart"></i></a>
                                                    </li>
                                                    <li>
                                                        <a href="shop-cart.html">
                                                            <img class="icon" src="${pageContext.request.contextPath}/img/icon/shuffle.svg"
                                                                alt="svg-icon">
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a href="shop-details.html"><i class="far fa-eye"></i></a>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="shop-content">
                                                <h3><a href="product-details?id=${p.getProduct_id()}">${p.getTitle()}</a></h3>
                                                <ul class="price-list">
                                                    <li>$30.00</li>
                                                    <li>
                                                        <i class="fa-solid fa-star"></i>
                                                        3.4 (25)
                                                    </li>
                                                </ul>
                                                <div class="shop-button">
                                                    <a href="product-details?id=${p.getProduct_id()}" class="theme-btn"><i
                                                            class="fa-solid fa-basket-shopping"></i> Add To Cart</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    </c:forEach>                            
                                </div>
                            </div>
                        </div>
                                                                
                        <div class="page-nav-wrap text-center">
                            <ul>
                            <c:forEach begin="1" end="${pageControl.totalPage}" var="pageNumber">
                                <li><a class="page-numbers" href="${pageControl.getUrlPattern()}page=${pageNumber}">${pageNumber}</a></li>
                            </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer Section Start -->
    <jsp:include page="../common/hompage/Footer Section.jsp"></jsp:include>

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
</body>


<!-- Mirrored from gramentheme.com/html/bookle/shop.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 25 Oct 2025 11:38:55 GMT -->
</html>