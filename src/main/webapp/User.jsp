<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.example.examplejee.User" %><%--
  Created by IntelliJ IDEA.
  User: lakteb
  Date: 30/05/2022
  Time: 11:11
  To change this template use File | Settings | File Templates.
--%>
<%@include file="index.jsp"%>
<html>
<head>
    <title>Note User</title>
</head>
<body>
<%

    String nn =request.getParameter("n1");

    Connection conn = null;
    List<User> noteList = new LinkedList<>();
    List<User> ll = new LinkedList();
    List<Product> ll1 = new LinkedList();
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/PROJET_JEE", "root", "");
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM users where username = ?");
        PreparedStatement ps1 = conn.prepareStatement("SELECT * FROM Products where uname = ?");
        PreparedStatement ps2 = conn.prepareStatement("SELECT note FROM note_user where uname = ?;");


        ps.setString(1, nn);
        ps1.setString(1, nn);
        ps2.setString(1, nn);
        ResultSet rs = ps.executeQuery();
        ResultSet rs1 = ps1.executeQuery();
        ResultSet rs2 = ps2.executeQuery();
        System.out.println(rs2);
        if (rs.next()){
            String pn = rs.getString("username");
            String des = rs.getString("email");
            String uname = rs.getString("password");
            User u = new User(pn, des, uname);
            session.setAttribute("user", u);
            ll.add(u);
        }

        while (rs1.next()){
            int id = rs1.getInt("id");
            int q = rs1.getInt("quantity");
            int pr = rs1.getInt("price");
            String pn = rs1.getString("name");
            String des = rs1.getString("description");
            String uname = rs1.getString("uname");
            Product p = new Product(id, pn, des, uname, pr, q);
            ll1.add(p);
        }
        while (rs2.next()){
            int unote = rs2.getInt("note");
            System.out.println(unote);
            User un = new User(unote);
            noteList.add(un);
            session.setAttribute("notes", noteList);
        }

        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

</body>
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
                            <form class="btn-group dropend" method="post" action="UserNote">
                                <button type="button" class="btn btn-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                                    Note user
                                </button>
                                <ul class="dropdown-menu">
                                    <li value="1"><input type="submit" name="note" value="1"></li>
                                    <li value="2"><input type="submit" name="note" value="2"></li>
                                    <li value="3"><input type="submit" name="note" value="3"></li>
                                    <li value="4"><input type="submit" name="note" value="4"></li>
                                    <li value="5"><input type="submit" name="note" value="5"></li>
                                    <li value="6"><input type="submit" name="note" value="6"></li>
                                    <li value="7"><input type="submit" name="note" value="7"></li>
                                    <li value="8"><input type="submit" name="note" value="8"></li>
                                    <li value="9"><input type="submit" name="note" value="9"></li>
                                </ul>
                            </form>

                            <!-- Split dropend button -->
                        </div>
                         <% for(User u   : ll){%>
                        <div class="ms-3" style="margin-top: 130px;">

                            <h5><%=u.getName()%></h5>
                            <p><%=u.getMail()%></p>
                        </div>
                        <%}%>
                    </div>
                    <div class="p-4 text-black" style="background-color: #f8f9fa;">
                        <div class="d-flex justify-content-end text-center py-1">
                            <div>
                                <p class="mb-1 h5"><%= ll1.size()%></p>
                                <p class="small text-muted mb-0">Product listed</p>
                            </div>
                            <% int note = 0;%>
                            <% for (User u:noteList){
                                note += u.getNote();
                                System.out.println(u.getNote());
                            }
                            System.out.println(note);
                            System.out.println(noteList.size());
                            double noteMean = (noteList.size() ==0)? 0 : note/ noteList.size();
                            %>

                            <div class="px-3">
                                <p class="mb-1 h5"><%= noteMean%></p>
                                <p class="small text-muted mb-0">Note</p>
                            </div>

                        </div>
                    </div>
                    <div class="card-body p-4 text-black">
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <p class="lead fw-normal mb-0">Recent photos</p>
                            <p class="mb-0"><a href="#!" class="text-muted">Show all</a></p>
                        </div>
                        <% for (Product p   : ll1){%>
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
                                        <p><span class="text-muted" name="unom">Buyer:<%=p.getUname()%> </span> <span class="text-muted" name="quanti">Quantity: <%=p.getQuantity()%></span> </p>
                                    </div>
                                    <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                                        <h5 class="mb-0" name="pri">$<%=p.getPrice()%></h5>
                                    </div>

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
</html>
