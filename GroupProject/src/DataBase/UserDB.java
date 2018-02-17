package DataBase;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.sql.DataSource;

import com.sun.xml.internal.ws.Closeable;

public class UserDB
{
	private DataSource dataSource;

	public UserDB(DataSource dataSource)
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
}
