package DataBase;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

/**
 * 1 Servlet implementation class StudentServlet
 */
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	private DataBase dataBase;
	@Resource(name = "test1")
	private DataSource dataSource;

	@Override
	public void init() throws ServletException
	{

		super.init();
		// create our student db util and pass in the conn pool /datasource
		try
		{
			dataBase = new DataBase(dataSource);
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
			CheckUser(request, response);
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
			String theCommand = request.getParameter("command");

			switch (theCommand)
			{
				case "ADD":
					addUser(request, response);
					break;

				case "ADDPROJECT":
					AddProject(request, response);
					
					break;

			}

		}
		catch (Exception exc)
		{
			throw new ServletException(exc);
		}

	}

	private void AddManager(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		String ProjectName = request.getParameter("ProjectName");
		// String LastName = request.getParameter("lastName");
		String Email = request.getParameter("Email");
		// String Password = request.getParameter("password");
		Involve involve = new Involve(ProjectName,Email);
		dataBase.addManager(involve);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/InviteMembers.jsp");
		dispatcher.forward(request, response);
		
	}

	private void AddProject(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		String ProjectName = request.getParameter("ProjectName");
		// String LastName = request.getParameter("lastName");
		// String Email = request.getParameter("email");
		// String Password = request.getParameter("password");
		Project project = new Project(ProjectName);
		dataBase.addProject(project);
		AddManager(request,response);
//		RequestDispatcher dispatcher = request.getRequestDispatcher("/InviteMembers.jsp");
//		dispatcher.forward(request, response);
	}

	private void listStudents(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// // get students from db util
		// List<User> users = UserDB.getStudents();
		//
		// // add students to the request
		// request.setAttribute("STUDENTS_LIST", students);
		// // send to JSP page (view)
		// RequestDispatcher dispatcher =
		// request.getRequestDispatcher("/list-student.jsp");
		// dispatcher.forward(request, response);
	}

	private void addUser(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		String FirstName = request.getParameter("firstName");
		String LastName = request.getParameter("lastName");
		String Email = request.getParameter("email");
		String Password = request.getParameter("password");
		if (FirstName == null || FirstName.trim().equals("") || LastName == null || LastName.trim().equals("")
				|| Email == null || Email.trim().equals("") || Password == null || Password.trim().equals(""))

		{
			response.getWriter().println("please dont input empty email or username");
			return;
		}

		User user = new User(LastName, FirstName, Email, Password);
		dataBase.addUser(user);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/LogInPage.jsp");
		dispatcher.forward(request, response);

	}

	private void CheckUser(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		List<Involve> involves = new ArrayList<>();
		if (email == null || email.trim().equals("") || password == null || password.trim().equals(""))

		{
			response.getWriter().println("Please dont input empty email or username");
			return;
		}

		User user = new User(email, password);
		Involve involve = new Involve(email);
		involves=dataBase.CheckInvolve(involve);
		User us = dataBase.login(user);
		if (us == null)
		{
			response.getWriter().println("Password or Email is incorrect");

			return;
		}
		else
		{

			request.setAttribute("user", us);
			request.setAttribute("Involve", involves);
			// response.getWriter().println("Login success!!!");
			request.getRequestDispatcher("/CreateProject.jsp").forward(request, response);
			return;

		}
	}

}
