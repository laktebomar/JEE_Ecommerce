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
        <%@ page import="com.example.examplejee.Product" %>
        <%

            session.getAttribute("uname");
            String name = (String) session.getAttribute("uname");
            Connection conn = null;
            List<Product> ll = new LinkedList();
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/PROJET_JEE", "root", "");
                PreparedStatement ps = null;
                if (name !=null){
                    ps = conn.prepareStatement("SELECT * FROM Products where uname <> ? ORDER BY id desc ");
                    ps.setString(1, name);
                }else {
                    ps = conn.prepareStatement("SELECT * FROM Products ORDER BY id desc ");
                }


                ResultSet rs = ps.executeQuery();

                while (rs.next()){
                    int id = rs.getInt("id");
                    int q = rs.getInt("quantity");
                    int pr = rs.getInt("price");
                    String pn = rs.getString("name");
                    String des = rs.getString("description");
                    String uname = rs.getString("uname");
                    Product p = new Product(id, pn, des, uname, pr, q);
                    ll.add(p);
                }

                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
        <%  List<Product> ll1 = new LinkedList();%>
<section class="h-100" style="background-color: #fff;">
    <div class="container h-100 py-5 ">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-10">
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
                                <input type="hidden" value="<%=p.getId()%>">
                                <p class="lead fw-normal mb-2"><%=p.getName()%></p>
                                <p><form action="User.jsp" method="post"><span class="text-muted">Seller:</span><input type="submit" name="n1" value="<%=p.getUname()%>"></form><span class="text-muted">Quantity: </span> <%=p.getQuantity()%></p>
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
                                <h5 class="mb-0">$<%=p.getPrice()%></h5>
                            </div>

                            <form action="Cart" method="post" class="col-md-2 col-lg-2 col-xl-2 text-end" >
                                <input type="hidden" value="<%=p.getId()%>" name="id">
                                <input type="hidden" value="1" name="quantity">
                                <button type="submit" class="add-to-cart btn btn-primary" >Add to cart</button>
                            </form>
                        </div>
                    </div>
                </div>
                <%}%>
            </div>
        </div>
    </div>
</section>