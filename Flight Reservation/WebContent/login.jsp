<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel = "stylesheet"  href = "css/log.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<title>Login</title>

<script type="text/javascript">
	function checkMobile()
	{
	
		var x=document.getElementById("pn").value;
		var phoneno = /^[0-9]{10}$/;
		
		if( ! phoneno.test(x))
		{
			alert("Insert valid Mobile Number");
			return false;
		}	
	}
	
	
</script>
</head>
<body>

<body>

	<div class="row no-gutters">
  		<div class="col-md-8 no-gutters" >
   			<div class="leftside">
   				<h1>airoli</h1>
   				<h2> Book your ticket like a boss</h2>
   			</div>
 		</div>
  	
  		<div class="col-md-4 no-gutters" >
   			<div class="rightside">
   				<h1>airoli Login</h1>
   				<div class="cntnt">
   					<div class="form1">
   					<form onsubmit="return checkMobile()">
						
						<label>Phone no</label><input type="text" name="pn" id="pn" class="form-control" placeholder="Enter 10 digit phone number" ><br>
						<label>Password</label><input type="password" name="pwd" id="pwd" class="form-control" placeholder="Password"><br>
						<button type="submit" class="btn btn-primary btn-lg btn-block"value="Submit">Log in</button>
						<a>Forget Password?</a>
						
						</form>						   					
   					</div>
   				</div>
   			
   			</div>
 	 	</div>
	</div>


</body>


</body>
</html>

<%
String n1=request.getParameter("pn");
String n2=request.getParameter("pwd");


if(n1 != null  ){
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","scott","tiger");
	PreparedStatement pr=con.prepareStatement("Select * from register where phone_no=? and password=? ");
	pr.setString(1, n1);
	pr.setString(2, n2);

	ResultSet rs=pr.executeQuery();
	if(rs.next()){
		
		session.setAttribute("Mob",n1);
		response.sendRedirect("home.jsp");
	
	}
	
	else{
		
		out.print("<script>alert('Wrong Phone no. or password')</script>");
	con.close();
	}
	
}
catch(Exception e)
{
	out.print(e);
}
}
%>