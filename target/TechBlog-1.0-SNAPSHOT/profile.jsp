<%-- 
    Document   : profile
    Created on : 17-Feb-2024, 8:54:35 pm
    Author     : prateekgupta
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage="error.jsp" %>
<%

User user = (User)session.getAttribute("currentuser");

if(user==null){
        response.sendRedirect("login.jsp");
    }

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile Page</title>
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
        <nav class="navbar navbar-expand-lg navbar-dark primary-background">
          <div class="container-fluid">
            <a class="navbar-brand" href="index.jsp"><span class="fa fa-asterisk"></span>Techblog</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
              <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                  <a class="nav-link active" aria-current="page" href="#"><span class="fa fa-bell-o"></span>Home</a>
                </li>

                <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                      <span class="fa fa-check-square-o"></span>
                    Products
                  </a>
                  <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="#">Phone</a></li>
                    <li><a class="dropdown-item" href="#">Watches</a></li>
                    <li><a class="dropdown-item" href="#">Computer</a></li>
                  </ul>
                </li>

                <li class="nav-item">
                  <a class="nav-link" href="#"><span class="fa fa-address-card-o"></span>Contact</a>
                </li>                 
                
                <li class="nav-item">
                    <a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#add-post-modal"><span class="fa fa-asterisk" ></span>Add a POST</a>
                </li>  

              </ul>
              
                
                <ul class="navbar-nav mr-right">
                     <li class="nav-item">
                  <a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#profile-modal"><span class="fa fa-user-circle"></span><%= user.getName() %></a>
                </li>

                 <li class="nav-item">
                  <a class="nav-link" href="LogoutServlet"><span class="fa fa-user-plus"></span>LogOut</a>
                </li>
                </ul>
            </div>
          </div>
        </nav>
                    
                
                <!--Modal -->
                
                <!-- Profile Edit Button trigger modal -->
                   
                    <!-- Modal -->
                    <div class="modal fade" id="profile-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header primary-background text-white text-center">
                        <h5 class="modal-title fs-5" id="exampleModalLabel">TechBlog</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                          </div>
                          <div class="modal-body">
                              <div class="container text-center">
                                  <img src="img/default.png" class="img-fluid" style="border-radius:50%; max-width: 150px;">
                                  <br><!-- comment -->
                                  <h5 class="modal-title mt-3" id="exampleModalLabel"><%= user.getName()%></h5>
                                  
                                  <div id="profile-details">
                                  <table class="table">
                                      <tbody>
                                          <tr>
                                              <th scope="row">ID: </th><!-- comment -->
                                              <td><%=user.getId()%></td>
                                          </tr>
                                          
                                          <tr>
                                              <th scope="row">Email: </th><!-- comment -->
                                              <td><%=user.getEmail()%></td>
                                          </tr>
                                      </tbody>
                                      
                                  </table>
                                  </div>
                                          
                                          <div id="profile-edit" style="display:none;">
                                              <h3 class="mt-2">Please Edit Carefully!!!</h3>
                                              <form action="EditServlet" method="POST" enctype="multipart/form-data">
                                                  <table class="table">
                                                      <tr>
                                                          <td>ID:</td>
                                                          <td><%=user.getId()%></td>
                                                      </tr>
                                                      <tr>
                                                          <td>Name: </td>
                                                          <td><input type="text" class="form-control" name="user_name" value="<%=user.getName()%>"></td>
                                                      </tr>
                                                      <tr>
                                                          <td>Email: </td>
                                                          <td><input type="text" class="form-control" name="email" value="<%=user.getEmail()%>"></td>
                                                      </tr>
                                                      <tr>
                                                          <td>Password: </td>
                                                          <td><input type="text" class="form-control" name="password" value="<%=user.getPassword()%>"></td>
                                                      </tr>
                                                  </table>
                                                      
                                                      <button type="submit" class="btn btn-primary">Submit</button>
                                              </form>
                                          </div>
                              </div>
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="button" id="edit-profile-button" class="btn btn-primary">Edit</button>
                          </div>
                        </div>
                      </div>
                    </div>
              
                                                      
                                                      
                                                      <!<!-- Add A POST trigger Modal -->
                                                      
                                                <!-- Button trigger modal -->
                             

                             <!-- Modal -->
                             <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                               <div class="modal-dialog" role="document">
                                 <div class="modal-content">
                                   <div class="modal-header">
                                     <h5 class="modal-title" id="exampleModalLabel">Create a POST</h5>
                                     <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                       <span aria-hidden="true">&times;</span>
                                     </button>
                                   </div>
                                   <div class="modal-body">
                                       <form id="post-form" action="AddPostServlet" method="POST" enctype='multipart/form-data'>
                                           <select name="cId" class="form-control">
                                               <option selected disabled>---Select Category---</option>
                                               <%
                                               PostDao dao = new PostDao(ConnectionProvider.getConnection());
                                               ArrayList<Category> list = dao.getAllCategories();
                                               for(Category c:list)
                                               {
                                               %>
                                               <option value="<%=c.getCid()%>"><%=c.getCname()%></option>
                                               <%
                                                   }
                                               %>
                                           </select>
                                           <br>
                                           <div class="form-group">
                                               <input name="pTitle" type="text" placeholder="POST Title" class="form-control" />
                                           </div>
                                           <br>
                                            <div class="form-group">
                                                <textarea  name="pContent" style="height: 200px;" placeholder="POST Content" class="form-control" ></textarea>
                                           </div>
                                           <br>
                                           <div class="form-group">
                                                <textarea  name="pCode" style="height: 200px;" placeholder="Program Content(if any)" class="form-control" ></textarea>
                                           </div>
                                           <br>
                                           <div class="form-group">
                                               <label>Select your File</label>
                                               <br><!-- comment -->
                                               <input name="pPic" type="file">
                                           </div>
                                           <br>
                                           <div class="container text-center">
                                            <button name="submit" type="submit" class="btn btn-primary">Submit</button>
                                           </div>
                                       </form> 
                                   </div>
                                   <div class="modal-footer">
                                     <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                     
                                   </div>
                                 </div>
                               </div>
                             </div>  
                                           
                                           
                                           
                                           
                                           
                                           
                    <main>
                        <div class="container">
                            <div class="row mt-4">
                                <div class="col-md-4">
                                    <div class="list-group">
                                    <a onclick="getPost(0, this)" href="#" class=" c-link list-group-item list-group-item-action active" aria-current="true">
                                      Post
                                    </a>
                                        <% 
                                            PostDao postdao = new PostDao(ConnectionProvider.getConnection());
                                               ArrayList<Category> listc = dao.getAllCategories();
                                               for(Category cc:listc){
                                        %>
                                        <a  onclick="getPost(<%=cc.getCid() %>, this)" href="#" class="c-link list-group-item list-group-item-action"><%=cc.getCname()%></a>
                                    <%
                                        }
                                    %>
                                    </div>
                                </div>
                                
                                <div class="col-md-8">
                                    
                                    <div class="container text-center " id="loader5">
                                        <i class="fa fa-refresh fa-4x fa-spin"></i>
                                        <h3 class="mt-2">Loading...</h3>
                                    </div>
                                    
                                    <div class="container-fluid" id="post-container">
                                        
                                    </div>
                                    
                                </div>
                            </div>
                        </div>                           
                    </main>
                                                      
                                                      <!<!-- Message -->
                                                      
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
                        
                         
                        
<!--        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <script src="js/myjs.js" type="text/javascript"></script>-->
<!--        <script language="JavaScript" type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>-->
<!--<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>-->

<!--         <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>-->
<!--<script language="JavaScript" type="text/javascript" src="/js/jquery-ui-personalized-1.5.2.packed.js"></script>
<script language="JavaScript" type="text/javascript" src="/js/sprinkle.js"></script>-->
<!--  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-ajaxy/1.6.1/scripts/jquery.ajaxy.min.js" integrity="sha512-bztGAvCE/3+a1Oh0gUro7BHukf6v7zpzrAb3ReWAVrt+bVNNphcl2tDTKCBr5zk7iEDmQ2Bv401fX3jeVXGIcA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>-->
<!--<script
          src="https://code.jquery.com/jquery-3.4.1.min.js"
          integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
          crossorigin="anonymous"></script>        

<script>-->
<!--
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>-->
<!--       <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>     -->
<!--<script
      src="https://code.jquery.com/jquery-3.6.0.min.js"
      integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
      crossorigin="anonymous"
    ></script>-->

<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script>
            $(document).ready(function(){
                let editStatus = false;
                
                $("#edit-profile-button").click(function(){
                    console.log('Its is predssesd');
                    if(editStatus===false){
                        $("#profile-details").hide();
                        $("#profile-edit").show();
                        
                        editStatus = true;
                        $(this).text("Back");
                        
                    }else{
                        $("#profile-details").show();
                        $("#profile-edit").hide();
                        $(this).text("Exit");
                        
                        editStatus = false;
                    }
                });
            });
        </script>
        <script>
            $(document).ready(function(e){
                $("#post-form").click(function(event){
                    event.preventDefault();
                    
                    let form = new FormData(this);
                    $ajax({
                        url:"AddPostServlet",
                        type:"POST",
                        data: form,
                        success: function(data, textStatus, jqXHR){
                            console.log(data);
                        },
                        error: function(errorThrown, textStatus, jqXHR){
                            
                        },
                        processData:false,
                        contentType:false
                    })
                })
            })
        </script>
        <script>
            
            function getPost(catId, temp){
                
                $("#loader5").show();
                
                $(".c-link").removeClass('active');
                
                $.ajax({
                    url:"load_post.jsp",
                    data: {catId:catId},
                    success:function(data, textStatus, jqXHR){
                        console.log(data);
                        $("#loader5").hide();
                        
                        $("#post-container").html(data);
                        $(temp).addClass("active");
                    }
                })
            }
            $(document).ready(function(e){
                
                let allPostRef = $('.c-link')[0];
                
                getPost(0, allPostRef);
            })
        </script>
    </body>
</html>
