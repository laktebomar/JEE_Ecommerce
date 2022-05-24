package com.example.examplejee;
import java.sql.*;
public class UserList{

    public static void main(){
        UserList dd = new UserList();

        dd.getUser();
    }
    public void getUser(){
        UserDb conn = new UserDb();
        Connection connect = conn.get_connection();

        PreparedStatement pr = null;
        ResultSet rs = null;

        try{
            String query = "select * from users";
            pr = connect.prepareStatement(query);
            rs = pr.executeQuery();

            while (rs.next()){
                System.out.println(rs.getString("id"));
                System.out.println(rs.getString("username"));
                System.out.println(rs.getString("email"));
                System.out.println(rs.getString("password"));


            }


        }catch (Exception e){

        }
    }

}
