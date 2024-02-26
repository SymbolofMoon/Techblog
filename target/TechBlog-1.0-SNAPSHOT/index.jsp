<%-- 
    Document   : index
    Created on : 15-Feb-2024, 10:47:14 pm
    Author     : prateekgupta
--%>

<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
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
        </style>
    </head>
    <body>
      
          <%@include file="navbar.jsp" %>
          
      <div class="container-fluid p-0 m-0 primary-background text-white banner-background">
              <div class="jumbotron ">
                  <div class="container">
                      <h3 class="display-3">Welcome to Techblog</h3>
                      <p>A technology company (or tech company) is a company that focuses primarily on the manufacturing, support, research and development of — most commonly computing, telecommunication and consumer electronics-based — technology-intensive products and services, which include businesses relating to digital electronics, software, optics, new energy and internet-related services such as cloud storage and e-commerce services.
                      </p>
                      
                      <button class="btn btn-outline-light btn-lg"><span class="fa fa-user-plus"></span>Let's Shop</button>
                      <a href="login.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-user-circle fa-spin"></span>Login</a>
                  </div>    
                  <br>
                  <br><!-- comment -->
                  <br><!-- comment -->
              </div>
          </div>
        
          <!-- Cards -->
          
          <div class="container">
              <div class="row mb-2">
                  <div class="col-md-4">
                      <div class="card">
                        
                        <div class="card-body">
                          <h5 class="card-title">Apple</h5>
                          <p class="card-text">Apple Inc. is an American multinational technology company headquartered in Cupertino, California, in Silicon Valley. It designs, develops, and sells consumer electronics, computer software, and online services.</p>
                          <a href="#" class="btn primary-background text-white">Go somewhere</a>
                        </div>
                      </div>
                  </div>
                  
                  <div class="col-md-4">
                      <div class="card">
                        
                        <div class="card-body">
                          <h5 class="card-title">Apple</h5>
                          <p class="card-text">Apple Inc. is an American multinational technology company headquartered in Cupertino, California, in Silicon Valley. It designs, develops, and sells consumer electronics, computer software, and online services.</p>
                          <a href="#" class="btn primary-background text-white">Go somewhere</a>
                        </div>
                      </div>
                  </div>
                  
                  <div class="col-md-4">
                      <div class="card">
                        
                        <div class="card-body">
                          <h5 class="card-title">Apple</h5>
                          <p class="card-text">Apple Inc. is an American multinational technology company headquartered in Cupertino, California, in Silicon Valley. It designs, develops, and sells consumer electronics, computer software, and online services.</p>
                          <a href="#" class="btn primary-background text-white">Go somewhere</a>
                        </div>
                      </div>
                  </div>
                  
              </div>
              
              <div class="row">
                  <div class="col-md-4">
                      <div class="card">
                        
                        <div class="card-body">
                          <h5 class="card-title">Apple</h5>
                          <p class="card-text">Apple Inc. is an American multinational technology company headquartered in Cupertino, California, in Silicon Valley. It designs, develops, and sells consumer electronics, computer software, and online services.</p>
                          <a href="#" class="btn primary-background text-white">Go somewhere</a>
                        </div>
                      </div>
                  </div>
                  
                  <div class="col-md-4">
                      <div class="card">
                        
                        <div class="card-body">
                          <h5 class="card-title">Apple</h5>
                          <p class="card-text">Apple Inc. is an American multinational technology company headquartered in Cupertino, California, in Silicon Valley. It designs, develops, and sells consumer electronics, computer software, and online services.</p>
                          <a href="#" class="btn primary-background text-white">Go somewhere</a>
                        </div>
                      </div>
                  </div>
                  
                  <div class="col-md-4">
                      <div class="card">
                        
                        <div class="card-body">
                          <h5 class="card-title">Apple</h5>
                          <p class="card-text">Apple Inc. is an American multinational technology company headquartered in Cupertino, California, in Silicon Valley. It designs, develops, and sells consumer electronics, computer software, and online services.</p>
                          <a href="#" class="btn primary-background text-white">Go somewhere</a>
                        </div>
                      </div>
                  </div>
                  
              </div>
          </div>
        
         <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
         <script src="js/myjs.js" type="text/javascript"></script>
    </body>
</html>
