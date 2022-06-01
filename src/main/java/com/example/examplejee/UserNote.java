package com.example.examplejee;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedList;
import java.util.List;

@WebServlet(name = "UserNote", value = "/UserNote")
public class UserNote extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        String note = request.getParameter("note");
        String uname = (String) session.getAttribute("uname");
        RequestDispatcher disp = null;
        Connection conn = null;

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/PROJET_JEE", "root", "");

            PreparedStatement ps = conn.prepareStatement("insert into note_user (note, uname) values (?,?);");


            User u = (User) session.getAttribute("user");
            ps.setString(1, note);
            ps.setString(2, u.getName());


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
