        <%--
  Created by IntelliJ IDEA.
  User: lakteb
  Date: 11/05/2022
  Time: 17:28
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="index.jsp"%>
<%@page import="java.util.List"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.LinkedList" %>

<%
    class Product {
        private String name, description;
        private int price, quantity;

        public Product(String name, String description, int price, int quantity) {
            this.name = name;
            this.description = description;
            this.price = price;
            this.quantity = quantity;
        }

        public String getName() {
            return name;
        }

        public String getDescription() {
            return description;
        }

        public int getPrice() {
            return price;
        }

        public int getQuantity() {
            return quantity;
        }
    }


    Connection conn = null;
    List<Product> ll = new LinkedList();
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/PROJET_JEE", "root", "");
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM Products");

        ResultSet rs = ps.executeQuery();

        while (rs.next()){
            int q = rs.getInt("quantity");
            int pr = rs.getInt("price");
            String pn = rs.getString("name");
            String des = rs.getString("description");
            Product p = new Product(pn, des, pr, q);
            ll.add(p);
        }

        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<section class="h-100" style="background-color: #fff;">
    <div class="container h-100 py-5 ">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-10">
                <div class="d-flex justify-content-between align-items-center mb-2">
                    <div>
                        <p class="mb-0"><span class="text-muted">Sort by:</span> <a href="#!" class="text-body">price <i
                                class="fas fa-angle-down mt-1"></i></a></p>
                    </div>
                </div>
                <% for (Product p   : ll){%>
                <div class="card rounded-3 mb-2 shadow rounded-3">
                    <div class="card-body p-4">
                        <div class="row d-flex justify-content-between align-items-center">
                            <div class="col-md-2 col-lg-2 col-xl-2">
                                <img
                                        src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-shopping-carts/img1.webp"
                                        class="img-fluid rounded-3" alt="Cotton T-shirt">
                            </div>

                            <div class="col-md-3 col-lg-3 col-xl-3">
                                <p class="lead fw-normal mb-2"><%=p.getName()%></p>
                                <p><span class="text-muted">Desc:</span><%=p.getDescription()%> <span class="text-muted">Quantity: </span> <%=p.getQuantity()%></p>
                            </div>
                            <div class="col-md-3 col-lg-3 col-xl-2 d-flex">
                                <button class="btn btn-link px-2"
                                        onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
                                    <i class="fas fa-minus"></i>
                                </button>

                                <input id="form1" min="0" name="quantity" value="2" type="number"
                                       class="form-control form-control-sm" />

                                <button class="btn btn-link px-2"
                                        onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
                                    <i class="fas fa-plus"></i>
                                </button>
                            </div>
                            <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                                <h5 class="mb-0">$<%=p.getPrice()%></h5>
                            </div>
                            <div class="col-md-2 col-lg-2 col-xl-2 text-end">
                                <a href="#!" class="add-to-cart btn btn-primary" >Add to cart</a>
                            </div>
                        </div>
                    </div>
                </div>
                <%}%>
            </div>
        </div>
    </div>
</section>