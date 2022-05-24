package com.example.examplejee;
import java.sql.Connection;
import java.sql.DriverManager;


public class UserDb {
    public static void main(String args[]){
    UserDb dd = new UserDb();
    System.out.println(dd.get_connection());
    }

    public Connection get_connection(){
        Connection conn = null;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/PROJET_JEE", "root", "");


            if(conn  != null){
                System.out.println("connected succesfully");
            }
            conn.close();
        }
        catch (Exception e){
            System.out.println(e);
        }
        return conn;
    }
}





/**
 * AbstractDAO.java
 * This DAO class provides CRUD database operations for the table book
 * in the database.
 * @author www.codejava.net
 *
 */
