package in.sp.backend;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
@WebServlet("/ViewDataServlet")


public class ViewDataServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String username = (String) request.getSession().getAttribute("user");
	    String day = request.getParameter("currentday");

	    Connection connection = null;
	    List<Task> tasks = new ArrayList<>();

	    try {
	       
				connection = DatabaseHelper.getConnection();
		
	        String query = "SELECT task_name, start_time, end_time FROM tasks WHERE username=? AND day=?";
	        
	        PreparedStatement preparedStatement = connection.prepareStatement(query);
	        preparedStatement.setString(1, username);
	        preparedStatement.setString(2, day);
	        ResultSet resultSet = preparedStatement.executeQuery();
	        while (resultSet.next()) {
	      
	            Task task = new Task(
	                resultSet.getString("task_name"),
	                resultSet.getString("start_time"),
	                resultSet.getString("end_time")
	            );
	            
	            tasks.add(task);
	        
	        }

	        resultSet.close();
	        preparedStatement.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
	        DatabaseHelper.closeConnection(connection);
	    }

	    	    request.setAttribute("usertasks", tasks);

	    RequestDispatcher dispatcher = request.getRequestDispatcher("welcome.jsp");
	    dispatcher.forward(request, response);
	}
}
