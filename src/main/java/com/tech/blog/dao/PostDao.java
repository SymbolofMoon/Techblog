/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.dao;

import com.mysql.cj.protocol.Resultset;
import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
import java.sql.*;
//import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author prateekgupta
 */
public class PostDao {
    private Connection con;
    
    public PostDao(Connection con){
        this.con = con;
    }
    
    public ArrayList<Category> getAllCategories(){
        
        ArrayList<Category> list = new ArrayList<>();
        
        try{
            
            String q = "Select * from Categories";
            
            Statement st = this.con.createStatement();
            ResultSet set  = st.executeQuery(q);  
            
            while(set.next()){
                
                int cid = set.getInt("cid");
                String cname = set.getString("cname");
                String cdescription = set.getString("cdescription");
                Category cat = new Category(cid,cname, cdescription);
                list.add(cat);
            }
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        return list;
        
    }
    
    public boolean savePost(Post post){
        boolean f = false;
        
        try {
            
            String query = "insert into posts(pTitle, pContent, pCode, pPic, catId, uid) values(?,?,?,?,?,?)";
            
            
            PreparedStatement pstmt = this.con.prepareStatement(query);
            
            pstmt.setString(1, post.getpTitle());
            pstmt.setString(2, post.getpContent());
            pstmt.setString(3, post.getpCode());
            pstmt.setString(4, post.getpPic());
            pstmt.setInt(5, post.getCatId());
            pstmt.setInt(6, post.getUid());
            
            pstmt.executeUpdate();
            
                    
            f = true;
            
        }catch (Exception e){
            e.printStackTrace();
        }
        
        return f;
    }
    
    
    public List<Post> getAllPost(){
        List<Post>list = new ArrayList<>();
        try {
            String query = "SELECT * FROM posts";
            
            
            PreparedStatement pstmt = this.con.prepareStatement(query);
            
            ResultSet set = pstmt.executeQuery();
            
            while(set.next()){
                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                int catId = set.getInt("catId");
                int uId = set.getInt("uid");
                Timestamp time = set.getTimestamp("pDate");
                String pPic = set.getString("pPic");
                
                Post post = new Post(pid, pTitle, pContent, pCode, pPic, time, catId, uId);
                
                list.add(post);
                
                
                
            }
            
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        
        
        return list;
        
        
    }
    
    
    public List<Post> getAllPostByCid(int catId){
        List<Post>list = new ArrayList<>();
        try {
            String query = "SELECT * FROM posts WHERE catId=?";
            
            
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setInt(1,catId);
            ResultSet set = pstmt.executeQuery();
            
            while(set.next()){
                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                int uId = set.getInt("uid");
                Timestamp time = set.getTimestamp("pDate");
                String pPic = set.getString("pPic");
                
                Post post = new Post(pid, pTitle, pContent, pCode, pPic, time, catId, uId);
                
                list.add(post);
                
                
                
            }
            
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        
        
        return list;
        
        
    }
    
    
    public Post getbyPostByPid(int postId){
        Post post = null;
        
        String q = "SELECT * FROM posts WHERE pid=?";
        
        
        try{
            
            
            PreparedStatement p = this.con.prepareStatement(q);
            
            p.setInt(1,postId);
            
            ResultSet set  = p.executeQuery();
            
            if(set.next()){
                
                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                int catId = set.getInt("catId");
                int uId = set.getInt("uid");
                Timestamp time = set.getTimestamp("pDate");
                String pPic = set.getString("pPic");
                
                post = new Post(pid, pTitle, pContent, pCode, pPic, time, catId, uId);
                
            }
            
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        
        return post;
    }
}
