<%-- 
    Document   : header top
    Created on : Oct 26, 2025, 9:53:35 AM
    Author     : phamm
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="header-top-1">
        <div class="container">
            <div class="header-top-wrapper">
                <ul class="contact-list">
                    <li>
                        <i class="fa-regular fa-phone"></i>
                        <a href="tel:+20866660112">+85 35 8089 221</a>
                    </li>
                    <li>
                        <i class="far fa-envelope"></i>
                        <a href="mailto:info@example.com">bookle@gmail.com</a>
                    </li>
                    <li>
                        <i class="far fa-clock"></i>
                        <span>Sunday - Fri: 9 aM - 6 pM</span>
                    </li>
                </ul>
                <ul class="list">
                    <c:if test="${sessionScope.account != null}">
                        <c:if test="${sessionScope.account.roleId == 2 || sessionScope.account.roleId == 4}">
                        <li><i class="fa-light fa-user"></i></i><a href="${pageContext.request.contextPath}/dashboard">My Account</a></li>
                        </c:if>
                        <c:if test="${sessionScope.account.roleId == 1 || sessionScope.account.roleId == 3}">
                        <li><i class="fa-light fa-user"></i></i><a href="${pageContext.request.contextPath}/admin/dashboard">My Account</a></li>
                        </c:if>
                            </c:if>
                    <li><i class="fa-light fa-comments"></i><a href="contact.html">Live Chat</a></li>
                            <c:if test="${sessionScope.account == null}">
                        <li><i class="fa-light fa-user"></i>
                            <a href="authen?action=login" data-bs-toggle="modal" data-bs-target="#loginModal">
                                Login
                            </a>
                        </li>
                        <li><i class="fa-light fa-user"></i>
                            <a href="authen?action=signUp" data-bs-toggle="modal" data-bs-target="#signUpModal">
                                Sign Up
                            </a>
                        </li>
                    </c:if>
                    <c:if test="${sessionScope.account != null}">
                        <li><i class="fa-light fa-user"></i>
                            <a href="authen?action=logOut" >
                                Log Out
                            </a>
                        </li>
                    </c:if>
                </ul>
            </div>
        </div>
    </div>
