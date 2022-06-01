package com.example.examplejee;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet(name = "Delete", value = "/Delete")
public class Delete extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");

        RequestDispatcher disp = null;
        Connection conn = null;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/PROJET_JEE", "root", "");

            PreparedStatement ps = conn.prepareStatement("DELETE FROM Products WHERE id = ?");

            ps.setString(1, id);

            int count = ps.executeUpdate();
            System.out.println(id);
            disp = request.getRequestDispatcher("Profile.jsp");
            if (count> 1){

                System.out.println("sssss");
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
