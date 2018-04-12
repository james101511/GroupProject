package DataBase;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
			String theCommand = request.getParameter("command");
			switch (theCommand)
			{

				case "CHECKPROJECT":
					turnToDashboard(request, response);
					break;
				case "checkTaskDetail":
					checkTaskDetail(request, response);
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

	private void checkTaskDetail(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		String taskName = request.getParameter("taskName");
		String projectName = request.getParameter("projectName");
		// if(true)
		// {
		// response.getWriter().println(taskName);
		// response.getWriter().println(projectName);
		// return;
		// }
		List<TaskInvolve> taskInvolves = new ArrayList<>();
		TaskInvolve taskInvolve = new TaskInvolve(taskName, null, projectName);
		taskInvolves = dataBase.checkTaskDetail(taskInvolve);
		request.setAttribute("taskInvolves", taskInvolves);
		request.getRequestDispatcher("/AddMemberToTask.jsp?name=taskName").forward(request, response);

	}

	private void checkTask(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		String projectName = request.getParameter("projectName");
		String email = request.getParameter("email");

		List<Task> tasks = new ArrayList<>();
		Task task = new Task(projectName);
		tasks = dataBase.checkTask(task);
		request.setAttribute("tasks", tasks);
		boolean admin = dataBase.checkadmin(projectName, email);
		if (admin == true)
		{
			request.getRequestDispatcher("/Dashboard.jsp").forward(request, response);
		}
		checkTaskInvolve(request, response);

	}

	private void checkProject(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		String projectName = request.getParameter("projectName");
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
				case "CHECKUSER":
					CheckUser(request, response);
					break;
				case "ADD":
					addUser(request, response);
					break;

				case "ADDPROJECT":
					AddProject(request, response);

					break;

				case "Invite":
					addMember(request, response);
					turnToDashboard(request, response);
					break;
				case "CHECKPROJECT":
					checkProject(request, response);
					break;
				case "Skip":
					turnToDashboard(request, response);
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
				case "addTaskMember":
					addTaskMember(request, response);
					break;
				case "deleteTaskMember":
					deleteTaskMember(request, response);
					break;

			}

		}
		catch (Exception exc)
		{
			throw new ServletException(exc);
		}

	}

	private void deleteTaskMember(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		String userEmail = request.getParameter("deleteUserEmail");
//		if (true)
//		{
//			response.getWriter().println(userEmail);
//			return;
//		}
		String projectName = request.getParameter("projectName");
		String taskName = request.getParameter("taskName");
		TaskInvolve taskInvolve = new TaskInvolve(taskName, userEmail, projectName);
		dataBase.deleteTaskMember(taskInvolve);
		checkTaskDetail(request, response);

	}

	private void addTaskMember(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		String userEmail = request.getParameter("userEmail");
		String projectName = request.getParameter("projectName");
		String taskName = request.getParameter("taskName");
		TaskInvolve taskInvolve = new TaskInvolve(taskName, userEmail, projectName);
		dataBase.addTaskMember(taskInvolve);
		checkTaskDetail(request, response);

	}

	private void turnToDashboard(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		checkProject(request, response);
		checkTask(request, response);
	}

	private void checkTaskInvolve(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		List<String> taskNames = new ArrayList<>();
		String projectName = request.getParameter("projectName");
		String email = request.getParameter("email");
		taskNames = dataBase.checkTaskInvolve(projectName, email);
		request.setAttribute("taskNames", taskNames);
		request.getRequestDispatcher("/Dashboard2.jsp").forward(request, response);

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
		// if (FirstName == null || FirstName.trim().equals("") || LastName == null ||
		// LastName.trim().equals("")
		// || Email == null || Email.trim().equals("") || Password == null ||
		// Password.trim().equals(""))
		//
		// {
		// response.getWriter().println("please dont input empty email or username");
		// return;
		// }

		User user = new User(LastName, FirstName, Email, Password);
		dataBase.addUser(user);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/LogInPage.jsp");
		dispatcher.forward(request, response);

	}

	private void CheckUser(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		PrintWriter out = response.getWriter();
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		List<Involve> involves = new ArrayList<>();
		User user = new User(email, password);
		Involve involve = new Involve(email, true);
		involves = dataBase.CheckInvolve(involve);
		User us = dataBase.login(user);
		// if (true)
		// {
		// out.println("<script type=\"text/javascript\">");
		// out.println("alert('User or password incorrect');");
		// out.println("window.location='LogInPage.jsp';");
		// out.println("</script>");
		// }

		request.setAttribute("user", us);
		request.setAttribute("Involve", involves);
		request.setAttribute("email", email);
		// response.getWriter().println("Login success!!!");
		request.getRequestDispatcher("/CreateProject.jsp").forward(request, response);
		return;

	}

}
