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

				case "checkTaskDetail":
					checkTaskDetail(request, response);
					break;

			}
		}
		catch (Exception exc)
		{
			throw new ServletException(exc);
		}

	}

	// private void checkProject(HttpServletRequest request, HttpServletResponse
	// response) throws Exception
	// {
	// List<Project> projects = new ArrayList<>();
	// String projectName = request.getParameter("projectName");
	// Involve involve = new Involve(projectName, false);
	// involves = dataBase.checkProject(involve);
	//
	//
	// request.setAttribute("Involve", involves);
	//
	//
	// }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		try
		{
			String theCommand = request.getParameter("command");

			switch (theCommand)
			{
				case "login":
					login(request, response);
					break;
				case "createAccount":
					createAccount(request, response);
					break;

				case "addProject":
					addProject(request, response);
					break;

				case "invite":
					addMember(request, response);
					turnToDashboard(request, response);
					break;
				case "skip":
					turnToDashboard(request, response);
					break;
				case "addTask":
					addTask(request, response);
					getAllTask(request, response);
					break;
				case "editTask":
					editTask(request, response);
					getAllTask(request, response);
					break;
				case "deleteTask":
					deleteTask(request, response);
					getAllTask(request, response);
					break;
				case "addTaskMember":
					addTaskMember(request, response);
					break;
				case "deleteTaskMember":
					deleteTaskMember(request, response);
					break;
				case "checkProject":
					turnToDashboard(request, response);
					break;
				case "editProgress":
					editProgress(request, response);
					break;
				case "getAllTask":
					getAllTask(request, response);
					break;
				case "listMembersInTask":
					listMembersInTask(request, response);
					break;
			}

		}
		catch (Exception exc)
		{
			throw new ServletException(exc);
		}

	}

	private void listMembersInTask(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		List<TaskInvolve> membersInvolve = new ArrayList<>();
		String projectName = request.getParameter("projectName");
		String taskName = request.getParameter("taskName");
		String email = request.getParameter("userEmail");
		membersInvolve = dataBase.listMembersInTask(projectName, taskName);
		request.setAttribute("membersInvolve", membersInvolve);
		request.setAttribute("userEmail", email);
		request.getRequestDispatcher("/TaskPage_forMembers.jsp").forward(request, response);

	}

	private void getAllTask(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		String projectName = request.getParameter("projectName");
		List<Task> tasks = new ArrayList<>();
		Task task = new Task(projectName);
		tasks = dataBase.listTask(task);
		request.setAttribute("tasks", tasks);
		request.getRequestDispatcher("/AddTask.jsp").forward(request, response);
	}

	private void checkTaskDetail(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		String taskName = request.getParameter("taskName");
		String projectName = request.getParameter("projectName");

		List<TaskInvolve> taskInvolves = new ArrayList<>();
		TaskInvolve taskInvolve = new TaskInvolve(taskName, null, projectName);
		taskInvolves = dataBase.checkTaskDetail(taskInvolve);
		request.setAttribute("taskInvolves", taskInvolves);
		request.getRequestDispatcher("/AddMemberToTask.jsp?name=taskName").forward(request, response);

	}

	private void listTask(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		String projectName = request.getParameter("projectName");
		String email = request.getParameter("email");

		List<Task> tasks = new ArrayList<>();
		Task task = new Task(projectName);
		tasks = dataBase.listTask(task);
		request.setAttribute("tasks", tasks);
		boolean admin = dataBase.checkAdmin(projectName, email);
		if (admin == true)
		{
			request.setAttribute("userEmail", email);
			request.getRequestDispatcher("/Dashboard.jsp").forward(request, response);
		}
		listTaskInvolve(request, response);

	}

	private void editProgress(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		String userEmail = request.getParameter("userEmail");
		String progress = request.getParameter("progress");
		String percentage = request.getParameter("percentage");
		String projectName = request.getParameter("projectName");
		String taskName = request.getParameter("taskName");

		TaskInvolve taskInvolve = new TaskInvolve(taskName, userEmail, projectName, progress, percentage);
		dataBase.editProgress(taskInvolve);
		listMembersInTask(request, response);

	}

	private void deleteTaskMember(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		String userEmail = request.getParameter("deleteUserEmail");
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
		// checkProject(request, response);
		listTask(request, response);
	}

	private void listTaskInvolve(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		List<String> taskNames = new ArrayList<>();
		String projectName = request.getParameter("projectName");
		String email = request.getParameter("email");

		taskNames = dataBase.listTaskInvolve(projectName, email);
		request.setAttribute("taskNames", taskNames);
		request.setAttribute("userEmail", email);
		request.getRequestDispatcher("/Dashboard2.jsp").forward(request, response);

	}

	private void deleteTask(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		String projectName = request.getParameter("projectName");
		String taskName = request.getParameter("taskName");
		dataBase.deleteTaskInvolve(taskName, projectName);
		dataBase.deleteTask(projectName, taskName);

	}

	private void editTask(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		String projectName = request.getParameter("projectName");
		String taskName = request.getParameter("taskName");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		dataBase.editTask(projectName, taskName, startDate, endDate);

	}

	private void addTask(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		 PrintWriter out = response.getWriter();
		String taskName = request.getParameter("taskName");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String projectName = request.getParameter("projectName");
		Task task = new Task(projectName, taskName, startDate, endDate);
		if (dataBase.checkDuplicate(projectName,taskName)==true)
		{
			
				 {
				 out.println("<script type=\"text/javascript\">");
				 out.println("alert('User or password incorrect');");
				 out.println("window.location='LogInPage.jsp';");
				 out.println("</script>");
				 }
			return;
		}
		dataBase.addTask(task);


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
			Project tempProject = new Project(projectName, false, emails.get(j));
			dataBase.addMember(tempProject);
		}

	}

	private void addProject(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		String projectName = request.getParameter("projectName");
		String email = request.getParameter("email");
		dataBase.createProject(projectName);
		dataBase.addProject(projectName, email);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/InviteMembers.jsp");
		dispatcher.forward(request, response);

	}

	private void createAccount(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		User user = new User(lastName, firstName, email, password);
		dataBase.createAccount(user);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/LogInPage.jsp");
		dispatcher.forward(request, response);
	}

	private void login(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		List<Project> projects = new ArrayList<>();
		// PrintWriter out = response.getWriter();
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		User user = new User(email, password);
		Project project = new Project(email);
		projects = dataBase.checkProject(project);
		User us = dataBase.login(user);
		// if (true)
		// {
		// out.println("<script type=\"text/javascript\">");
		// out.println("alert('User or password incorrect');");
		// out.println("window.location='LogInPage.jsp';");
		// out.println("</script>");
		// }

		request.setAttribute("user", us);
		request.setAttribute("projects", projects);
		request.setAttribute("email", email);
		request.getRequestDispatcher("/CreateProject.jsp").forward(request, response);
		return;

	}

}
