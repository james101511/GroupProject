package DataBase;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

//import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.sql.DataSource;

//import com.sun.xml.internal.ws.Closeable;

public class DataBase
{
	private DataSource dataSource;

	public DataBase(DataSource dataSource)
	{
		this.dataSource = dataSource;
	}

	/**
	 * the function to create account in database
	 * 
	 * @param theuser
	 * @throws Exception
	 */
	public void createAccount(User theuser) throws Exception

	{
		Connection myConn = null;
		PreparedStatement myStmt = null;
		try
		{
			myConn = dataSource.getConnection();
			String sql = "insert into user" + "(user_firstname,user_lastname,user_email,user_password)"
					+ "values(?,?,?,?)";
			myStmt = myConn.prepareStatement(sql);
			myStmt.setString(1, theuser.getFirstName());
			myStmt.setString(2, theuser.getLastName());
			myStmt.setString(3, theuser.getEmail());
			myStmt.setString(4, theuser.getPassword());
			myStmt.execute();
		}

		finally
		{
			// clean up JDBC objects
			Close(myConn, myStmt, null);
		}
	}

	/**
	 * the login function use to check the data in database to verify the user
	 * 
	 * @param theuser
	 * @return
	 * @throws Exception
	 */
	public User login(User theuser) throws Exception
	{
		Connection myConn = null;
		PreparedStatement myStmt = null;

		try
		{
			myConn = dataSource.getConnection();
			String sql = "select * from user where user_email = ? ";
			myStmt = myConn.prepareStatement(sql);
			myStmt.setString(1, theuser.getEmail());
			ResultSet set = myStmt.executeQuery();
			while (set.next())
			{
				theuser.setPassword(set.getString("user_password"));
				theuser.setFirstName(set.getString("user_firstname"));
				theuser.setLastName(set.getString("user_lastname"));
				return theuser;
			}
			return null;
		}
		finally
		{
			Close(myConn, myStmt, null);
		}
	}

	/**
	 * create new project into the database
	 * 
	 * @param projectName
	 * @throws SQLException
	 */
	public void createProject(String projectName) throws SQLException
	{
		Connection myConn = null;
		PreparedStatement myStmt = null;
		try
		{
			myConn = dataSource.getConnection();
			String sql = "insert into project" + "(project_name,project_progress)" + "values(?,?)";
			myStmt = myConn.prepareStatement(sql);

			myStmt.setString(1, projectName);
			myStmt.setBoolean(2, false);
			myStmt.execute();
		}
		finally
		{
			Close(myConn, myStmt, null);
		}

	}

	/**
	 * add new project into the database
	 * 
	 * @param projectName
	 * @param email
	 * @throws Exception
	 */
	public void addProject(String projectName, String email) throws Exception
	{
		Connection myConn = null;
		PreparedStatement myStmt = null;
		try
		{
			myConn = dataSource.getConnection();
			String sql = "insert into project_involve" + "(project_name,user_email,project_admin)" + "values(?,?,?)";
			myStmt = myConn.prepareStatement(sql);
			myStmt.setString(1, projectName);
			myStmt.setString(2, email);
			myStmt.setBoolean(3, true);
			myStmt.execute();
		}
		finally
		{
			Close(myConn, myStmt, null);
		}

	}

	/**
	 * get all project and list it for the specific user
	 * 
	 * @param project
	 * @return
	 * @throws Exception
	 */
	public List<Project> checkProject(Project project) throws Exception
	{
		Connection myConn = null;
		PreparedStatement myStmt = null;
		List<Project> projects = new ArrayList<>();
		try
		{
			myConn = dataSource.getConnection();
			String sql = "select * from project_involve where user_email = ? ";
			myStmt = myConn.prepareStatement(sql);
			myStmt.setString(1, project.getUserEmail());
			ResultSet set = myStmt.executeQuery();
			while (set.next())
			{
				String projectName = set.getString("project_name");
				boolean admin = true;
				if (set.getString("project_admin").equals("0"))
				{
					admin = false;
				}
				Project tempProject = new Project(projectName, admin, project.getUserEmail());
				projects.add(tempProject);

			}
			return projects;
		}
		finally
		{
			Close(myConn, myStmt, null);
		}
	}

	/**
	 * add new member to the project
	 * 
	 * @param project
	 * @throws SQLException
	 */
	public void addMember(Project project) throws SQLException
	{
		Connection myConn = null;
		PreparedStatement myStmt = null;
		try
		{
			myConn = dataSource.getConnection();

			String sql = "insert into project_involve" + "(project_name,user_email,project_admin)" + "values(?,?,?)";
			myStmt = myConn.prepareStatement(sql);

			myStmt.setString(1, project.getProjectName());
			myStmt.setString(2, project.getUserEmail());
			myStmt.setBoolean(3, false);

			myStmt.execute();
		}
		finally
		{

			Close(myConn, myStmt, null);
		}

	}

	/**
	 * check user is exist or not
	 * 
	 * @param email
	 * @return
	 * @throws SQLException
	 */
	public boolean checkUserExist(String email) throws SQLException
	{
		Connection myConn = null;
		PreparedStatement myStmt = null;
		boolean userExist = false;
		try
		{
			myConn = dataSource.getConnection();
			String sql = "select 1 from user where user_email=?";
			myStmt = myConn.prepareStatement(sql);
			myStmt.setString(1, email);
			ResultSet set = myStmt.executeQuery();
			while (set.next())
			{
				userExist = true;
			}
			return userExist;
		}
		finally
		{
			Close(myConn, myStmt, null);
		}

	}

	/**
	 * check the project is exist or not
	 * 
	 * @param projectName
	 * @return
	 * @throws SQLException
	 */
	public boolean checkProjectExist(String projectName) throws SQLException
	{
		Connection myConn = null;
		PreparedStatement myStmt = null;
		boolean projectExist = false;

		try
		{
			myConn = dataSource.getConnection();
			String sql = "select 1 from project where project_name=?";
			myStmt = myConn.prepareStatement(sql);
			myStmt.setString(1, projectName);
			ResultSet set = myStmt.executeQuery();
			while (set.next())
			{

				projectExist = true;

			}
			return projectExist;
		}
		finally
		{
			Close(myConn, myStmt, null);
		}
	}

	/**
	 * get all tasks in a specific project and list it
	 * 
	 * @param task
	 * @return
	 * @throws SQLException
	 */
	public List<Task> listTask(Task task) throws SQLException
	{
		Connection myConn = null;
		PreparedStatement myStmt = null;
		List<Task> tasks = new ArrayList<>();
		try
		{
			myConn = dataSource.getConnection();
			String sql = "select * from task where project_name = ? ";
			myStmt = myConn.prepareStatement(sql);
			myStmt.setString(1, task.getProjectName());
			ResultSet set = myStmt.executeQuery();
			while (set.next())
			{
				String taskName = set.getString("task_name");
				String startDate = set.getString("start_date");
				String endDate = set.getString("end_date");
				String taskProgress = set.getString("task_progress");
				Task task2 = new Task(task.getProjectName(), taskName, startDate, endDate, taskProgress);
				tasks.add(task2);
			}
			return tasks;
		}
		finally
		{
			// clean up JDBC objects
			Close(myConn, myStmt, null);
		}
	}

	/**
	 * get the detail of the specific task
	 * 
	 * @param taskInvolve
	 * @return
	 * @throws SQLException
	 */
	public List<TaskInvolve> checkTaskDetail(TaskInvolve taskInvolve) throws SQLException
	{
		Connection myConn = null;
		PreparedStatement myStmt = null;
		List<TaskInvolve> taskInvolves = new ArrayList<>();
		try
		{
			myConn = dataSource.getConnection();
			String sql = "select * from task_involve where task_name = ? and project_name=? ";
			myStmt = myConn.prepareStatement(sql);
			myStmt.setString(1, taskInvolve.getTaskName());
			myStmt.setString(2, taskInvolve.getProjectName());
			ResultSet set = myStmt.executeQuery();
			while (set.next())
			{
				String userEmail = set.getString("user_email");
				String progress = set.getString("progress");
				String percentage = set.getString("percentage");
				TaskInvolve taskInvolve2 = new TaskInvolve(taskInvolve.getTaskName(), userEmail,
						taskInvolve.getProjectName(), progress, percentage);

				taskInvolves.add(taskInvolve2);
			}
			return taskInvolves;
		}
		finally
		{
			Close(myConn, myStmt, null);
		}
	}

	/**
	 * check the user is a manager for specific project or not
	 * 
	 * @param projectName
	 * @param email
	 * @return
	 * @throws SQLException
	 */
	public boolean checkAdmin(String projectName, String email) throws SQLException
	{
		Connection myConn = null;
		PreparedStatement myStmt = null;
		boolean admin = true;
		try
		{
			myConn = dataSource.getConnection();
			String sql = "select * from project_involve where project_name = ? and user_email = ? ";
			myStmt = myConn.prepareStatement(sql);
			myStmt.setString(1, projectName);
			myStmt.setString(2, email);
			ResultSet set = myStmt.executeQuery();
			while (set.next())
			{

				String admin2 = set.getString("project_admin");
				if (admin2.equals("0"))
				{
					admin = false;
				}

			}
			return admin;
		}
		finally
		{
			Close(myConn, myStmt, null);
		}

	}

	/**
	 * add task into the project
	 * 
	 * @param task
	 * @throws SQLException
	 */
	public void addTask(Task task) throws SQLException
	{
		Connection myConn = null;
		PreparedStatement myStmt = null;
		try
		{
			myConn = dataSource.getConnection();
			String sql = "insert into task" + "(task_name,project_name,start_date,end_date,task_progress)"
					+ "values(?,?,?,?,?)";
			myStmt = myConn.prepareStatement(sql);
			myStmt.setString(1, task.getTaskName());
			myStmt.setString(2, task.getProjectName());
			myStmt.setString(3, task.getStartDate());
			myStmt.setString(4, task.getEndDate());
			myStmt.setString(5, "0");
			myStmt.execute();
		}
		finally
		{
			// clean up JDBC objects
			Close(myConn, myStmt, null);
		}

	}

	/**
	 * make sure there is no duplicate in the task table
	 * 
	 * @param projectName
	 * @param taskName
	 * @return
	 * @throws SQLException
	 */
	public boolean checkDuplicate(String projectName, String taskName) throws SQLException
	{
		Connection myConn = null;
		PreparedStatement myStmt = null;
		boolean temp = false;
		try
		{
			myConn = dataSource.getConnection();
			String sql = "select * from task where project_name=?";
			myStmt = myConn.prepareStatement(sql);
			myStmt.setString(1, projectName);
			ResultSet set = myStmt.executeQuery();
			while (set.next())
			{
				String oldtaskName = set.getString("task_name");
				if (oldtaskName.equals(taskName))
					temp = true;
			}
			return temp;
		}
		finally
		{
			Close(myConn, myStmt, null);
		}

	}

	/**
	 * delete the specific task
	 * 
	 * @param projectName
	 * @param taskName
	 * @throws SQLException
	 */
	public void deleteTask(String projectName, String taskName) throws SQLException
	{
		Connection myConn = null;
		PreparedStatement myStmt = null;
		try
		{
			myConn = dataSource.getConnection();
			String sql = "DELETE FROM task WHERE project_name = ? and task_name =?";
			myStmt = myConn.prepareStatement(sql);
			myStmt.setString(1, projectName);
			myStmt.setString(2, taskName);
			myStmt.execute();
		}
		finally
		{

			Close(myConn, myStmt, null);
		}

	}

	/**
	 * edit the task's detail in the database
	 * 
	 * @param projectName
	 * @param taskName
	 * @param startDate
	 * @param endDate
	 * @throws SQLException
	 */
	public void editTask(String projectName, String taskName, String startDate, String endDate) throws SQLException
	{
		Connection myConn = null;
		PreparedStatement myStmt = null;
		try
		{
			myConn = dataSource.getConnection();
			String sql = "UPDATE task SET start_date= ?,end_date= ? WHERE project_name = ? and task_name= ?;";
			myStmt = myConn.prepareStatement(sql);
			myStmt.setString(1, startDate);
			myStmt.setString(2, endDate);
			myStmt.setString(3, projectName);
			myStmt.setString(4, taskName);
			myStmt.execute();
		}
		finally
		{
			Close(myConn, myStmt, null);
		}

	}

	/**
	 * edit the project detail
	 * 
	 * @param projectName
	 * @param newProjectName
	 * @throws SQLException
	 */
	public void editProject(String projectName, String newProjectName) throws SQLException
	{
		Connection myConn = null;
		PreparedStatement myStmt = null;
		try
		{
			myConn = dataSource.getConnection();
			String sql = "UPDATE project SET project_name = ? WHERE project_name = ?;";
			myStmt = myConn.prepareStatement(sql);
			myStmt.setString(1, newProjectName);
			myStmt.setString(2, projectName);
			myStmt.execute();
		}
		finally
		{
			Close(myConn, myStmt, null);
		}
	}

	/**
	 * list the task for the specific user
	 * 
	 * @param projectName
	 * @param email
	 * @return taskNames
	 * @throws SQLException
	 */
	public List<String> listTaskInvolve(String projectName, String email) throws SQLException
	{
		Connection myConn = null;
		PreparedStatement myStmt = null;
		List<String> taskNames = new ArrayList<>();
		try
		{
			myConn = dataSource.getConnection();
			String sql = "select * from task_involve where user_email = ? and project_name=?";
			myStmt = myConn.prepareStatement(sql);
			myStmt.setString(1, email);
			myStmt.setString(2, projectName);
			ResultSet set = myStmt.executeQuery();
			while (set.next())
			{
				String taskName = set.getString("task_name");
				taskNames.add(taskName);
			}
			return taskNames;
		}
		finally
		{
			Close(myConn, myStmt, null);
		}

	}

	/**
	 * add a member to the task
	 * 
	 * @param taskInvolve
	 * @throws SQLException
	 */
	public void addTaskMember(TaskInvolve taskInvolve) throws SQLException
	{
		Connection myConn = null;
		PreparedStatement myStmt = null;
		try
		{
			myConn = dataSource.getConnection();
			String sql = "insert into task_involve" + "(user_email,task_name,project_name,progress,percentage)"
					+ "values(?,?,?,?,?)";
			myStmt = myConn.prepareStatement(sql);

			myStmt.setString(1, taskInvolve.getUserEmail());
			myStmt.setString(2, taskInvolve.getTaskName());
			myStmt.setString(3, taskInvolve.getProjectName());
			myStmt.setString(4, "0");
			myStmt.setString(5, "0");
			myStmt.execute();
		}
		finally
		{
			Close(myConn, myStmt, null);
		}
	}

	/**
	 * delete the member in the specific task
	 * 
	 * @param taskInvolve
	 * @throws SQLException
	 */
	public void deleteTaskMember(TaskInvolve taskInvolve) throws SQLException
	{
		Connection myConn = null;
		PreparedStatement myStmt = null;
		try
		{
			myConn = dataSource.getConnection();
			String sql = "DELETE FROM task_involve WHERE project_name = ? and task_name =? and user_email=?";
			myStmt = myConn.prepareStatement(sql);
			myStmt.setString(1, taskInvolve.getProjectName());
			myStmt.setString(2, taskInvolve.getTaskName());
			myStmt.setString(3, taskInvolve.getUserEmail());
			myStmt.execute();
		}
		finally
		{
			Close(myConn, myStmt, null);
		}

	}

	/**
	 * get all members in the specific task
	 * 
	 * @param projectName
	 * @param taskName
	 * @return members;
	 * @throws SQLException
	 */
	public List<TaskInvolve> listMembersInTask(String projectName, String taskName) throws SQLException
	{
		Connection myConn = null;
		PreparedStatement myStmt = null;
		List<TaskInvolve> membersInvolve = new ArrayList<>();
		try
		{
			myConn = dataSource.getConnection();
			String sql = "select * from task_involve where task_name = ? and project_name=?";
			myStmt = myConn.prepareStatement(sql);
			myStmt.setString(1, taskName);
			myStmt.setString(2, projectName);
			ResultSet set = myStmt.executeQuery();
			while (set.next())
			{
				String userEmail = set.getString("user_email");
				String progress = set.getString("progress");
				String percentage = set.getString("percentage");
				TaskInvolve taskInvolve = new TaskInvolve(taskName, userEmail, projectName, progress, percentage);
				membersInvolve.add(taskInvolve);
			}
			return membersInvolve;
		}
		finally
		{
			// clean up JDBC objects
			Close(myConn, myStmt, null);
		}

	}

	/**
	 * check member is in the project or not
	 * 
	 * @param userEmail
	 * @param projectName
	 * @return boolean
	 * @throws SQLException
	 */
	public boolean checkMemberInProject(String userEmail, String projectName) throws SQLException
	{
		Connection myConn = null;
		PreparedStatement myStmt = null;
		boolean memberExist = false;
		try
		{
			myConn = dataSource.getConnection();
			String sql = "select * from project_involve where user_email=? and project_name=?";
			myStmt = myConn.prepareStatement(sql);
			myStmt.setString(1, userEmail);
			myStmt.setString(2, projectName);
			ResultSet set = myStmt.executeQuery();
			while (set.next())
			{
				memberExist = true;
			}
			return memberExist;
		}
		finally
		{
			Close(myConn, myStmt, null);
		}

	}

	/**
	 * check user is in the project or not
	 * 
	 * @param tempEmail
	 * @param projectName
	 * @return boolean
	 * @throws SQLException
	 */
	public boolean checkUserInProject(String tempEmail, String projectName) throws SQLException
	{
		Connection myConn = null;
		PreparedStatement myStmt = null;
		boolean memberExist = false;
		try
		{
			myConn = dataSource.getConnection();
			String sql = "select * from project_involve where user_email=? and project_name=?";
			myStmt = myConn.prepareStatement(sql);
			myStmt.setString(1, tempEmail);
			myStmt.setString(2, projectName);
			ResultSet set = myStmt.executeQuery();
			while (set.next())
			{
				memberExist = true;
			}
			return memberExist;
		}
		finally
		{
			Close(myConn, myStmt, null);
		}
	}

	/**
	 * check user is in the task or not
	 * 
	 * @param userEmail
	 * @param taskName
	 * @param projectName
	 * @return boolean
	 * @throws SQLException
	 */
	public boolean checkUserInTask(String userEmail, String taskName, String projectName) throws SQLException
	{
		Connection myConn = null;
		PreparedStatement myStmt = null;
		boolean memberExist = false;
		try
		{
			myConn = dataSource.getConnection();
			String sql = "select * from task_involve where user_email=? and project_name=? and task_name=?";
			myStmt = myConn.prepareStatement(sql);
			myStmt.setString(1, userEmail);
			myStmt.setString(2, projectName);
			myStmt.setString(3, taskName);
			ResultSet set = myStmt.executeQuery();
			while (set.next())
			{
				memberExist = true;
			}
			return memberExist;
		}
		finally
		{
			Close(myConn, myStmt, null);
		}
	}

	/**
	 * edit the task progress
	 * 
	 * @param taskInvolve
	 * @throws SQLException
	 */
	public void editProgress(TaskInvolve taskInvolve) throws SQLException
	{
		Connection myConn = null;
		PreparedStatement myStmt = null;
		try
		{
			myConn = dataSource.getConnection();
			String sql = "UPDATE task_involve SET progress= ?,percentage= ? WHERE user_email=? and project_name = ? and task_name=?";
			myStmt = myConn.prepareStatement(sql);
			myStmt.setString(1, taskInvolve.getProgress());
			myStmt.setString(2, taskInvolve.getPercentage());
			myStmt.setString(3, taskInvolve.getUserEmail());
			myStmt.setString(4, taskInvolve.getProjectName());
			myStmt.setString(5, taskInvolve.getTaskName());
			myStmt.execute();
		}
		finally
		{
			Close(myConn, myStmt, null);
		}

	}

	/**
	 * delete the task
	 * 
	 * @param taskName
	 * @param projectName
	 * @throws SQLException
	 */
	public void deleteTaskInvolve(String taskName, String projectName) throws SQLException
	{
		Connection myConn = null;
		PreparedStatement myStmt = null;
		try
		{
			myConn = dataSource.getConnection();

			String sql = "DELETE FROM task_involve WHERE project_Name = ? and task_Name =?";
			myStmt = myConn.prepareStatement(sql);
			myStmt.setString(1, projectName);
			myStmt.setString(2, taskName);
			myStmt.execute();
		}
		finally
		{
			Close(myConn, myStmt, null);
		}

	}

	/**
	 * list all members in project
	 * 
	 * @param projectName
	 * @return all members in specific project
	 * @throws SQLException
	 */
	public List<ProjectInvolve> listMembersInProject(String projectName) throws SQLException
	{
		Connection myConn = null;
		PreparedStatement myStmt = null;
		List<ProjectInvolve> membersInvolve = new ArrayList<>();

		try
		{
			myConn = dataSource.getConnection();
			String sql = "select * from project_involve where project_name=?";
			myStmt = myConn.prepareStatement(sql);
			myStmt.setString(1, projectName);
			ResultSet set = myStmt.executeQuery();
			while (set.next())
			{
				boolean adminTemp = false;
				String userEmail = set.getString("user_email");
				String admin = set.getString("project_admin");
				if (admin.equals("1"))
				{
					adminTemp = true;
				}
				ProjectInvolve temp = new ProjectInvolve(projectName, adminTemp, userEmail);
				membersInvolve.add(temp);
			}
			return membersInvolve;
		}
		finally
		{
			Close(myConn, myStmt, null);
		}

	}

	/**
	 * delete the project
	 * 
	 * @param projectName
	 * @throws SQLException
	 */
	public void deleteProjectInvolve(String projectName) throws SQLException
	{
		Connection myConn = null;
		PreparedStatement myStmt = null;
		String[] sqls = { "DELETE FROM project_involve WHERE project_name = ?",
				"DELETE FROM project WHERE project_name = ?", "DELETE FROM task_involve WHERE project_name = ?",
				"DELETE FROM task WHERE project_name = ?" };
		for (int i = 0; i < 4; i++)
		{
			myConn = dataSource.getConnection();
			try
			{

				myStmt = myConn.prepareStatement(sqls[i]);
				myStmt.setString(1, projectName);
				myStmt.execute();

			}
			finally
			{
				Close(myConn, myStmt, null);
			}
		}

	}

	/**rename the project
	 * @param newProjectName
	 * @param projectName
	 * @throws SQLException
	 */
	public void rename(String newProjectName, String projectName) throws SQLException
	{
		Connection myConn = null;
		PreparedStatement myStmt = null;
		String[] sqls = { "UPDATE task_involve SET project_name = ? where project_name=?",
				"UPDATE task SET project_name = ? where project_name=?",
				"UPDATE project SET project_name = ? where project_name=?" };
		for (int i = 0; i < 3; i++)
		{
			myConn = dataSource.getConnection();
			try
			{
				myStmt = myConn.prepareStatement(sqls[i]);
				myStmt.setString(1, newProjectName);
				myStmt.setString(2, projectName);
				myStmt.execute();
			}
			finally
			{
				Close(myConn, myStmt, null);
			}
		}

	}

	/**delete member
	 * @param projectName
	 * @param email
	 * @throws SQLException
	 */
	public void deleteMamber(String projectName, String email) throws SQLException
	{
		Connection myConn = null;
		PreparedStatement myStmt = null;
		try
		{
			myConn = dataSource.getConnection();
			String sql = "DELETE FROM project_involve WHERE project_Name = ? and user_email =?";
			myStmt = myConn.prepareStatement(sql);
			myStmt.setString(1, projectName);
			myStmt.setString(2, email);
			myStmt.execute();
		}
		finally
		{
			Close(myConn, myStmt, null);
		}
	}

	/**get the task's progress
	 * @param taskName
	 * @param projectName
	 * @return a number with type string
	 * @throws SQLException
	 */
	public String getTaskProgress(String taskName, String projectName) throws SQLException
	{
		Connection myConn = null;
		PreparedStatement myStmt = null;
		String taskProgress = null;
		try
		{
			myConn = dataSource.getConnection();
			String sql = "select * from task where task_name=? and project_name=?";
			myStmt = myConn.prepareStatement(sql);
			myStmt.setString(1, taskName);
			myStmt.setString(2, projectName);
			ResultSet set = myStmt.executeQuery();
			while (set.next())
			{
				taskProgress = set.getString("task_progress");
			}
			return taskProgress;
		}
		finally
		{
			Close(myConn, myStmt, null);
		}
	}

	/**get the project progress
	 * @param projectName
	 * @return
	 * @throws SQLException
	 */
	public String getProjectProgress(String projectName) throws SQLException
	{
		Connection myConn = null;
		PreparedStatement myStmt = null;
		String projectProgress = null;
		try
		{
			myConn = dataSource.getConnection();
			String sql = "select * from project where project_name=?";
			myStmt = myConn.prepareStatement(sql);
			myStmt.setString(1, projectName);
			ResultSet set = myStmt.executeQuery();
			while (set.next())
			{
				projectProgress = set.getString("project_progress");
			}
			return projectProgress;
		}
		finally
		{
			Close(myConn, myStmt, null);
		}
	}

	/**edit the task progress
	 * @param taskProgress
	 * @param projectName
	 * @param taskName
	 * @throws SQLException
	 */
	public void editTaskProgress(int taskProgress, String projectName, String taskName) throws SQLException
	{
		Connection myConn = null;
		PreparedStatement myStmt = null;
		try
		{
			myConn = dataSource.getConnection();
			String sql = "UPDATE task SET task_progress= ? WHERE task_name=? and project_name=?";
			myStmt = myConn.prepareStatement(sql);
			myStmt.setString(1, String.valueOf(taskProgress));
			myStmt.setString(2, taskName);
			myStmt.setString(3, projectName);
			myStmt.execute();
		}
		finally
		{
			Close(myConn, myStmt, null);
		}

	}

	/**edit the project progress
	 * @param projectProgress
	 * @param projectName
	 * @throws SQLException
	 */
	public void editProjectProgress(int projectProgress, String projectName) throws SQLException
	{
		Connection myConn = null;
		PreparedStatement myStmt = null;
		try
		{
			myConn = dataSource.getConnection();
			String sql = "UPDATE project SET project_progress= ? WHERE project_name=?";
			myStmt = myConn.prepareStatement(sql);
			myStmt.setString(1, String.valueOf(projectProgress));
			myStmt.setString(2, projectName);
			myStmt.execute();
		}
		finally
		{
			Close(myConn, myStmt, null);
		}

	}

	private void Close(Connection myConn, Statement myStmt, ResultSet myRs)
	{
		try
		{
			if (myRs != null)
			{
				myRs.close();
			}

			if (myStmt != null)
			{
				myStmt.close();
			}
			if (myConn != null)
			{
				myConn.close();
			}

		}
		catch (Exception exc)
		{
			exc.printStackTrace();
		}
	}

}
