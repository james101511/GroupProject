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
				case "deleteTaskMember":
					deleteTaskMember(request, response);
					break;
				case "addTaskMember":
					addTaskMember(request, response);
					break;
				case "turnToProject":
					turnToProject(request, response);
					break;
				case"turnToDashboard":
					turnToDashboard(request,response);
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

					break;
				case "skip":
					listTask(request, response);
					break;
				case "addTask":
					addTask(request, response);

					break;
				case "editTask":
					editTask(request, response);

					break;
				case "deleteTask":
					deleteTask(request, response);
					getAllTask(request, response);
					break;

				case "checkProject":
					listTask(request, response);
					break;
				case "editProgress":
					editProgress(request, response);
					break;

				case "listMembersInTask":
					listMembersInTask(request, response);
					break;
				// case "editProject":
				// editProject(request, response);
				// break;
				case "deleteProject":
					deleteProject(request, response);
					break;
				case "addMember":
					addMember(request, response);
					break;
				case "deleteMember":
					deleteMember(request, response);
					break;
				case "rename":
					rename(request, response);
					break;
				case "listMembersInProject":
					listMembersInProject(request, response);
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

	private void rename(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		List<Project> projects = new ArrayList<>();
		String newProjectName = request.getParameter("newProjectName");
		String projectName = request.getParameter("projectName");
		String email = request.getParameter("email");

		dataBase.rename(newProjectName, projectName);
		User user = new User(email, null);
		Project project = new Project(email);
		projects = dataBase.checkProject(project);
		User us = dataBase.login(user);

		request.setAttribute("user", us);
		request.setAttribute("projects", projects);
		request.getRequestDispatcher("/CreateProject.jsp").forward(request, response);
	}

	private void deleteMember(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		PrintWriter out = response.getWriter();
		String projectName = request.getParameter("projectName");
		String token = request.getParameter("token");
		String email = request.getParameter("email" + token);
		String admin = request.getParameter("admin" + token);
		String email2 = request.getParameter("userEmail");

		if (admin.equals("true"))
		{
			out.println("<script type=\"text/javascript\">");
			out.println("alert('You can not delete the manager');");
			out.println("window.history.go(-1);");
			out.println("</script>");
			return;
		}

		dataBase.deleteMamber(projectName, email);
		List<ProjectInvolve> membersInvolve = new ArrayList<ProjectInvolve>();
		membersInvolve = dataBase.listMembersInProject(projectName);
		request.setAttribute("membersInvolve", membersInvolve);
		request.setAttribute("projectName", projectName);
		request.setAttribute("userEmail", email2);
		request.getRequestDispatcher("/edit_project.jsp").forward(request, response);

	}

	private void listMembersInProject(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		List<ProjectInvolve> membersInvolve = new ArrayList<ProjectInvolve>();
		String projectName = request.getParameter("projectName");
		String email = request.getParameter("userEmail");
		membersInvolve = dataBase.listMembersInProject(projectName);

		// if (true)
		// {
		// response.getWriter().println(email);
		// return;
		// }
		request.setAttribute("projectName", projectName);
		request.setAttribute("membersInvolve", membersInvolve);
		request.setAttribute("userEmail", email);
		request.getRequestDispatcher("/edit_project.jsp").forward(request, response);
	}

	private void listMembersInTask(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		List<TaskInvolve> membersInvolve = new ArrayList<>();
		String projectName = request.getParameter("projectName");
		String taskName = request.getParameter("taskName");
		String email = request.getParameter("userEmail");
		String taskProgress = dataBase.getTaskProgress(taskName, projectName);

		membersInvolve = dataBase.listMembersInTask(projectName, taskName);
		request.setAttribute("taskProgress", taskProgress);
		request.setAttribute("membersInvolve", membersInvolve);
		request.setAttribute("userEmail", email);
		request.getRequestDispatcher("/TaskPage_forMembers.jsp").forward(request, response);

	}

	private void getAllTask(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		String projectName = request.getParameter("projectName");
		String userEmail = request.getParameter("userEmail");
		List<Task> tasks = new ArrayList<>();
		Task task = new Task(projectName);
		tasks = dataBase.listTask(task);
		request.setAttribute("tasks", tasks);
		request.setAttribute("userEmail", userEmail);
		request.getRequestDispatcher("/AddTask.jsp").forward(request, response);
	}

	private void checkTaskDetail(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		String userEmail = request.getParameter("userEmail");
		String taskName = request.getParameter("taskName");
		String projectName = request.getParameter("projectName");
		List<TaskInvolve> taskInvolves = new ArrayList<>();
		TaskInvolve taskInvolve = new TaskInvolve(taskName, null, projectName);
		taskInvolves = dataBase.checkTaskDetail(taskInvolve);
		String taskProgress = dataBase.getTaskProgress(taskName, projectName);
		request.setAttribute("userEmail", userEmail);
		request.setAttribute("taskInvolves", taskInvolves);
		request.setAttribute("taskProgress", taskProgress);
		request.getRequestDispatcher("/AddMemberToTask.jsp").forward(request, response);

	}

	private void listTask(HttpServletRequest request, HttpServletResponse response) throws Exception
	{

		String token = request.getParameter("token");
		String projectName = request.getParameter("projectName" + token);
		String email = request.getParameter("email");
		String projectNameTrue = request.getParameter("projectName");
		if (projectNameTrue != null)
		{
			projectName = projectNameTrue;
		}
		List<Task> tasks = new ArrayList<>();
		Task task = new Task(projectName);
		tasks = dataBase.listTask(task);
		String projectProgress = dataBase.getProjectProgress(projectName);
		request.setAttribute("tasks", tasks);
		request.setAttribute("projectProgress", projectProgress);

		boolean admin = dataBase.checkAdmin(projectName, email);
		if (admin == true)
		{
			request.setAttribute("projectName", projectName);
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
		calculate(projectName, taskName);

		listMembersInTask(request, response);

	}

	private void deleteTaskMember(HttpServletRequest request, HttpServletResponse response) throws Exception
	{

		String userEmail = request.getParameter("deleteUserEmail");
		String projectName = request.getParameter("projectName");
		String taskName = request.getParameter("taskName");
		TaskInvolve taskInvolve = new TaskInvolve(taskName, userEmail, projectName);
		dataBase.deleteTaskMember(taskInvolve);
		calculate(projectName, taskName);

		checkTaskDetail(request, response);

	}

	private void addTaskMember(HttpServletRequest request, HttpServletResponse response) throws Exception
	{

		PrintWriter out = response.getWriter();
		String userEmail = trimSpace(request.getParameter("email"));
		String projectName = request.getParameter("projectName");
		String taskName = request.getParameter("taskName");
		boolean admin = dataBase.checkAdmin(projectName, userEmail);

		TaskInvolve taskInvolve = new TaskInvolve(taskName, userEmail, projectName);

		if (!dataBase.checkMemberInProject(userEmail, projectName))

		{

			out.println("<script type=\"text/javascript\">");
			out.println("alert('" + userEmail + "  is not in this project');");
			out.println("window.history.go(-1);");
			out.println("</script>");
			return;
		}

		if (dataBase.checkUserInTask(userEmail, taskName, projectName))
		{
			out.println("<script type=\"text/javascript\">");
			out.println("alert('" + userEmail + " is already in this task');");
			out.println("window.history.go(-1);");
			out.println("</script>");
			return;
		}
		if (admin == true)
		{
			out.println("<script type=\"text/javascript\">");
			out.println("alert('manager can not be in the task');");
			out.println("window.history.go(-1);");
			out.println("</script>");
			return;
		}
		dataBase.addTaskMember(taskInvolve);
		// change data
		calculate(projectName, taskName);

		checkTaskDetail(request, response);

	}

	// private void turnToDashboard(HttpServletRequest request, HttpServletResponse
	// response) throws Exception
	// {
	// // checkProject(request, response);
	// listTask(request, response);
	// }

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
		String token = request.getParameter("token");
		String projectName = request.getParameter("projectName");
		String taskName = request.getParameter("taskName" + token);
		dataBase.deleteTaskInvolve(taskName, projectName);
		dataBase.deleteTask(projectName, taskName);
		calculate(projectName, taskName);

	}

	private void editTask(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		PrintWriter out = response.getWriter();
		String token = request.getParameter("token");
		String projectName = request.getParameter("projectName");
		String taskName = request.getParameter("taskName" + token);
		String startDate = trimSpace(request.getParameter("startDate"));
		String endDate = trimSpace(request.getParameter("endDate"));

		int startYear = Integer.parseInt(startDate.substring(6, 10));
		int endYear = Integer.parseInt(endDate.substring(6, 10));
		int startMonth = Integer.parseInt(startDate.substring(0, 2));
		int endMonth = Integer.parseInt(endDate.substring(0, 2));
		int startDay = Integer.parseInt(startDate.substring(3, 5));
		int endDay = Integer.parseInt(endDate.substring(3, 5));

		if (startYear > endYear)
		{
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Please check the input year');");
			out.println("window.history.go(-1);");
			out.println("</script>");
			return;
		}
		if (startYear == endYear && startMonth > endMonth)
		{
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Please check the input month');");
			out.println("window.history.go(-1);");
			out.println("</script>");
			return;
		}
		if (startYear == endYear && startMonth == endMonth && startDay > endDay)
		{
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Please check the input day');");
			out.println("window.history.go(-1);");
			out.println("</script>");
			return;
		}

		dataBase.editTask(projectName, taskName, startDate, endDate);
		calculate(projectName, taskName);

		getAllTask(request, response);

	}

	// private void editProject(HttpServletRequest request, HttpServletResponse
	// response) throws Exception
	// {
	// String projectName = request.getParameter("projectName");
	// String newProjectName = request.getParameter("newProjectName");
	// dataBase.editProject(projectName, newProjectName);
	//
	// }

	private void deleteProject(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		String token = request.getParameter("token");
		String projectName = request.getParameter("projectName" + token);
		String email = request.getParameter("email");
		dataBase.deleteProjectInvolve(projectName);
		List<Project> projects = new ArrayList<>();
		User user = new User(email, null);
		Project project = new Project(email);
		projects = dataBase.checkProject(project);
		User us = dataBase.login(user);
		request.setAttribute("user", us);
		request.setAttribute("projects", projects);
		request.setAttribute("email", email);

		request.getRequestDispatcher("/CreateProject.jsp").forward(request, response);

	}

	private void addTask(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		PrintWriter out = response.getWriter();
		String taskName = trimSpace(request.getParameter("taskName"));
		String startDate = trimSpace(request.getParameter("startDate"));
		String endDate = trimSpace(request.getParameter("endDate"));
		String projectName = request.getParameter("projectName");
		
		Task task = new Task(projectName, taskName, startDate, endDate, "0");

		if (dataBase.checkDuplicate(projectName, taskName))
		{

			out.println("<script type=\"text/javascript\">");
			out.println("alert('Taskname already used');");
			out.println("window.history.go(-1);");
			out.println("</script>");

			return;
		}
		int startYear = Integer.parseInt(startDate.substring(6, 10));
		int endYear = Integer.parseInt(endDate.substring(6, 10));
		int startMonth = Integer.parseInt(startDate.substring(0, 2));
		int endMonth = Integer.parseInt(endDate.substring(0, 2));
		int startDay = Integer.parseInt(startDate.substring(3, 5));
		int endDay = Integer.parseInt(endDate.substring(3, 5));

		if (startYear > endYear)
		{
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Please check the input year');");
			out.println("window.history.go(-1);");
			out.println("</script>");
			return;
		}
		if (startYear == endYear && startMonth > endMonth)
		{
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Please check the input month');");
			out.println("window.history.go(-1);");
			out.println("</script>");
			return;
		}
		if (startYear == endYear && startMonth == endMonth && startDay > endDay)
		{
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Please check the input day');");
			out.println("window.history.go(-1);");
			out.println("</script>");
			return;
		}
		dataBase.addTask(task);
		calculate(projectName, taskName);
		getAllTask(request, response);

	}

	private void addMember(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		PrintWriter out = response.getWriter();
		List<String> emails = new ArrayList<>();
		String token = request.getParameter("token");
		String projectName = request.getParameter("projectName");
		 String email = request.getParameter("email");

		int i = 1;

		while (request.getParameter("Email" + i) != null)
		{
			String tempEmail = request.getParameter("Email" + i);
			tempEmail = trimSpace(tempEmail);

			if (!dataBase.checkUserExist(tempEmail))
			{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('" + tempEmail + "  is not exist');");
				out.println("window.history.go(-1);");
				out.println("</script>");
				return;
			}
			if (dataBase.checkUserInProject(tempEmail, projectName))
			{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Your are already in the project');");
				out.println("window.history.go(-1);");
				out.println("</script>");
				return;
			}
			emails.add(tempEmail);
			i++;
		}

		for (int j = 0; j < emails.size(); j++)
		{
			Project tempProject = new Project(projectName, false, emails.get(j));
			dataBase.addMember(tempProject);
		}
		if (token.equals("1"))
		{
			List<ProjectInvolve> membersInvolve = new ArrayList<ProjectInvolve>();
			membersInvolve = dataBase.listMembersInProject(projectName);
			request.setAttribute("membersInvolve", membersInvolve);
			request.setAttribute("userEmail", email);
			request.getRequestDispatcher("/edit_project.jsp").forward(request, response);

		}
		else
		{
			turnToDashboard(request, response);
		}

	}

	private void addProject(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		PrintWriter out = response.getWriter();
		String projectName = trimSpace(request.getParameter("projectName"));
		String email = request.getParameter("email");
		// if (true)
		// {
		// response.getWriter().println(email);
		// return;
		// }
		if (dataBase.checkProjectExist(projectName))
		{
			out.println("<script type=\"text/javascript\">");
			out.println("alert('" + projectName + "  is already used');");
			out.println("window.history.go(-1);");
			out.println("</script>");
			return;
		}
		dataBase.createProject(projectName);
		dataBase.addProject(projectName, email);
		request.setAttribute("email", email);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/InviteMembers.jsp");
		dispatcher.forward(request, response);

	}

	private void createAccount(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		PrintWriter out = response.getWriter();
		String firstName = trimSpace(request.getParameter("firstName"));
		String lastName = trimSpace(request.getParameter("lastName"));
		String email = trimSpace(request.getParameter("email"));
		String password = trimSpace(request.getParameter("password"));
		if (dataBase.checkUserExist(email))
		{
			out.println("<script type=\"text/javascript\">");
			out.println("alert('" + email + "  is already used');");
			out.println("window.history.go(-1);");
			out.println("</script>");
			return;
		}
		User user = new User(lastName, firstName, email, password);
		dataBase.createAccount(user);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/LogInPage.jsp");
		dispatcher.forward(request, response);
	}

	private void login(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		List<Project> projects = new ArrayList<>();
		PrintWriter out = response.getWriter();
		String email = trimSpace(request.getParameter("email"));
		if (!dataBase.checkUserExist(email))
		{
			out.println("<script type=\"text/javascript\">");
			out.println("alert('" + email + "  is not exist');");
			out.println("window.history.go(-1);");
			out.println("</script>");
			return;
		}
		String password = trimSpace(request.getParameter("password"));
		User user = new User(email, password);
		Project project = new Project(email);
		projects = dataBase.checkProject(project);
		User us = dataBase.login(user);

		if (!us.getPassword().equals(password))
		{
			out.println("<script type=\"text/javascript\">");
			out.println("alert('password is incorrect');");
			out.println("window.history.go(-1);");
			out.println("</script>");
			return;
		}

		request.setAttribute("user", us);
		request.setAttribute("projects", projects);
		request.setAttribute("email", email);
		request.getRequestDispatcher("/CreateProject.jsp").forward(request, response);
		return;

	}

	private void turnToProject(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		String email = trimSpace(request.getParameter("email"));
		List<Project> projects = new ArrayList<>();

		User user = new User(email, null);
		Project project = new Project(email);
		projects = dataBase.checkProject(project);
		User us = dataBase.login(user);
		request.setAttribute("user", us);
		request.setAttribute("projects", projects);
		request.setAttribute("email", email);
		request.getRequestDispatcher("/CreateProject.jsp").forward(request, response);
		return;

	}

	private void turnToDashboard(HttpServletRequest request, HttpServletResponse response) throws Exception
	{

		String email = request.getParameter("email");
		String projectName = request.getParameter("projectName");
//		if (true)
//		{
//			response.getWriter().println(email);
//			response.getWriter().println(projectName);
//			return;
//		}

		List<Task> tasks = new ArrayList<>();
		Task task = new Task(projectName);
		tasks = dataBase.listTask(task);
		String projectProgress = dataBase.getProjectProgress(projectName);
		request.setAttribute("tasks", tasks);
		request.setAttribute("projectProgress", projectProgress);

		boolean admin = dataBase.checkAdmin(projectName, email);
		if (admin == true)
		{
			request.setAttribute("projectName", projectName);
			request.setAttribute("userEmail", email);
			request.getRequestDispatcher("/Dashboard.jsp").forward(request, response);
		}
		listTaskInvolve(request, response);

	}

	private void calculate(String projectName, String taskName) throws Exception
	{
		List<TaskInvolve> allTaskInvolveProgress = new ArrayList<>();
		List<Task> allTaskProgress = new ArrayList<>();
		allTaskInvolveProgress = dataBase.listMembersInTask(projectName, taskName);
		int projectProgress = 0;
		int taskProgress = 0;
		int sum = 0;
		int sum2 = 0;
		for (int i = 0; i < allTaskInvolveProgress.size(); i++)
		{
			sum = sum + Integer.parseInt(allTaskInvolveProgress.get(i).getPercentage());
		}
		if (allTaskInvolveProgress.size() != 0)
		{
			taskProgress = (sum) / allTaskInvolveProgress.size();
		}
		dataBase.editTaskProgress(taskProgress, projectName, taskName);

		// for project
		Task task = new Task(projectName);
		allTaskProgress = dataBase.listTask(task);

		for (int i = 0; i < allTaskProgress.size(); i++)
		{
			sum2 = sum2 + Integer.parseInt(allTaskProgress.get(i).getTaskProgress());
		}
		if (allTaskProgress.size() != 0)
		{
			projectProgress = (sum2) / allTaskProgress.size();
		}

		dataBase.editProjectProgress(projectProgress, projectName);
	}

	private static String trimSpace(String temp)
	{
		temp = temp.replaceAll("\\s", "").trim();
		return temp;
	}

}
