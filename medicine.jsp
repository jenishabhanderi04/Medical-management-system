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
<title>Medicine form</title>
<link rel="stylesheet" href="regstyle2.css">
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
p{
color:red;
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
</head>
<link rel="stylesheet" href="hea.css">
<body>
<!-- heder start -->
 <header class="header" id="header">
        <div class="navbar">
        
            <div class="logo">
               <h3>Medical</h3>
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
    <br><br><br>
<!-- heder end -->

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

<div class="s">
<p class="p">Medicine Info<p>
</div>

 <%
 try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medical","root","");
		
		
		if(request.getParameter("submit") != null)
		{
			
			if(request.getParameter("code") != null || request.getParameter("name") != null || request.getParameter("cost") != null ||request.getParameter("mdate") != null || request.getParameter("edate") != null ||request.getParameter("gty") != null)
			{
				Statement st =con.createStatement();
//				String rid = request.getParameter("rid");
				String code = request.getParameter("code");
				String name = request.getParameter("name");
				String cost = request.getParameter("cost");
				String mdate = request.getParameter("mdate");
				String edate = request.getParameter("edate");
				String qty = request.getParameter("qty");
				
	  				
	  				
			    PreparedStatement ps = con.prepareStatement("insert into medicine(code, name, cost, mdate,edate,qty,userid) values(?,?,?,?,?,?,?);");
			    ps.setString(1,code);
			    ps.setString(2,name);
			    ps.setString(3,cost);
			    ps.setString(4,mdate);
			    ps.setString(5,edate);
			    ps.setString(6,qty);
			    ps.setString(7,sessionid);
			    int x = ps.executeUpdate();
			   response.sendRedirect("index.jsp");
			  
			}
			else
			{
				/*  out.print("enter the details");  */
				/* String er = "enter the details"; */
			}
			
		}
		else
		{
			//out.print("enter the details");
		}
		}
	catch(Exception e)
	{
	 out.println("error" +e);
	}
%> 


<div id="container">
        <!-- Form Wrap Start -->
        <div class="form-wrap">
            <h1>Medicine Info</h1>
            
            <!-- Form Start -->
            <form method="post" onsubmit ="return verify()">
                <div class="form-group">
                    <label for="code">Medicine code</label>
                    <input type="text" name="code" id="code">
                   <span id = "code-message" style="color:red"> </span>
                </div>
                <div class="form-group">
                    <label for="name">Medicine Name</label>
                    <input type="text" name="name" id="name">
                    <span id = "name-message" style="color:red"> </span>
                </div>
                <div class="form-group">
                    <label for="cost">Medicine cost</label>
                    <input type="text" name="cost" id="cost">
                    <span id = "cost-message" style="color:red"> </span>
                </div>
                <div class="form-group">
                    <label for="mdate">Mfg Date</label>
                    <input type="date" name="mdate" id="mdate" >
                     <span id = "mdate-message" style="color:red"> </span>
                </div>
                
                <div class="form-group">
                    <label for="edate">Expiry Date</label>
                    <input type="date" name="edate" id="edate">
                     <span id = "edate-message" style="color:red"> </span>
                </div>
                <div class="form-group">
                    <label for="qty">Quantity</label>
                     <input type="text" name="qty" id="qty">
                     <span id = "qty-message" style="color:red"> </span>

                </div>
               
                <button type="submit" name="submit" id="submit">Add</button>
               
            </form>
            
            <!-- Form Close -->
        </div>
        <!-- Form Wrap Close -->
        <footer>
           
        </footer>
    </div>
    <!-- Container Close -->


</body>
<script>  
function verify() {  
	
	 var decimal=  /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,15}$/;
  	var code = document.getElementById("code").value;  
  	var name = document.getElementById("name").value; 
  	var cost = document.getElementById("cost").value; 
  	var email = document.getElementById("email").value;
  	var mdate = document.getElementById("mdate").value;
  	var edate = document.getElementById("edate").value;
  	var qty = document.getElementById("qty").value;
  	
  	
  	if(code == "") {  
  	     document.getElementById("code-message").innerHTML = "**Fill the medicine code please!";  
  	     return false;  
  	  }  
  	
  	/* if(name == "") {  
  	     document.getElementById("name-message").innerHTML = "**Fill the name please!";  
  	     return false;  
  	  }  
  	if(cost == "") {  
 	     document.getElementById("cost-message").innerHTML = "**Fill the cost please!";  
 	     return false;  
 	  }  
  	 
  
  if(mdate == "") {  
	     document.getElementById("mdate-message").innerHTML = "**Fill the mfg-date please!";  
	     return false;  
	  } 
  
  if(edate == "") {  
	     document.getElementById("edate-message").innerHTML = "**Fill the expiry-date please!";  
	     return false;  
	  } 
  
  if(qty == "") {  
	     document.getElementById("qty-message").innerHTML = "**Fill the qty please!";  
	     return false;  
	  } 
 */
}   


</script>


</html>