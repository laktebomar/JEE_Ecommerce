package com.example.examplejee;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.http.*;


@WebServlet(name = "AddProduct", value = "/AddProduct")
public class AddProduct extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String name = request.getParameter("name");
        String desc = request.getParameter("desc");
        String price = request.getParameter("price");
        String quantity = request.getParameter("quantity");
        String uname = (String) session.getAttribute("uname");
        session.setAttribute("pname", name);
        RequestDispatcher disp = null;
        Connection conn = null;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/PROJET_JEE", "root", "");

            PreparedStatement ps = conn.prepareStatement("insert into Products (name, description, price, quantity, uname) values (?,?,?,?, ?);");

            ps.setString(1, name);
            ps.setString(2, desc);
            ps.setString(3, price);
            ps.setString(4, quantity);
            ps.setString(5, uname);


            disp = request.getRequestDispatcher("Home.jsp");
            int count = ps.executeUpdate();
            if (count> 1){
                request.setAttribute("status", "succ");
            }else{
                request.setAttribute("status", "fail");
            }


            disp.forward(request, response);
            conn.close();

        }
        catch (Exception e){
            e.printStackTrace();
        }
    }
}


