/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.helper;
import java.sql.*;

/**
 *
 * @author prateekgupta
 */
public class ConnectionProvider {
    private static Connection con;
    public static Connection getConnection(){
        try{
            if(con==null){
                Class.forName("com.mysql.cj.jdbc.Driver");
                
                con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/techblog?autoReconnect=true&useSSL=false", "root", "allen3792");
                System.out.println(con);
                
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return con;
    }
    
}
