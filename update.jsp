<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
<%@ page import="java.util.Base64" %>
<%@ page import="java.io.*"%>
<%@ page import="java.math.*"%>
<%@	page import="java.security.MessageDigest"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="regstyle2.css">
</head>
<style>
.f{
margin-left:20px;
}

.p
{

color:white;
font-size:15px;
text-align:center;
padding-top:15px;
font-weight:bold;

}
.s{

  height:50px;
 background: #49c1a2;

}
 .edit {
    text-decoration: none;
    padding: 2px 5px;
    background: #49c1a2;
    color: white;
    border-radius: 3px;
    font-size: 20px;
    .f{
    margin-left:20px;
    
    }
</style>
<link rel="stylesheet" href="hea.css">
<body>
<header class="header" id="header">
        <div class="navbar">
        
            <div class="logo">
               <h3>Medical management system</h3>
             </div>
            <nav class="nav-menu" id="nav-menu">
                <ul class="nav-list">
                    <li><a href="index.jsp" class="nav-link">Home</a></li>
                    <li><a href="logout.jsp" class="nav-link">Logout</a></li>
                    <li><a class="nav-link"> <%= session.getAttribute("user_name") %></a></li>
     
                </ul>
               
            </nav>
            <div class="nav-toggle" id="nav-toggle">
                <i class="fas fa-bars"></i>
            </div>
        </div>
    </header>
    <br><br><br><br>
<div class="s">
<p class="p">Medicine Info<p>
</div>
<br>

<% 
response.setHeader("Cache-Control","no-cache,no-store, must-revalidate");    
response.setDateHeader("Expires", 0);
response.setHeader("Pragma","no-cache");
if(session.getAttribute("user_id")== null)
{
response.sendRedirect("login.jsp");	
}
%>

<%
String session_name = (String)session.getAttribute("user_email");
String sessionid = (String)session.getAttribute("user_id");
/* out.print("Hi "+session_name);
out.print("Hi "+sessionid); */
%>


<%
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","");


try{
	if(request.getParameter("update")!= null)
	{
	
		
		Statement st =con.createStatement();
		String code = request.getParameter("code");
		String name = request.getParameter("name");
		String cost = request.getParameter("cost");
		String mdate = request.getParameter("mdate");
		String edate = request.getParameter("edate");
		String qty = request.getParameter("qty");
		
		String id = request.getParameter("update");
		
		    PreparedStatement ps = con.prepareStatement("update medicine set code=?,name=?,cost=?, mdate=?,edate=?,qty=? where id = ?;");
		    ps.setString(1,code);
		    ps.setString(2,name);
		    ps.setString(3,cost);
		    ps.setString(4,mdate);
		    ps.setString(5,edate);
		    ps.setString(6,qty);
		    ps.setString(7,id);
		 
		    int x = ps.executeUpdate();
	  
		   /*  response.sendRedirect("index.jsp"); */
		
		
	}
}
catch(Exception e)
{
	out.println(e);
}

%>



</body>
</html>