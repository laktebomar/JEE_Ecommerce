package com.example.examplejee;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet(name = "Login", value = "/Login")
public class Login extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse res) throws ServletException, IOException {
        String mail = request.getParameter("mail");
        String pass = request.getParameter("pass");
        RequestDispatcher disp = null;
        Connection conn = null;
        HttpSession session = request.getSession();
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/PROJET_JEE", "root", "");

            PreparedStatement ps = conn.prepareStatement("select * from users where email = ? and password = ?");

            ps.setString(1, mail);
            ps.setString(2, pass);

            ResultSet rs = ps.executeQuery();



            if (rs.next()){
                session.setAttribute("name", rs.getString("username"));
                session.setAttribute("mail", rs.getString("email"));
                disp = request.getRequestDispatcher("Home.jsp");
                disp.forward(request, res);
            }else{
                request.setAttribute("status", "failed");
                disp = request.getRequestDispatcher("login.jsp");
                disp.forward(request, res);
            }


            conn.close();
        } catch (Exception e){
            e.printStackTrace();
            System.out.println(e);
        }
    }
}
