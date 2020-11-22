<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Airoli Home</title>
<link rel="stylesheet" href="css/style.css"/>
</head>
<body>
<!-- Sticky Navbar -->
<nav>
    <h1>
      airoli
    </h1>
    <ul>
      <li><a href="home.jsp" class="active">Home</a></li>
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

<div class="container">
  <div class="box">
<div class="image-content">
  <div class ="image">
      <div class="text">
          <h1>Book a ticket a like a boss</h1>
      </div>
  </div>
</div>
<div class="line"></div>
<!-- end of image -content-->
<div class="column">
<a href="searching.jsp">
   <div class="row">
		<h1>Search your Flight</h1>
   </div>
</a>
<a href="Booking1.jsp">
  <div class="row">
		<h1>Book your Flight</h1>
  </div>
</a>
<a href="cancelation.jsp">
  <div class="row" >
		<h1>Cancel your Flight</h1>
  </div>
</a>

<a href="reservationDetails.jsp">
  <div class="row" >
		<h1>Reservation Details</h1>
  </div>
</a>
</div>

</div>
</div>



<footer>
  @2019 Airoli Right reserved
</footer>
<%
String a=(String)session.getAttribute("Mob");
if(a==null)
{
	response.sendRedirect("login.jsp");	
}


%>
</body>
</html>
