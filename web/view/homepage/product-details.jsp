<%-- 
    Document   : product-details
    Created on : Oct 26, 2025, 5:31:07 PM
    Author     : phamm
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <!--<< Header Area >>-->


    <!-- Mirrored from gramentheme.com/html/bookle/shop-details.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 25 Oct 2025 11:38:57 GMT -->
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

        <jsp:include page="../common/hompage/header top.jsp"></jsp:include>

        <!-- Sticky Header Section start  -->
        <jsp:include page="../common/hompage/Sticky Header.jsp"></jsp:include>

        <!-- Main Header Section start  -->
        <jsp:include page="../common/hompage/Main Header Section.jsp"></jsp:include>

        <!-- Login Modal -->
        <jsp:include page="../authen/Login Modal.jsp"></jsp:include>

        <!-- Registration Modal -->
        <jsp:include page="../authen/register.jsp"></jsp:include>

        <!-- Breadcumb Section Start -->
        <jsp:include page="../common/hompage/Breadcumb Section.jsp"></jsp:include>

        <!-- Shop Details Section Start -->
        <section class="shop-details-section fix section-padding">
            <div class="container">
                <div class="shop-details-wrapper">
                    <div class="row g-4">
                        <div class="col-lg-5">
                            <div class="shop-details-image">
                                <div class="tab-content">
                                    <div id="thumb1" class="tab-pane fade show active">
                                        <div class="shop-details-thumb">
                                            <img src="${pageContext.request.contextPath}/img/shop-details/01.png" alt="img">
                                        </div>
                                    </div>
                                    <div id="thumb2" class="tab-pane fade">
                                        <div class="shop-details-thumb">
                                            <img src="${pageContext.request.contextPath}/img/shop-details/02.png" alt="img">
                                        </div>
                                    </div>
                                    <div id="thumb3" class="tab-pane fade">
                                        <div class="shop-details-thumb">
                                            <img src="${pageContext.request.contextPath}/img/shop-details/03.png" alt="img">
                                        </div>
                                    </div>
                                    <div id="thumb4" class="tab-pane fade">
                                        <div class="shop-details-thumb">
                                            <img src="${pageContext.request.contextPath}/img/shop-details/04.png" alt="img">
                                        </div>
                                    </div>
                                    <div id="thumb5" class="tab-pane fade">
                                        <div class="shop-details-thumb">
                                            <img src="${pageContext.request.contextPath}/img/shop-details/05.png" alt="img">
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="col-lg-7">
                            <div class="shop-details-content">
                                <div class="title-wrapper">
                                    <h2>${productFoundById.title}</h2>
                                    <h5>Stock availability.</h5>
                                </div>
                                <div class="star">
                                    <a href="shop-details.html"> <i class="fas fa-star"></i></a>
                                    <a href="shop-details.html"><i class="fas fa-star"></i></a>
                                    <a href="shop-details.html"> <i class="fas fa-star"></i></a>
                                    <a href="shop-details.html"><i class="fas fa-star"></i></a>
                                    <a href="shop-details.html"><i class="fa-regular fa-star"></i></a>
                                </div>
                                <p>
                                    ${productFoundById.description}
                                </p>
                                <div class="price-list">
                                    <h3>${productFoundById.price}</h3>
                                </div>
                                <div class="cart-wrapper">
                                    <form action="${pageContext.request.contextPath}/payment?action=AddProduct" method="POST">
                                        <div class="quantity-basket">
                                            <p class="qty">
                                                <button class="qtyminus" aria-hidden="true">−</button>
                                                <input type="number" name="quantity" id="qty2" min="1" max="10" step="1" value="1">
                                                <button class="qtyplus" aria-hidden="true">+</button>
                                            </p>
                                        </div> 
                                        <input type="hidden" name="id" value="${productFoundById.product_id}">
                                        <a href="javascript:void(0)" onclick="return this.closest('form').submit()" class="theme-btn">
                                            <i class="fa-solid fa-basket-shopping"></i> Add To Cart
                                        </a>
                                    </form>
                                    <div class="icon-box">
                                        <a href="shop-details.html" class="icon">
                                            <i class="far fa-heart"></i>
                                        </a>
                                        <a href="shop-details.html" class="icon-2">
                                            <img src="${pageContext.request.contextPath}/img/icon/shuffle.svg" alt="svg-icon">
                                        </a>
                                    </div>
                                </div>
                                <div class="category-box">
                                    <div class="category-list">
                                        
                                        <ul>
                                            <li>
                                                <span>Author:</span> ${productFoundById.author}
                                            </li>
                                            <li>
                                                <span>Publisher:</span> ${productFoundById.publisher}
                                            </li>
                                        </ul>
                                        <ul>
                                            <li>
                                                <span>Publish Years:</span> ${productFoundById.publication_year}
                                            </li>
                                            <li>
                                                <span>Stock Quantity:</span> ${productFoundById.stock_quantity}
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="box-check">
                                    <div class="check-list">
                                        <ul>
                                            <li>
                                                <i class="fa-solid fa-check"></i>
                                                Free shipping orders from $150
                                            </li>
                                            <li>
                                                <i class="fa-solid fa-check"></i>
                                                30 days exchange & return
                                            </li>
                                        </ul>
                                        <ul>
                                            <li>
                                                <i class="fa-solid fa-check"></i>
                                                Mamaya Flash Discount: Starting at 30% Off
                                            </li>
                                            <li>
                                                <i class="fa-solid fa-check"></i>
                                                Safe & Secure online shopping
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="social-icon">
                                    <h6>Also Available On:</h6>
                                    <a href="https://www.customer.io/"><img src="${pageContext.request.contextPath}/img/cutomerio.png" alt="cutomer.io"></a>
                                    <a href="https://www.amazon.com/"><img src="${pageContext.request.contextPath}/img/amazon.png" alt="amazon"></a>
                                    <a href="https://www.dropbox.com/"><img src="${pageContext.request.contextPath}/img/dropbox.png" alt="dropbox"></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Top Ratting Book Section Start -->
        <section class="top-ratting-book-section fix section-padding pt-0">
            <div class="container">
                <div class="section-title text-center">
                    <h2 class="mb-3 wow fadeInUp" data-wow-delay=".3s">Related Products</h2>
                    <p class="wow fadeInUp" data-wow-delay=".5s">
                        Interdum et malesuada fames ac ante ipsum primis in faucibus. <br> Donec at nulla nulla. Duis
                        posuere ex lacus
                    </p>
                </div>
                <div class="swiper book-slider">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide">
                            <div class="shop-box-items style-2">
                                <div class="book-thumb center">
                                    <a href="shop-details-2.html"><img src="${pageContext.request.contextPath}/img/book/01.png" alt="img"></a>
                                    <ul class="post-box">
                                        <li>
                                            Hot
                                        </li>
                                        <li>
                                            -30%
                                        </li>
                                    </ul>
                                    <ul class="shop-icon d-grid justify-content-center align-items-center">
                                        <li>
                                            <a href="shop-cart.html"><i class="far fa-heart"></i></a>
                                        </li>
                                    </ul>
                                    <ul class="shop-icon d-grid justify-content-center align-items-center">
                                        <li>
                                            <a href="shop-cart.html"><i class="far fa-heart"></i></a>
                                        </li>
                                        <li>
                                            <a href="shop-cart.html">

                                                <img class="icon" src="${pageContext.request.contextPath}/img/icon/shuffle.svg" alt="svg-icon">
                                            </a>
                                        </li>
                                        <li>
                                            <a href="shop-details.html"><i class="far fa-eye"></i></a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="shop-content">
                                    <h5> Design Low Book </h5>
                                    <h3><a href="shop-details.html">Simple Things You To <br> Save BOOK</a></h3>
                                    <ul class="price-list">
                                        <li>$30.00</li>
                                        <li>
                                            <del>$39.99</del>
                                        </li>
                                    </ul>
                                    <ul class="author-post">
                                        <li class="authot-list">
                                            <span class="thumb">
                                                <img src="${pageContext.request.contextPath}/img/testimonial/client-1.png" alt="img">
                                            </span>
                                            <span class="content">Wilson</span>
                                        </li>

                                        <li class="star">
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-regular fa-star"></i>
                                        </li>
                                    </ul>
                                </div>
                                <div class="shop-button">
                                    <a href="shop-details.html" class="theme-btn"><i
                                            class="fa-solid fa-basket-shopping"></i> Add To Cart</a>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div class="shop-box-items style-2">
                                <div class="book-thumb center">
                                    <a href="shop-details-2.html"><img src="${pageContext.request.contextPath}/img/book/02.png" alt="img"></a>
                                    <ul class="shop-icon d-grid justify-content-center align-items-center">
                                        <li>
                                            <a href="shop-cart.html"><i class="far fa-heart"></i></a>
                                        </li>
                                        <li>
                                            <a href="shop-cart.html">

                                                <img class="icon" src="${pageContext.request.contextPath}/img/icon/shuffle.svg" alt="svg-icon">
                                            </a>
                                        </li>
                                        <li>
                                            <a href="shop-details.html"><i class="far fa-eye"></i></a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="shop-content">
                                    <h5> Design Low Book </h5>
                                    <h3><a href="shop-details.html">How Deal With Very <br> Bad BOOK</a></h3>
                                    <ul class="price-list">
                                        <li>$30.00</li>
                                        <li>
                                            <del>$39.99</del>
                                        </li>
                                    </ul>
                                    <ul class="author-post">
                                        <li class="authot-list">
                                            <span class="thumb">
                                                <img src="${pageContext.request.contextPath}/img/testimonial/client-2.png" alt="img">
                                            </span>
                                            <span class="content">Alexander</span>
                                        </li>

                                        <li class="star">
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-regular fa-star"></i>
                                        </li>
                                    </ul>
                                </div>
                                <div class="shop-button">
                                    <a href="shop-details.html" class="theme-btn"><i
                                            class="fa-solid fa-basket-shopping"></i> Add To Cart</a>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div class="shop-box-items style-2">
                                <div class="book-thumb center">
                                    <a href="shop-details-2.html"><img src="${pageContext.request.contextPath}/img/book/03.png" alt="img"></a>
                                    <ul class="shop-icon d-grid justify-content-center align-items-center">
                                        <li>
                                            <a href="shop-cart.html"><i class="far fa-heart"></i></a>
                                        </li>
                                        <li>
                                            <a href="shop-cart.html">

                                                <img class="icon" src="${pageContext.request.contextPath}/img/icon/shuffle.svg" alt="svg-icon">
                                            </a>
                                        </li>
                                        <li>
                                            <a href="shop-details.html"><i class="far fa-eye"></i></a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="shop-content">
                                    <h5> Design Low Book </h5>
                                    <h3><a href="shop-details.html">Qple GPad With Retina <br> Sisplay</a></h3>
                                    <ul class="price-list">
                                        <li>$30.00</li>
                                        <li>
                                            <del>$39.99</del>
                                        </li>
                                    </ul>
                                    <ul class="author-post">
                                        <li class="authot-list">
                                            <span class="thumb">
                                                <img src="${pageContext.request.contextPath}/img/testimonial/client-3.png" alt="img">
                                            </span>
                                            <span class="content">Esther</span>
                                        </li>

                                        <li class="star">
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-regular fa-star"></i>
                                        </li>
                                    </ul>
                                </div>
                                <div class="shop-button">
                                    <a href="shop-details.html" class="theme-btn"><i
                                            class="fa-solid fa-basket-shopping"></i> Add To Cart</a>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div class="shop-box-items style-2">
                                <div class="book-thumb center">
                                    <a href="shop-details-2.html"><img src="${pageContext.request.contextPath}/img/book/04.png" alt="img"></a>
                                    <ul class="post-box">
                                        <li>
                                            Hot
                                        </li>
                                    </ul>
                                    <ul class="shop-icon d-grid justify-content-center align-items-center">
                                        <li>
                                            <a href="shop-cart.html"><i class="far fa-heart"></i></a>
                                        </li>
                                        <li>
                                            <a href="shop-cart.html">

                                                <img class="icon" src="${pageContext.request.contextPath}/img/icon/shuffle.svg" alt="svg-icon">
                                            </a>
                                        </li>
                                        <li>
                                            <a href="shop-details.html"><i class="far fa-eye"></i></a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="shop-content">
                                    <h5> Design Low Book </h5>
                                    <h3><a href="shop-details.html">Qple GPad With Retina <br> Sisplay</a></h3>
                                    <ul class="price-list">
                                        <li>$30.00</li>
                                        <li>
                                            <del>$39.99</del>
                                        </li>
                                    </ul>
                                    <ul class="author-post">
                                        <li class="authot-list">
                                            <span class="thumb">
                                                <img src="${pageContext.request.contextPath}/img/testimonial/client-4.png" alt="img">
                                            </span>
                                            <span class="content">Hawkins</span>
                                        </li>

                                        <li class="star">
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-regular fa-star"></i>
                                        </li>
                                    </ul>
                                </div>
                                <div class="shop-button">
                                    <a href="shop-details.html" class="theme-btn"><i
                                            class="fa-solid fa-basket-shopping"></i> Add To Cart</a>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div class="shop-box-items style-2">
                                <div class="book-thumb center">
                                    <a href="shop-details-2.html"><img src="${pageContext.request.contextPath}/img/book/05.png" alt="img"></a>
                                    <ul class="shop-icon d-grid justify-content-center align-items-center">
                                        <li>
                                            <a href="shop-cart.html"><i class="far fa-heart"></i></a>
                                        </li>
                                        <li>
                                            <a href="shop-cart.html">

                                                <img class="icon" src="${pageContext.request.contextPath}/img/icon/shuffle.svg" alt="svg-icon">
                                            </a>
                                        </li>
                                        <li>
                                            <a href="shop-details.html"><i class="far fa-eye"></i></a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="shop-content">
                                    <h5> Design Low Book </h5>
                                    <h3><a href="shop-details.html">Simple Things You To <br> Save BOOK</a></h3>
                                    <ul class="price-list">
                                        <li>$30.00</li>
                                        <li>
                                            <del>$39.99</del>
                                        </li>
                                    </ul>
                                    <ul class="author-post">
                                        <li class="authot-list">
                                            <span class="thumb">
                                                <img src="${pageContext.request.contextPath}/img/testimonial/client-5.png" alt="img">
                                            </span>
                                            <span class="content">(Author) Albert</span>
                                        </li>

                                        <li class="star">
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-regular fa-star"></i>
                                        </li>
                                    </ul>
                                </div>
                                <div class="shop-button">
                                    <a href="shop-details.html" class="theme-btn"><i
                                            class="fa-solid fa-basket-shopping"></i> Add To Cart</a>
                                </div>
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


    <!-- Mirrored from gramentheme.com/html/bookle/shop-details.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 25 Oct 2025 11:39:01 GMT -->
</html>