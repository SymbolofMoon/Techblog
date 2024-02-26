<%-- 
    Document   : show_blog_page
    Created on : 23-Feb-2024, 5:33:41 pm
    Author     : prateekgupta
--%>

<%@page import="java.text.DateFormat"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="java.lang.Integer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage="error.jsp" %>
<%

User user = (User)session.getAttribute("currentuser");

if(user==null){
        response.sendRedirect("login.jsp");
    }

%>

<%
    int postId = Integer.parseInt(request.getParameter("post_id"));
    PostDao d = new PostDao(ConnectionProvider.getConnection());
    Post post = d.getbyPostByPid(postId);

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<!--        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">-->
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                clip-path: polygon(50% 0%, 100% 0, 100% 42%, 100% 78%, 62% 71%, 27% 100%, 0 73%, 0 46%, 0 0);
            }
            
            .row-post{
                border: aqua solid;
                border-width: 15px;
                
                padding-top: 15px; 
            }
            body{
                background-image:  url(img/raNDOM.jpeg);
                background-size: cover;
                background-attachment: fixed;
            }
            
        </style>
    </head>
    <body>
        <main>
            <div class="container">
                <div class="row my-2">
                    
                    <div class="col-md-6 offset-md-2">
                        <div class="card">
                            <div class="card-header primary-background">
                                <h3><%= post.getpTitle() %></h3>
                            </div>
                            
                            <div class="card-body">
                                
                                 <img src="img/image.jpeg" class="img-fluid">  
                                 
                                 <div class="row my-2 row-post">
                                     <div class="col-md-8">
                                         By  <b><a href="#"> <%= user.getName() %>  </a></b>
                                     </div>
                                     <div class="col-md-4">
                                         <p> <%= DateFormat.getDateTimeInstance().format(post.getpDate()) %> </p>
                                     </div>
                                 </div>
                                <p><%= post.getpContent() %></p>
                                
                                <br><!-- comment -->
                                <br><!-- comment -->
                                <pre><%= post.getpCode() %></pre>
                            </div>
                            
                            <div class="card-footer primary-background">
                                <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span>10</span></a>
                                <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i><span>20</span></a>
                            </div> 

                        </div>
                        
                    </div>
                </div>
            </div>
        </main>
    </body>
</html>
