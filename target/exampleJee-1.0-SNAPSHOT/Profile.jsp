<%--
  Created by IntelliJ IDEA.
  User: lakteb
  Date: 16/05/2022
  Time: 17:24
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="index.jsp"%>
<%@page import="java.util.List"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="com.example.examplejee.Product" %>
<% if (session.getAttribute("uname")==null){ response.sendRedirect("login.jsp"); }%>
<%

    session.getAttribute("uname");

    Connection conn = null;
    List<Product> ll = new LinkedList();
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/PROJET_JEE", "root", "");
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM Products where uname = ?");

        ps.setString(1, (String) session.getAttribute("uname"));
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
<% if (session.getAttribute("uname")==null){ response.sendRedirect("login.jsp"); }%>
<section class="h-100 gradient-custom-2">
    <div class="container py-1 h-80">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col col-lg-9 col-xl-7">
                <div class="card">
                    <div class="rounded-top text-white d-flex flex-row" style="background-color: #000; height:200px;">
                        <div class="ms-4 mt-5 d-flex flex-column" style="width: 150px;">
                            <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-profiles/avatar-1.webp"
                                 alt="Generic placeholder image" class="img-fluid img-thumbnail mt-4 mb-2"
                                 style="width: 150px; z-index: 1">
                            <button type="button" class="btn btn-outline-dark" data-mdb-ripple-color="dark"
                                    style="z-index: 1;">
                                <a href="Addproduct.jsp">Add Product</a>
                            </button>
                        </div>
                        <div class="ms-3" style="margin-top: 130px;">
                            <h5><%=session.getAttribute("uname")%></h5>
                            <p><%=session.getAttribute("mail")%></p>
                        </div>
                    </div>
                    <div class="p-4 text-black" style="background-color: #f8f9fa;">
                        <div class="d-flex justify-content-end text-center py-1">
                            <div>
                                <p class="mb-1 h5"><%= ll.size()%></p>
                                <p class="small text-muted mb-0">Product listed</p>
                            </div>
                            <div class="px-3">
                                <p class="mb-1 h5">0</p>
                                <p class="small text-muted mb-0">Product Bought</p>
                            </div>
                        </div>
                    </div>
                    <div class="card-body p-4 text-black">
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <p class="lead fw-normal mb-0">Recent photos</p>
                            <p class="mb-0"><a href="#!" class="text-muted">Show all</a></p>
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
                                        <p class="lead fw-normal mb-2" name="pnom"><%=p.getName()%></p>
                                        <p><span class="text-muted" name="unom">Buyer:<%=p.getUname()%> </span> <span class="text-muted" name="quanti">Quantity:<%=p.getQuantity()%> </span> </p>
                                    </div>
                                    <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                                        <h5 class="mb-0" name="pri">$<%=p.getPrice()%></h5>
                                    </div>
                                    <div class="col-md-1 col-lg-2 col-xl-2 text-end">
                                        <a href="Edit.jsp" class="add-to-cart btn btn-primary" >edit</a>
                                    </div>
                                    <form action="Delete" method="post" class="col-md-1 col-lg-2 col-xl-2 text-end">
                                        <input type="hidden" value="<%=p.getId()%> " name="id">
                                        <button type="submit" class="btn btn-danger">X</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <%}%>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>