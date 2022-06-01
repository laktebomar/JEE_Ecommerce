package com.example.examplejee;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;


@WebServlet(name = "Register1", value = "/Register1")
public class Register1 extends HttpServlet {



    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
        String name = req.getParameter("uname");
        String mail = req.getParameter("mail");
        String pass = req.getParameter("pass");

        RequestDispatcher disp = null;
        Connection conn = null;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/PROJET_JEE", "root", "");

            PreparedStatement ps = conn.prepareStatement("insert into users (username, email, password) values (?, ?, ?)");

            ps.setString(1, name);
            ps.setString(2, mail);
            ps.setString(3, pass);
            disp = req.getRequestDispatcher("login.jsp");

            int count = ps.executeUpdate();
            if (count> 1){
                req.setAttribute("status", "succ");
            }else{
                req.setAttribute("status", "fail");
            }


            disp.forward(req, res);
            conn.close();
        } catch (Exception e){
            e.printStackTrace();
            System.out.println(e);
        }


        }
    }


