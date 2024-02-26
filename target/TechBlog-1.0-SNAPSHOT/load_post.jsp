<%-- 
    Document   : load_post
    Created on : 22-Feb-2024, 9:51:20 pm
    Author     : prateekgupta
--%>

<%@page import="java.lang.Integer"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>

<div class="row">
<%
PostDao dao = new PostDao(ConnectionProvider.getConnection());
List<Post> list = null;
int catId = Integer.parseInt(request.getParameter("catId"));

if(catId==0){
list = dao.getAllPost();
    }else{
    list = dao.getAllPostByCid(catId);
    }

for(Post post: list){
%>

<div class="col-md-6 mt-2">
    <div class="card">
        <div class="card-body">
            <b><%=post.getpTitle()%></b>
            <p><%=post.getpContent()%></p><!-- comment -->
            
        </div>
            <div class="card-footer primary-background text-center">
                <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span>10</span></a>
                <a href="show_blog_page.jsp?post_id=<%=post.getPid()%>" class="btn btn-outline-light btn-sm">Read More...</a>
                <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i><span>20</span></a>
            </div> 
    </div>
</div>
        <%
    }
%>
</div>


