package DataBase;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
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

import com.sun.webkit.BackForwardList;

import apple.laf.JRSUIConstants.Size;
import jdk.internal.org.objectweb.asm.tree.IntInsnNode;

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
			String theCommand = request.getParameter("command");
			switch (theCommand)
			{
				case "CHECKUSER":
					CheckUser(request, response);
					break;
				case "CHECKPROJECT":
					turnToDashboard(request,response);
					break;
				// case "CHECKTASK":
				// checkTask(request, response);
				// break;
				case "CHECKTASKINVOLVE":
					checkTaskInvolve(request, response);
					break;
				case "getAllTask":
					getAllTask(request, response);
					break;
			}
		}
		catch (Exception exc)
		{
			throw new ServletException(exc);
		}

	}

	private void getAllTask(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		String projectName = request.getParameter("projectName");
		List<Task> tasks = new ArrayList<>();
		Task task = new Task(projectName);
		tasks = dataBase.checkTask(task);
		request.setAttribute("tasks", tasks);
		request.getRequestDispatcher("/AddTask.jsp").forward(request, response);
	}

	private void checkTaskInvolve(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		String taskName = request.getParameter("taskName");
		List<TaskInvolve> taskInvolves = new ArrayList<>();
		TaskInvolve taskInvolve = new TaskInvolve(taskName);
		taskInvolves = dataBase.checkTaskInvolve(taskInvolve);
		request.setAttribute("taskInvolves", taskInvolves);
		request.getRequestDispatcher("/AddMemberToTask.jsp?name=taskName").forward(request, response);

	}

	private void checkTask(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		String projectName = request.getParameter("projectName");
		String email = request.getParameter("Email");

		List<Task> tasks = new ArrayList<>();
		Task task = new Task(projectName);
		tasks = dataBase.checkTask(task);
		request.setAttribute("tasks", tasks);
		boolean admin = dataBase.checkadmin(projectName, email);
		if (admin == true)
		{
			request.getRequestDispatcher("/Dashboard.jsp").forward(request, response);
		}
		request.getRequestDispatcher("/Dashboard2.jsp").forward(request, response);

	}

	private void checkProject(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		String projectName = request.getParameter("projectName");
		if (projectName == null)
		{

			response.getWriter().println("0");

			return;
		}

		List<Involve> involves = new ArrayList<>();
		Involve involve = new Involve(projectName, false);
		involves = dataBase.checkProject(involve);
		if (involves.size() == 0)
		{
			response.getWriter().println(projectName);
			response.getWriter().println("0");

			return;
		}
		// request.setAttribute("projectname", projectName);
		request.setAttribute("Involve", involves);
		// response.getWriter().println("Login success!!!");
		// request.getRequestDispatcher("/Dashboard.jsp").forward(request, response);

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

				case "Invite":
					addMember(request, response);
					turnToDashboard(request,response);
					break;
				case "CHECKPROJECT":
					checkProject(request, response);
					break;
				case "Skip":
					turnToDashboard(request,response);
					break;
				case "ADDTASK":
					addTask(request, response);
					getAllTask(request, response);
					break;
				case "EDITTASK":
					editTask(request, response);
					getAllTask(request, response);
					break;
				case "DELETETASK":
					deleteTask(request, response);
					getAllTask(request, response);
					break;
				

			}

		}
		catch (Exception exc)
		{
			throw new ServletException(exc);
		}

	}

	private void turnToDashboard(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		checkProject(request, response);
		checkTask(request, response);
		
	}

	private void deleteTask(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		String projectName = request.getParameter("projectName");
		String taskName = request.getParameter("TaskName");
		dataBase.deleteTask(projectName, taskName);

	}

	private void editTask(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		String projectName = request.getParameter("projectName");
		String taskName = request.getParameter("TaskName");
		String startDate = request.getParameter("StartDate");
		String endDate = request.getParameter("EndDate");
		if (taskName == null || startDate == null || endDate == null)
		{
			response.getWriter().println(projectName);
			response.getWriter().println(taskName);
			response.getWriter().println(startDate);
			response.getWriter().println(endDate);
			return;
		}
		dataBase.editTask(projectName, taskName, startDate, endDate);

	}

	private void addTask(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		String taskName = request.getParameter("TaskName");
		String startDate = request.getParameter("StartDate");
		String endDate = request.getParameter("EndDate");
		String projectName = request.getParameter("projectName");
		// if(true)
		// {
		// response.getWriter().println(projectName);
		// return;
		// }

		Task task = new Task(projectName, taskName, startDate, endDate);
		dataBase.addTask(task);

		// Task task = new Task(projectName)

	}

	private void addMember(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		List<String> emails = new ArrayList<>();
		String projectName = request.getParameter("projectName");
		int i = 1;
		while (request.getParameter("Email" + i) != null)
		{
			String email = request.getParameter("Email" + i);
			emails.add(email);
			i++;
		}

		for (int j = 0; j < emails.size(); j++)
		{
			Involve involve = new Involve(projectName, emails.get(j));
			dataBase.addMember(involve);
		}

	}

	private void AddManager(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		String ProjectName = request.getParameter("ProjectName");
		// String LastName = request.getParameter("lastName");
		String Email = request.getParameter("Email");
		// String Password = request.getParameter("password");
		Involve involve = new Involve(ProjectName, Email);
		dataBase.addManager(involve);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/InviteMembers.jsp");
		dispatcher.forward(request, response);

	}

	private void AddProject(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		String ProjectName = request.getParameter("ProjectName");

		Project project = new Project(ProjectName);
		dataBase.addProject(project);
		// request.setAttribute("project", project.getProjectName());
		AddManager(request, response);
		// RequestDispatcher dispatcher =
		// request.getRequestDispatcher("/InviteMembers.jsp");
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
		User user = new User(email, password);
		Involve involve = new Involve(email, true);
		involves = dataBase.CheckInvolve(involve);
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
			request.setAttribute("email", email);
			// response.getWriter().println("Login success!!!");
			request.getRequestDispatcher("/CreateProject.jsp").forward(request, response);
			return;

		}
	}

}
