<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="com.example.examplejee.Product" %>
<%@ page import="java.util.List" %>


<!DOCTYPE html>
<html>
<head>
    <title>Opensky - MarketPlace</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<% List<Product> L = (List<Product>) session.getAttribute("products");%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand fw-normal mb-0 text-black" href="Home.jsp">Opensky</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto text-end">
                <li class="nav-item active">
                    <a class="nav-link active" aria-current="page" href="Home.jsp">Home</a>
                </li>
                <% if (session.getAttribute("uname")!=null){ %>

                <li class="nav-item">
                    <a class="nav-link" href="Profile.jsp"><%=session.getAttribute("uname")%></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Basket.jsp">Cart: <%=L.size()%> </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Logout">logout</a>
                </li>
                <%}else{%>
                <li class="nav-item">
                    <a class="nav-link" href="login.jsp">login</a>
                </li>
                <%}%>
            </ul>
        </div>
    </div>
</nav>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    </body>
</html>