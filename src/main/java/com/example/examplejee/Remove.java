package com.example.examplejee;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.List;

@WebServlet(name = "Remove", value = "/Remove")
public class Remove extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        RequestDispatcher disp = null;
        List<Product> L = (List<Product>) session.getAttribute("products");
        int idx = Integer.parseInt(request.getParameter("id"));
        L.remove(idx);
        disp = request.getRequestDispatcher("Basket.jsp");
        disp.forward(request, response);

    }
}
