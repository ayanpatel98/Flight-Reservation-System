<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@ page import = "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<title>Airoli Cancel Ticket</title>
<link rel="stylesheet" href="css/styles1.css"/>
</head>
<body>
<!-- Sticky Navbar -->
<nav>
    <h1>
      airoli
    </h1>
    <ul>
      <li><a href="home.jsp" >Home</a></li>
      <li><a href="#popup1">Sign out</a></li>
    </ul>
  </nav>
<!-- End of Sticky Navbar -->
<!--sign out overlay-->

<div id="popup1" class="overlay">
	<div class="popup">
		<h2>Sign Out</h2>
		<a class="close" href="#">&times;</a>
		<div class="content">
      <p>Do you want to sign out from airoli?</p>
      <button onclick="location.href='#'">Cancel</button>
      <button onclick="location.href='logout.jsp'">Ok</button>

		</div>
	</div>
</div>
<!--sign out overlay-->
<!-- image content -->


<!-- end of image -content-->
<div class="column">

   <div class="row1">
      <h1>Cancel your Flight </h1>
   </div>


  <div class="row2">
<form >

Phone no:-<input type="text" name="pn" id="pn" class="form-control">
From.:<input type="text" name="from" id="from" class="form-control"><br>
To:<input type="text" name="to" id="to" class="form-control"><br>
Booking Date:-<input type="date" id="dt" name="dt"
       value=""
       min="2017-01-01" max="2020-12-31" class="form-control">
<input type="submit" value="submit" class="btn btn-primary  btn-block" >

</form>
  </div>


  <div class="row3" >

  </div>
</div>





<footer>
  @2019 Airoli Right reserved
</footer>

</body>
</html>
<%
	String n1=request.getParameter("from");
	String n2=request.getParameter("to");
	String n3=request.getParameter("pn");
	String n4=request.getParameter("dt");
	System.out.println(n1);
	System.out.println(n2);
	if(n1!=null && n2!=null )
	{	
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","scott","tiger");
			PreparedStatement pr = con.prepareStatement("delete from booking where from_1=? and to_1=? and Phone_no=? and date1=?");
			pr.setString(1,  n1);
			pr.setString(2,  n2);
			pr.setString(3,  n3);
			pr.setString(4,  n4);
			ResultSet rs1 = pr.executeQuery();
			
			
			while(rs1.next())
			{
				
				out.print("Cancellation done");
				response.sendRedirect("home.jsp");
				
			}
			
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
%>
<%
String a=(String)session.getAttribute("Mob");
if(a==null)
{
	response.sendRedirect("login.jsp");	
}


%>