<%-- 
    Document   : login
    Created on : 17-Feb-2024, 10:20:43 am
    Author     : prateekgupta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
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
                    <div class="col-md-6 offset-md-3">
                        <div class="card-header primary-background text-white">
                            <span class="fa fa-user-circle fa-3x"></span>
                            <p>Register Here</p>
                        </div>
                        <div class="card-body">
                            <form id = "reg-form" action="RegisterServlet" method="POST">
                                
                                <div class="mb-3">
                                  <label for="exampleUsername" class="form-label">Username</label>
                                  <input name="user_name" type="text" class="form-control" id="examplUserName" aria-describedby="emailHelp">
                                 
                                </div>
                                <div class="mb-3">
                                  <label for="exampleInputEmail1" class="form-label">Email address</label>
                                  <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                  
                                </div>
                                <div class="mb-3">
                                  <label for="exampleInputPassword1" class="form-label">Password</label>
                                  <input name="password" type="password" class="form-control" id="exampleInputPassword1">
                                </div>
                                <div class="mb-3 form-check">
                                  <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                  <label class="form-check-label" for="exampleCheck1">Agree Terms and Conditions</label>
                                </div>
                                
                                <div class="container text-center "  id ="loader" style="display: none;" >
                                    <span class="fa fa-refresh fa-spin fa-4x"></span>
                                    <h4>Please wait...</h4>
                                </div>
                                <button id = "submit-btn" type="submit" class="btn btn-primary">Submit</button>
                             </form>  
                        </div>
                    </div>
                </div>
            </div>
        </main>
        
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

        <script>
            $(document).ready(function (){
                console.log("loaded...");
                
                $('#reg-form').on('submit', function(event){
                    event.preventDefault();
                    
                    
                    let form = new FormData(this);
                    
                    $("#submit-btn").hide();
                    $("#loader").show();
                    
                    
                    $.ajax({
                        url:"RegisterServlet",
                        type:'POST',
                        data:form,
                        success: function(data, textStatus, jqXHR){
                            console.log(data);
                            $("#submit-btn").show();
                            $("#loader").hide();
                            
                            if(data.trim()=='done'){
                                swal("Registered Successfully... Redirecting to Login Page..").
                                        then((value)=>{
                                            window.location= "login.jsp";
                                });
                            }else{
                                swal(data);
                            }
                        },
                        error: function(jqXHR, errorThrown, textStatus){
                            console.log(jqXHR);
                            $("#submit-btn").show();
                            $("#loader").hide();
                            
                            swal("Something went wrong...");
                        },
                        
                        processData: false,
                        contnetType: false
                    })
                })
                
                
            })
            
            
        </script>
    </body>
</html>
