<%--
  Created by IntelliJ IDEA.
  User: lakteb
  Date: 20/05/2022
  Time: 09:07
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="index.jsp"%>
<%@ page import="java.util.List"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.examplejee.Product" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="com.example.examplejee.Cart" %>
<section class="h-100 h-custom" style="background-color: #f8f9fa;">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-12">
                <div class="card card-registration card-registration-2" style="border-radius: 15px;">

                    <div class="card-body p-0">
                        <div class="row g-0">
                            <div class="col-lg-8">
                                <div class="p-5">
                                    <div class="d-flex justify-content-between align-items-center mb-5">
                                        <h1 class="fw-bold mb-0 text-black">Shopping Cart</h1>
                                        <h6 class="mb-0 text-muted"><%= L.size()%> items</h6>
                                    </div>
                                    <hr class="my-4">
                                    <%  for (Product p : L) {%>
                                    <div class="row mb-4 d-flex justify-content-between align-items-center">
                                        <div class="col-md-2 col-lg-2 col-xl-2">
                                            <img
                                                    src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-shopping-carts/img1.webp"
                                                    class="img-fluid rounded-3" alt="Cotton T-shirt">
                                        </div>
                                        <div class="col-md-3 col-lg-3 col-xl-3">
                                            <h6 class="text-muted"><%=p.getName()%></h6>
                                            <h6 class="text-black mb-0"><%= p.getDescription()%></h6>
                                        </div>
                                        <div class="col-md-3 col-lg-3 col-xl-2 d-flex">
                                            <button class="btn btn-link px-2"
                                                    onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
                                                <i class="fas fa-minus"></i>
                                            </button>

                                            <input id="form1" min="0" name="quantity" value="1" type="number"
                                                   class="form-control form-control-sm" />

                                            <button class="btn btn-link px-2"
                                                    onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
                                                <i class="fas fa-plus"></i>
                                            </button>
                                        </div>
                                        <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                                            <h6 class="mb-0">$ <%=p.getPrice()%></h6>
                                        </div>
                                        <form action="Remove" method="post" class="col-md-1 col-lg-2 col-xl-2 text-end" >
                                            <input  imin="0" name="quantity" value="1" type="hidden"
                                                   class="form-control form-control-sm" />

                                            <input type="hidden" name="id" value="<%=L.indexOf(p)%>">
                                        <div class="col-md-1 col-lg-1 col-xl-1 text-end">
                                            <button type="submit" class="btn btn-danger">X</button>
                                        </div>
                                        </form>
                                    </div>
                                    <%}%>
                                    <hr class="my-4">



                                    <hr class="my-4">

                                    <div class="pt-5">
                                        <h6 class="mb-0"><a href="Home.jsp" class="text-body"><i
                                                class="fas fa-long-arrow-alt-left me-2"></i>Back to shop</a></h6>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 bg-grey">
                                <div class="p-5">
                                    <h3 class="fw-bold mb-5 mt-2 pt-1">Summary</h3>
                                    <hr class="my-4">
                                    <%int x=0;%>
                                    <%  for (Product p : L) {
                                     x+= p.getPrice(); }%>
                                    <div class="d-flex justify-content-between mb-4">
                                        <h5 class="text-uppercase">items <%=L.size()%></h5>
                                        <h5>$ <%=x%></h5>
                                    </div>

                                    <h5 class="text-uppercase mb-3">Shipping</h5>

                                    <div class="mb-4 pb-2">
                                        <select class="select">
                                            <option value="1">Standard-Delivery- $5.00</option>
                                            <option value="2">Two</option>
                                            <option value="3">Three</option>
                                            <option value="4">Four</option>
                                        </select>
                                    </div>

                                    <hr class="my-4">

                                    <div class="d-flex justify-content-between mb-5">
                                        <h5 class="text-uppercase">Total price</h5>
                                        <h5>$ <%= x + 5%></h5>
                                    </div>

                                        <a  href="Buy.jsp" class="btn btn-dark btn-block btn-lg"
                                                data-mdb-ripple-color="dark">BUY</a>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
