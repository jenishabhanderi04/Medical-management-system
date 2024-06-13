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
 background: black;

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
               <h3>Music management system</h3>
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
	 String update = request.getParameter("update");
		
		//display the data


		Statement s = (Statement)con.createStatement();
		ResultSet rs = s.executeQuery("select * from medicine where id ="+update+"");
		
		while(rs.next())
		{
			%>
			<div id="container">
        <!-- Form Wrap Start -->
        <div class="form-wrap">
            <h1>Medicine Info</h1>
            
            <!-- Form Start -->
            <form method="post" onsubmit ="return verify()">
                <div class="form-group">
                    <label for="code">Medicine code</label>
                    <input type="text" name="code" id="code" value="<%= rs.getString("code") %>" >
                   <span id = "code-message" style="color:red"> </span>
                </div>
                <div class="form-group">
                    <label for="name">Medicine Name</label>
                    <input type="text" name="name" id="name" value="<%= rs.getString("name") %>">
                    <span id = "name-message" style="color:red"> </span>
                </div>
                <div class="form-group">
                    <label for="cost">Medicine cost</label>
                    <input type="text" name="cost" id="cost" value="<%= rs.getString("cost") %>">
                    <span id = "cost-message" style="color:red"> </span>
                </div>
                <div class="form-group">
                    <label for="mdate">Mfg Date</label>
                    <input type="date" name="mdate" id="mdate" value="<%= rs.getString("mdate") %>" >
                     <span id = "mdate-message" style="color:red"> </span>
                </div>
                
                <div class="form-group">
                    <label for="edate">Expiry Date</label>
                    <input type="date" name="edate" id="edate" value="<%= rs.getString("edate") %>">
                     <span id = "edate-message" style="color:red"> </span>
                </div>
                <div class="form-group">
                    <label for="qty">Quantity</label>
                     <input type="text" name="qty" id="qty" value="<%= rs.getString("qty") %>">
                     <span id = "qty-message" style="color:red"> </span>

                </div>
               
                <button type="submit" name="submit" id="submit">Update Info</button>
               
            </form>
            <% 
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
	  
		   response.sendRedirect("index.jsp"); 
		
		
	}
            %>
            
            <!-- Form Close -->
        </div>
        <!-- Form Wrap Close -->
        <footer>
           
        </footer>
    </div>
    <!-- Container Close -->

			
			<% 
		}
		
		
	}
}
catch(Exception e)
{
	//out.println(e);
}

%>

</body>
</html>