<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import = "java.sql.*"%>

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
      <h1>Book your Flight</h1>
   </div>


  <div class="row2">
  <form onsubmit="return check()">
  
From.:<input type="text" name="from" id="from" class="form-control"><br>
To:<input type="text" name="to" id="to" class="form-control"><br>
<input type="submit" value="submit" class="btn btn-primary btn-lg btn-block" >

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
	System.out.println(n1);
	System.out.println(n2);
	if(n1!=null && n2!=null )
	{	
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","scott","tiger");
			PreparedStatement pr = con.prepareStatement("select  * from flight where src=? and dst=?");
			pr.setString(1,  n1);
			pr.setString(2,  n2);
			ResultSet rs1 = pr.executeQuery();
			
			
			while(rs1.next())
			{
				String n3=rs1.getString(1);
				session.setAttribute("from1",n1);
				session.setAttribute("to1",n2);
		     	session.setAttribute("f_code1",n3);
				
				response.sendRedirect("booking.jsp");
			}
			
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
%>