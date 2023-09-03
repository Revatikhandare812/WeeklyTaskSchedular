package in.sp.backend;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class loginServlet extends HttpServlet {
protected void doPost(HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException{
	
	try {
		PrintWriter out=resp.getWriter();
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/User","root","rootuser");
		
		String user=req.getParameter("uname");
		String pwd=req.getParameter("upwd");
		
		PreparedStatement ps=con.prepareStatement("select username from register where username=? and password=?");
		
		ps.setString(1, user);
		ps.setString(2, pwd);
		ResultSet rs=ps.executeQuery();
		
		if(rs.next()){

//			String user=rs.getColumnName(1);
			HttpSession session=req.getSession();
			
			
			session.setAttribute("user",user);
			
			RequestDispatcher rd=req.getRequestDispatcher("/welcome.jsp");
			rd.forward(req,resp);
		}
		else {
			resp.setContentType("text/html");
			out.println("<h3 style='color:red'>Login Failed!</h3>");
			RequestDispatcher rd=req.getRequestDispatcher("/login.jsp");
			rd.include(req,resp);
		}
		
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	
}
}

