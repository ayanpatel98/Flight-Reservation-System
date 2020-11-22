
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*"%>
<%@ page import = "java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel = "stylesheet"   type = "text/css"  href = "css/sign.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">
<title>Airoli SignUp</title>
<script type="text/javascript">
	function check()
	{
	
		var x=document.getElementById("name").value;
		if(x=="")
			{
			alert("Insert Valid Name");
			return false;
			
			}
		
		var y=document.getElementById("pn").value;	
		var phoneno = /^[0-9]{10}$/;
		
		if( ! phoneno.test(y))
		{
			alert("Insert valid Mobile Number");
			return false;
		}	
		
		var z=document.getElementById("email").value;
		var mail=/^[a-zA-Z0-9]+[@][A-za-z]+[\.][a-zA-Z]+$/;
		
		if( ! mail.test(z))
		{
			alert("Insert Valid mail id");
			return false;
		}
	}
		
	
	
</script>

</head>

<body>

	<div class="row no-gutters">
  		<div class="col-md-5 no-gutters" >
   			<div class="leftside">
   			<h1>airoli Sign Up</h1>
   				<div class="cntnt">
   					<div class="form1">
   					
   					<form onsubmit="return check() ">
						
						<label>Name</label><input type="text" class="form-control" name="name" id="name">
						<label>Email</label><input type="text" class="form-control" name="email" id="email">
						<label>Mobile no.</label><input type="text" class="form-control" name="phone_no" id="pn">
						<label>Gender</label>
						<select name="gender" class="form-control" id="gen">
						<option>Male</option>
						<option>female</option>
						</select>
						<br>
						<label>Age</label><input type="text" class="form-control" name="age" id="age">
						<label>Password</label><input type="password" class="form-control" name="Password" id="pwd">
						<label>Confirm Password</label><input type="password" class="form-control" name="CPassword" id="pwd1"><br>
						<button type="submit" class="btn btn-primary btn-lg btn-block" class="form-control" value="Submit">Sign Up</button>
						
						
					</form>
   				</div>
   			
   				</div>
   			</div>
 		</div>
  	
  		<div class="col-md-7 no-gutters" >
   			<div class="rightside">
   				<h1>airoli</h1>
   				<h2> Sign up your account into our airoli. </h2>
   			
   			</div>
 	 	</div>
	</div>


</body>
</html>
<%
String n1=request.getParameter("name");
String n2=request.getParameter("email");
String n3=request.getParameter("phone_no");
String n4=request.getParameter("gender");
String n5=request.getParameter("age");
String n6=request.getParameter("Password");


if(n1 != null&& n2 != null && n3 != null && n4 != null && n5 != null && n6 != null){
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","scott","tiger");
	PreparedStatement pr=con.prepareStatement("insert into register values(?,?,?,?,?,?)");
	pr.setString(1, n1);
	pr.setString(2, n2);
	pr.setString(3, n3);
	pr.setString(4, n4);
	pr.setString(5, n5);
	pr.setString(6, n6);
int rs=pr.executeUpdate();

HashMap<String,String> hs=new HashMap<>();
hs.put(n1,"name");
hs.put(n2,"email");
hs.put(n3,"phone_no");

session.setAttribute("details",hs);


	if(rs != 0){
	response.sendRedirect("index.jsp");
	}
	else{
	con.close();
	}
	
}
catch(Exception e)
{
	out.print(e);
}
}
%>