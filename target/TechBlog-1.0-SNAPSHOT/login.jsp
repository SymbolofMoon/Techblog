<%-- 
    Document   : login
    Created on : 17-Feb-2024, 10:20:43 am
    Author     : prateekgupta
--%>

<%@page import="com.tech.blog.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
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
        <main class="d-flex align-items-center primary-background banner-background" style="height: 70vh">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 offset-md-4">
                        <div class="card-header primary-background text-white">
                            <span class="fa fa-user-plus fa-3x"></span>
                            <p>Login Here</p>
                        </div>
                        <%
                            Message m = (Message)session.getAttribute("msg");
                            if(m!=null){
                            
                            
                        %>
                        <div class="alert <%= m.getCssClass() %>" role="alert">
                            <%= m.getContent() %>
                        </div>
                        <% 
                            session.removeAttribute("msg");
                            }
                        %>
                        <div class="card-body">
                            <form action="LoginServlet" method="POST">
                                <div class="mb-3">
                                  <label for="exampleInputEmail1" class="form-label">Email address</label>
                                  <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                  <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                                </div>
                                <div class="mb-3">
                                  <label for="exampleInputPassword1" class="form-label">Password</label>
                                  <input name="password" type="password" class="form-control" id="exampleInputPassword1">
                                </div>
                                
                                <button type="submit" class="btn btn-primary">Submit</button>
                             </form>  
                        </div>
                    </div>
                </div>
            </div>
        </main>
        
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
    </body>
</html>
