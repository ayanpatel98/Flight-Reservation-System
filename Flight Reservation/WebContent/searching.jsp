<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import = "java.sql.*"%>
 <%String n4=""; %>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<title>Airoli Searching</title>
<link rel="stylesheet" href="css/styles1.css"/>
<script type="text/javascript">
function check()
{

	var x=document.getElementById("from").value;
	var f ="";
	
	if( ! f.test(x))
	{
		alert("Insert valid Source");
		return false;
	}
	var x1=document.getElementById("to").value;
	var f1 ="";
	
	if( ! f1.test(x1))
	{
		alert("Insert valid Destination");
		return false;
	}
}
</script>
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
      <h1>Search your Flight</h1>
   </div>


  <div class="row2">
  <form onsubmit="return check()">
  
From.:<input type="text" name="from" id="from" class="form-control"><br>
To:<input type="text" name="to" id="to" class="form-control"><br>
<input type="submit" value="submit" class="btn btn-primary btn-lg btn-block" >

</form>
  

  </div>


  <div class="row3" >
  <%
	String n1=request.getParameter("from");
	String n2=request.getParameter("to");
	String n3="";
	if(n1!=null && n2!=null )
	{	
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","scott","tiger");
			PreparedStatement pr1,pr2;
			pr1 = con.prepareStatement("select  * from flight where src=? and dst=?");
			pr1.setString(1,  n1);
			pr1.setString(2,  n2);
			ResultSet rs1 = pr1.executeQuery();
			
			if(rs1.next())
			{
				 n3=rs1.getString(1);
				
			}
			pr2 = con.prepareStatement("select  * from flight_details where f_code=?");
			pr2.setString(1,  n3);
			ResultSet rs2 = pr2.executeQuery();
			
%>
<table border=1>
<th>Flight Name</th>
<th>Departure Day</th>
<th>Arrival day</th>
<th>Arrival Time</th>
<th>Departure Time</th>

<%			
			while(rs2.next())
			{
				n4=rs2.getString(1);
				String n5=rs2.getString(2);
				String n6=rs2.getString(3);
				String n7=rs2.getString(4);
				String n8=rs2.getString(5);
				String n9=rs2.getString(6);
				out.print("<tr><td>" + n5 +"</td><td> "+ n6 +"</td><td> "+ n7 +"</td><td> "+ n8 +"</td><td> "+ n9 +"</td></tr> ");
				
				
				
				
			}
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
%>
  </table>

  </div>
</div>




<footer>
  @2019 Airoli Right reserved
</footer>

</body>
</html>