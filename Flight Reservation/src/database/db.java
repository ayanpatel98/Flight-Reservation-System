package database;
import java.sql.*;
public class db  
{
  static Connection conn=null;
  static PreparedStatement pr;

	
	
	public static Connection getConnection() throws ClassNotFoundException, SQLException
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","hr","hr");
		return conn;
	}
		
		


public static int insertData(String name, String email,String phone, String gender,String age, String password) throws SQLException
{
	 
		pr=conn.prepareStatement("insert into register values(?,?,?,?,?,?)");
	pr.setString(1, name);
	pr.setString(2, email);
	pr.setString(3, phone);
	pr.setString(4, gender);
	pr.setString(5, age);
	pr.setString(6, password);

	return pr.executeUpdate();
	
		
}

public static int updateData( String phone,String password) throws SQLException
{
	pr=conn.prepareStatement("select * from register where phone=?,password=? ");
	
	ResultSet rs=pr.executeQuery();
	
	
	if(rs.next()) { 
		pr=conn.prepareStatement("update register set name=?,email=?,phone=?,gender=?,age=?,password=? ");
	pr.setString(1, rs.getString(1));
	pr.setString(2,rs.getString(2));
	pr.setString(3, phone);
	pr.setString(4, rs.getString(4));
	pr.setString(5, rs.getString(5));
	pr.setString(6, password);

	return pr.executeUpdate();
	}
	else
	{
		return 0;
	}
}

public static int deleteData( String phone,String password) throws SQLException
{
	pr=conn.prepareStatement("delete from register where phone=?,password=? ");
	pr.setString(3, phone);
	pr.setString(6, password);
	
	
	return pr.executeUpdate();
}
}
