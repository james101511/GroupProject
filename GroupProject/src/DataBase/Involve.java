package DataBase;

import com.sun.org.apache.xpath.internal.operations.Bool;

public class Involve
{
	private String ProjectName;
	private String Email;
	private boolean Admin;

	public Involve(String input, Boolean isEmail)
	{

		if (isEmail)
			Email = input;
		else
			ProjectName = input;
	}

	public Involve(String projectName, String email)
	{

		ProjectName = projectName;
		Email = email;
	}

	public Involve(String projectName, String email, boolean admin)
	{
		ProjectName = projectName;
		Email = email;
		Admin=admin;
	}

	public String getProjectName()
	{
		return ProjectName;
	}

	public void setProjectName(String projectName)
	{
		ProjectName = projectName;
	}

	public String getEmail()
	{
		return Email;
	}

	public void setEmail(String email)
	{
		Email = email;
	}

	public boolean isAdmin()
	{
		return Admin;
	}

	public void setAdmin(boolean admin)
	{
		Admin = admin;
	}

}
