package com.example.examplejee;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.*;
import java.util.*;

@WebServlet(name = "Cart", value = "/Cart")
public class Cart extends HttpServlet {
    public List<Product> ll1 = new LinkedList();
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String idx = request.getParameter("id");
        int val = Integer.parseInt(request.getParameter("quantity"));
        int q1 = 0;
        Connection conn = null;
        RequestDispatcher disp = null;


        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/PROJET_JEE", "root", "");

            PreparedStatement ps = conn.prepareStatement("SELECT * FROM Products where id = ?");
            ps.setString(1, idx);


            disp = request.getRequestDispatcher("Home.jsp");
            ResultSet rs = ps.executeQuery();




            if (rs.next()){
                int s = Integer.parseInt(rs.getString("quantity"));

                q1 = s - val;
                System.out.println(idx);
                int prix = rs.getInt("price");
                int q = rs.getInt("quantity");
                String uname = rs.getString("uname");
                String des = rs.getString("description");
                String pname = rs.getString("name");
                int id = rs.getInt("id");
                Product p = new Product(id, pname, des, uname, prix, q);
                ll1.add(p);
                session.setAttribute("products", ll1);
                session.setAttribute("len", ll1.size());
            }
            PreparedStatement ps1 = conn.prepareStatement("UPDATE `Products` SET `quantity`= ? WHERE id=?");
            ps1.setString(1, String.valueOf(q1));
            ps1.setString(2, idx);

            int rs1 = ps1.executeUpdate();



            disp.forward(request, response);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
