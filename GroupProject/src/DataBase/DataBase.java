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

	public List<User> getUsers() throws Exception
	{
		List<User> users = new ArrayList<>();

		Connection myConn = null;
		Statement myStmt = null;
		ResultSet myRs = null;

		try
		{
			// get a connection
			myConn = dataSource.getConnection();
			// create sql statement
			String sql = "select *from Users order by Lastname";
			myStmt = myConn.createStatement();
			// execute query
			myRs = myStmt.executeQuery(sql);
			// process result set
			while (myRs.next())
			{
				// retrieve data from result set row
				int id = myRs.getInt("id");
				String firstName = myRs.getString("first_name");
				String lastName = myRs.getString("last_name");
				String email = myRs.getString("email");
				String password = myRs.getString("password");
				// create new student object
				User tempuser = new User(id, firstName, lastName, email, password);
				// add it to the list of students
				users.add(tempuser);

			}

			return users;
		}

		finally
		{
			// close JDBC objects
			Close(myConn, myStmt, myRs);
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
				myConn.close();// does't really close it, just puts back in connection pool
			}

		}
		catch (Exception exc)
		{
			exc.printStackTrace();
		}
	}

	public void addUser(User theuser) throws Exception
	{
		Connection myConn = null;
		PreparedStatement myStmt = null;
		try
		{
			// get db connection
			myConn = dataSource.getConnection();
			// create sql for insert
			String sql = "insert into Users" + "(FirstName,LastName,Email,Password)" + "values(?,?,?,?)";
			myStmt = myConn.prepareStatement(sql);
			// set the param values for the student
			myStmt.setString(1, theuser.getFirstName());
			myStmt.setString(2, theuser.getLastName());
			myStmt.setString(3, theuser.getEmail());
			myStmt.setString(4, theuser.getPassword());
			// execute sql insert
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
			// create sql for insert
			String sql = "select * from Users where Email = ? and  password= ? ";
			myStmt = myConn.prepareStatement(sql);
			// set the param values for the student
			myStmt.setString(1, theuser.getEmail());
			myStmt.setString(2, theuser.getPassword());
			ResultSet set = myStmt.executeQuery();
			// execute sql insert
			while (set.next())
			{
				theuser.setFirstName(set.getString("FirstName"));
				theuser.setLastName(set.getString("LastName"));
				return theuser;
			}
			return null;
		}
		finally
		{
			// clean up JDBC objects
			Close(myConn, myStmt, null);
		}
	}

	public void addProject(Project project) throws Exception
	{
		Connection myConn = null;
		PreparedStatement myStmt = null;
		try
		{
			// get db connection
			myConn = dataSource.getConnection();
			// create sql for insert
			String sql = "insert into Project" + "(ProjectName,SubTask,StartDate,EndDate)" + "values(?,?,?,?)";
			myStmt = myConn.prepareStatement(sql);
			// set the param values for the student
			myStmt.setString(1, project.getProjectName());
			myStmt.setString(2, project.getTask());
			myStmt.setString(3, project.getStartDate());
			myStmt.setString(4, project.getEndDate());
			// myStmt.setBoolean(5, true);
			// execute sql insert
			myStmt.execute();
		}
		finally
		{
			// clean up JDBC objects
			Close(myConn, myStmt, null);
		}

	}

	public void addManager(Involve involve) throws SQLException
	{
		Connection myConn = null;
		PreparedStatement myStmt = null;
		try
		{
			// get db connection
			myConn = dataSource.getConnection();
			// create sql for insert
			String sql = "insert into Involve" + "(ProjectName,Email,Admin)" + "values(?,?,?)";
			myStmt = myConn.prepareStatement(sql);
			// set the param values for the student
			myStmt.setString(1, involve.getProjectName());
			myStmt.setString(2, involve.getEmail());
			myStmt.setBoolean(3, true);
			// execute sql insert
			myStmt.execute();
		}
		finally
		{
			// clean up JDBC objects
			Close(myConn, myStmt, null);
		}

	}

	public List<Involve> CheckInvolve(Involve involve) throws Exception
	{
		Connection myConn = null;
		PreparedStatement myStmt = null;
		List<Involve> involves = new ArrayList<>();
		try
		{
			myConn = dataSource.getConnection();
			// create sql for insert
			String sql = "select * from Involve where Email = ? ";
			myStmt = myConn.prepareStatement(sql);
			// set the param values for the student
			myStmt.setString(1, involve.getEmail());
			ResultSet set = myStmt.executeQuery();
			// execute sql insert
			while (set.next())
			{
				String ProjectName = set.getString("ProjectName");
				String Email = set.getString("Email");
				Involve TempInvolve = new Involve(ProjectName, Email);

				involves.add(TempInvolve);
			}
			return involves;
		}
		finally
		{
			// clean up JDBC objects
			Close(myConn, myStmt, null);
		}
	}

	public void addMember(Involve involve) throws SQLException
	{
		Connection myConn = null;
		PreparedStatement myStmt = null;
		try
		{
			myConn = dataSource.getConnection();
			// create sql for insert
			String sql = "insert into Involve" + "(ProjectName,Email,Admin)" + "values(?,?,?)";
			myStmt = myConn.prepareStatement(sql);
			// set the param values for the student
			myStmt.setString(1, involve.getProjectName());
			myStmt.setString(2, involve.getEmail());
			myStmt.setBoolean(3, false);
			// execute sql insert
			myStmt.execute();
		}
		finally
		{
			// clean up JDBC objects
			Close(myConn, myStmt, null);
		}

	}

	public List<Involve> checkProject(Involve involve) throws SQLException
	{
	
		Connection myConn = null;
		PreparedStatement myStmt = null;
		List<Involve> involves = new ArrayList<>();
		try
		{
			myConn = dataSource.getConnection();
			// create sql for insert
			String sql = "select * from Involve where ProjectName = ? ";
			myStmt = myConn.prepareStatement(sql);
			// set the param values for the student
			myStmt.setString(1, involve.getProjectName());
			ResultSet set = myStmt.executeQuery();
			// execute sql insert
			while (set.next())
			{
				String ProjectName = set.getString("ProjectName");
				String Email = set.getString("Email");
				Involve TempInvolve = new Involve(ProjectName, Email);

				involves.add(TempInvolve);
			}
			return involves;
		}
		finally
		{
			// clean up JDBC objects
			Close(myConn, myStmt, null);
		}
	}

}
