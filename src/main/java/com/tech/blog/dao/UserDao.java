/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.dao;
//import com.mysql.cj.protocol.Resultset;
//import com.mysql.cj.protocol.ResultsetRows;
import com.tech.blog.entities.User;
import java.sql.*;
import java.sql.ResultSet;

/**
 *
 * @author prateekgupta
 */
public class UserDao {
    
    private Connection con;
    
    public UserDao(Connection con){
        this.con = con;
    }
    
    public boolean saveUser(User user){
        boolean f = false;
        
        try {
            
            String query = "insert into user(user_name,email, password) values(?,?,?)";
            
            
            PreparedStatement pstmt = this.con.prepareStatement(query);
            
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            
            pstmt.executeUpdate();
            
            System.out.println(user.getName());
                    
            f = true;
            
        }catch (Exception e){
            e.printStackTrace();
        }
        
        return f;
    }
    
    
    public User getUserByEmailAndPassword(String email, String password){
        User user =null;
        
        
        try{
            String query = "Select * from user where email=? and password=?";
            
            PreparedStatement pstmt = con.prepareStatement(query);
            
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            
            ResultSet set = pstmt.executeQuery();
            
            if(set.next()){
                user = new User();
                

//                System.out.println(set);

                String name = set.getString("user_name");
                
           
                
                
                user.setName(name);
                user.setId(set.getInt("id"));
                user.setEmail(email);
                user.setPassword(password);
                
                
            } 
            
            
        }catch (Exception e){
            e.printStackTrace();
        }
        
        
        return user;
    }
    
    public boolean updateUser(User user){
        boolean f = false;
        
        try{
            
            String query = "UPDATE user SET user_name=?, email=?, password=? WHERE id=?";
            
            System.out.println(query);
            
            PreparedStatement pstmt = con.prepareStatement(query);
            
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setInt(4, user.getId());
            
            
            pstmt.executeUpdate();
            f = true;
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return f;
    }
    
}
