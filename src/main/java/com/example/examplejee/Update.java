package com.example.examplejee;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet(name = "Update", value = "/Update")
public class Update extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String n = request.getParameter("pname");
            String q = request.getParameter("quantiy");
            String p = request.getParameter("price");
        RequestDispatcher disp = null;
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/PROJET_JEE", "root", "");
            PreparedStatement ps = conn.prepareStatement("UPDATE Products SET name = ?, quantiy =?, price = ? where id = ?");
            ps.setString(1, n);
            ps.setString(2, q);
            ps.setString(3, p);
            ps.setString(4,request.getParameter("id"));
            ResultSet rs = ps.executeQuery();

            if (rs.next()){
                disp = request.getRequestDispatcher("Home.jsp");
                disp.forward(request, response);
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
