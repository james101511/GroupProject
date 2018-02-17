package DataBase;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**1
 * Servlet implementation class StudentServlet
 */
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	private UserDB UserDB;
	@Resource(name = "test1")
	private DataSource dataSource;

	@Override
	public void init() throws ServletException
	{

		super.init();
		// create our student db util and pass in the conn pool /datasource
		try
		{
			UserDB = new UserDB(dataSource);
		}
		catch (Exception exc)
		{
			throw new ServletException(exc);
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		try
		{
			// list the students
			listStudents(request, response);
		}
		catch (Exception exc)
		{
			throw new ServletException(exc);
		}

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		try
		{
			// list the students
			addUser(request, response);
		}
		catch (Exception exc)
		{
			throw new ServletException(exc);
		}

	}

	private void listStudents(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
//		// get students from db util
//		List<User> users = UserDB.getStudents();
//
//		// add students to the request
//		request.setAttribute("STUDENTS_LIST", students);
//		// send to JSP page (view)
//		RequestDispatcher dispatcher = request.getRequestDispatcher("/list-student.jsp");
//		dispatcher.forward(request, response);
	}
	private void addUser(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		String FirstName = request.getParameter("firstName");
		String LastName = request.getParameter("lastName");
		String Email = request.getParameter("email");
		String Password = request.getParameter("password");
		User user = new User(FirstName, LastName, Email,Password);
		UserDB.addUser(user);
		request.getRequestDispatcher("/LogInPage.jsp");
		

	}

}
