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

	// public List<User> getUsers() throws Exception
	// {
	// List<User> users = new ArrayList<>();
	//
	// Connection myConn = null;
	// Statement myStmt = null;
	// ResultSet myRs = null;
	//
	// try
	// {
	// // get a connection
	// myConn = dataSource.getConnection();
	// // create sql statement
	// String sql = "select *from Users order by Lastname";
	// myStmt = myConn.createStatement();
	// // execute query
	// myRs = myStmt.executeQuery(sql);
	// // process result set
	// while (myRs.next())
	// {
	// // retrieve data from result set row
	// int id = myRs.getInt("id");
	// String firstName = myRs.getString("first_name");
	// String lastName = myRs.getString("last_name");
	// String email = myRs.getString("email");
	// String password = myRs.getString("password");
	// // create new student object
	// User tempuser = new User(id, firstName, lastName, email, password);
	// // add it to the list of students
	// users.add(tempuser);
	//
	// }
	//
	// return users;
	// }
	//
	// finally
	// {
	// // close JDBC objects
	// Close(myConn, myStmt, myRs);
	// }
	//
	// }

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
				String TaskName = set.getString("task_name");
				String StartDate = set.getString("start_date");
				String EndDate = set.getString("end_date");
				Task task2 = new Task(task.getProjectName(), TaskName, StartDate, EndDate);
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

	public void addTask(Task task) throws SQLException
	{
		Connection myConn = null;
		PreparedStatement myStmt = null;
		try
		{
			myConn = dataSource.getConnection();
			String sql = "insert into task" + "(task_name,project_name,start_date,end_date)" + "values(?,?,?,?)";
			myStmt = myConn.prepareStatement(sql);
			myStmt.setString(1, task.getTaskName());
			myStmt.setString(2, task.getProjectName());
			myStmt.setString(3, task.getStartDate());
			myStmt.setString(4, task.getEndDate());
			myStmt.execute();
		}
		finally
		{
			// clean up JDBC objects
			Close(myConn, myStmt, null);
		}

	}

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

	public void editTask(String projectName, String taskName, String startDate, String endDate) throws SQLException
	{
		Connection myConn = null;
		PreparedStatement myStmt = null;
		try
		{
			myConn = dataSource.getConnection();
			String sql = "UPDATE task SET start_date= ?,end_date= ? WHERE project_name = ? and task_name=?;";
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

	public boolean checkMemberInTask(String userEmail, String projectName) throws SQLException
	{
		Connection myConn = null;
		PreparedStatement myStmt = null;
		boolean memberExist = false;

		try
		{
			myConn = dataSource.getConnection();
			String sql = "select 1 from project_involve where user_email=? and project_name=?";
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

	public void editProgress(TaskInvolve taskInvolve) throws SQLException
	{
		Connection myConn = null;
		PreparedStatement myStmt = null;
		try
		{
			myConn = dataSource.getConnection();
			String sql = "UPDATE task_involve SET progress= ?,percentage= ? WHERE user_email=? and project_name = ? and task_name=?;";
			myStmt = myConn.prepareStatement(sql);
			myStmt.setString(1, taskInvolve.getProgress());
			myStmt.setString(2, taskInvolve.getPercentage());
			myStmt.setString(3, taskInvolve.getUserEmail());
			myStmt.setString(4, taskInvolve.getProjectName());
			myStmt.setString(5, taskInvolve.getTaskName());
			// execute sql insert
			myStmt.execute();
		}
		finally
		{
			// clean up JDBC objects
			Close(myConn, myStmt, null);
		}

	}

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
