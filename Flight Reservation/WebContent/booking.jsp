<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
         <%@ page import = "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script type="text/javascript">
function check()
{

	
	
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

<title>Airoli Booking</title>
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
      <h1> Booking a Flight Ticket</h1>
   </div>


  <div class="row2">
  <form onsubmit="return check()">
<table id="rcorners1" >
<tr>
<th>Phone number:-</th>
<td><input type="text" name="pn" id="pn">
</td>

<tr>
	<th>Departure Date:-</th>
	<td><input type="date" id="dt" name="dt"
       value=""
       min="2017-01-01" max="2020-12-31"></td>
       </tr>

<tr>
	<th>Passenger(s)</th>
	<td><input type="number" id="passenger" name="passenger" style=" maxlength=5;width: 60px;"></td>
</tr>
<tr>
	<th>Flight no:-</th>
	<td>
	<%
out.print(session.getAttribute("f_code1"));
	%>
	
	</td>
</tr>

<tr>
	<th>Address:-</th>
	<td><input type="text" id="add" name="add"></td>
       </tr>

<tr>
<tr>
	<th>Email:-</th>
	<td><input type="text" id="mail" name="mail"
       ></td>
       </tr>

<tr>
<tr>
	<th>Reservation Type:</th>
	<td><select id="revt" name="revt">
	<option name="bussiness">Business </option>
	<option name="economic">economic </option>
	</select></td>
</tr>


<tr>
	<td colspan="2"><input type="submit" value="submit" class="btn btn-primary btn-lg btn-block" ></td>
</tr>
</table>
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
String n1=request.getParameter("pn");
String n2=(String)session.getAttribute("from1");
String n3=(String)session.getAttribute("to1");
String n4=request.getParameter("dt");
String n5=request.getParameter("passenger");
String n6=(String)session.getAttribute("f_code1");
String n7=request.getParameter("add");
String n8=request.getParameter("mail");
String n9=request.getParameter("revt");


if(n1 != null&& n2 != null && n3 != null && n4 != null && n5 != null &&  n6 != null &&  n7 != null && n8 != null && n9 != null ){
try
{
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","scott","tiger");
	
	PreparedStatement pr=con.prepareStatement("insert into booking values(?,?,?,?,?,?,?,?,?)");
	
	pr.setString(1, n1);
	pr.setString(2, n2);
	pr.setString(3, n3);
	pr.setString(4, n4);
	pr.setString(5, n5);
	 pr.setString(6, n6);
	pr.setString(7, n7);
	pr.setString(8, n8);
	pr.setString(9, n9);
	int rs=pr.executeUpdate();
	
	
	
	out.print("<script>alert('Booking Successful')</script>");
	if(rs > 0) {
		
	response.sendRedirect("reservationDetails.jsp");
	}
	
	con.close();
}
catch(Exception e)
{
	out.print(e);
}

}

%>