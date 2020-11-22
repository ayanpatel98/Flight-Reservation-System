<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ page import = "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Reservation Details</title>
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
      <h1>Reservation Details</h1>
   </div>


  <div class="row2">
	<table>
  <tr>
    <th>Phone Number</th>
    <th>from</th>
    <th>To</th>
	<th>Departure Date</th>
	<th>Passenger</th>
	<th>Flight Number</th>
	<th>Address</th>
	<th>Email</th>
	<th>Reservation Type</th>
  </tr>
  <%
	
	String n3=(String)session.getAttribute("Mob");

	
	if(n3!=null)
	{	
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","scott","tiger");
			PreparedStatement pr = con.prepareStatement("select * from booking where phone_no=? ");
			
		
			pr.setString(1,  n3);
		
			ResultSet rs2 = pr.executeQuery();
%>


<% 			

		
			while(rs2.next())
			{
				
				
				String n5=rs2.getString(1);
				String n6=rs2.getString(2);
				String n7=rs2.getString(3);
				String n8=rs2.getString(4);
				String n9=rs2.getString(5);
				String n10=rs2.getString(6);
				String n11=rs2.getString(7);
				String n12=rs2.getString(8);
				String n13=rs2.getString(9);
				
				out.print("<tr><td>" + n5 +"</td><td> "+ n6 +"</td><td> "+ n7 +"</td><td> "+ n8 +"</td><td> "+ n9 +"</td><td> "+ n10 +"</td><td> "+ n11 +"</td><td> "+ n12 +"</td><td> "+ n13+"</td></tr>" );
								
				
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
</table>
		
	


</div>





<footer>
  @2019 Airoli Right reserved
</footer>

</body>
</html>