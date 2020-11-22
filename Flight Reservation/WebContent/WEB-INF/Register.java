

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import database.db;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		int rs=0;
		PrintWriter out=response.getWriter();
		
		String n1=request.getParameter("name");
		String n2=request.getParameter("email");
		String n3=request.getParameter("phone_no");
		String n4=request.getParameter("gender");
		String n5=request.getParameter("age");
		String n6=request.getParameter("Password");
	db.getConnection();
	      try {
			 rs= db.insertData(n1,n2,n3,n4,n5,n6);
		} catch (SQLException e) {
						e.printStackTrace();
		}
	      if(rs==1) {
	    	  response.sendRedirect("login.jsp");
	    	  
	      }else {
	    	  response.sendRedirect("register.jsp");
	      }
	}

}
