<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link href="https://fonts.googleapis.com/css?family=Josefin+Sans&display=swap" rel="stylesheet">
	  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">
	  <%

response.setHeader("Cache-Control","no-cache,no-store, must-revalidate");    
response.setDateHeader("Expires", 0);
response.setHeader("Pragma","no-cache");
%>
</head>
<body>

<header>
	
<nav>
	<div class="logo"> <h1 style="font-size: 20px;"> Medical </h1> </div>
	<div class="menu">
		<a href="#" style="font-size: ">Home</a>
		<a href="registration.jsp">Registration</a>
		<a href="login.jsp">Login</a>
	</div>
</nav>

	<main>
		<section>
			<h3>Welcome To Medical Store</h3>
			<h1>DO COME & VISIT  <span style="margin-top: -10px;">  </span> </h1>
			
			<a href="medicine.jsp" class="btntwo">Add Medicine</a>
		</section>
	</main>


</header>

</body>
</html>