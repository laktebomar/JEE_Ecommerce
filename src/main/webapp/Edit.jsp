<%--
  Created by IntelliJ IDEA.
  User: lakteb
  Date: 26/05/2022
  Time: 17:09
  To change this template use File | Settings | File Templates.
--%>
<%@include file="index.jsp"%>
<%@ page import="java.sql.*" %>

<% if (session.getAttribute("uname")==null){ response.sendRedirect("login.jsp"); }%>
<%


  Connection conn = null;
  try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/PROJET_JEE", "root", "");
    PreparedStatement ps = conn.prepareStatement("SELECT * FROM Products where name = ?");

    ps.setString(1, (String) session.getAttribute("pname"));
    int rs = ps.executeUpdate();

    if (rs>1){
      session.setAttribute("q", rs.getInt("quantity"));
      session.setAttribute("p", rs.getInt("price"));
      session.setAttribute("n",rs.getString("name"));
      session.setAttribute("d", rs.getString("description"));
      session.setAttribute("un", rs.getString("uname"));
      session.setAttribute("id", rs.getInt("id"));
    }

    conn.close();
  } catch (Exception e) {
    e.printStackTrace();
  }
%>
<% if (session.getAttribute("uname")==null){ response.sendRedirect("login.jsp");}%>
<form action="Update" method="post" class="container">
<div class="card rounded-3 mb-2 shadow rounded-3">
  <div class="card-body p-4">
    <div class="row d-flex justify-content-between align-items-center">
      <div class="col-md-2 col-lg-2 col-xl-2">
        <img
                src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-shopping-carts/img1.webp"
                class="img-fluid rounded-3" alt="Cotton T-shirt">
      </div>
      <input type="hidden" name="id" value="<%=session.getAttribute("id")%>">
      <div class="col-md-3 col-lg-3 col-xl-3">
        <input class="lead fw-normal mb-2" name="pname" value="<%=session.getAttribute("n")%>"/>
        <p><span class="text-muted">Buyer:<input name="uname" type="text" value="<%=session.getAttribute("un")%>"> </span> <span class="text-muted">Quantity:<input name="quantity" type="text" value="<%=session.getAttribute("q")%>"> </span> </p>
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
        <h5 class="mb-0">$<input type="text" name="price" value="<%=session.getAttribute("p")%>"></h5>
      </div>
      <div class="col-md-2 col-lg-2 col-xl-2 text-end">
         <button type="submit" class="add-to-cart btn btn-primary">update</button>
      </div>
    </div>
  </div>
</div>
</form>