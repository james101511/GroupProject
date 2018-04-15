package DataBase;

import java.util.Date;

public class Project
{
	private String projectName;
	private boolean projectAdmin;
	private String userEmail;

	public Project(String projectName, boolean projectAdmin, String userEmail)
	{
		this.projectName = projectName;
		this.projectAdmin = projectAdmin;
		this.userEmail = userEmail;
	}

	public Project(String userEmail)
	{
		this.userEmail = userEmail;
	}

	public String getProjectName()
	{
		return projectName;
	}

	public void setProjectName(String projectName)
	{
		this.projectName = projectName;
	}

	public boolean isProjectAdmin()
	{
		return projectAdmin;
	}

	public void setProjectAdmin(boolean projectAdmin)
	{
		this.projectAdmin = projectAdmin;
	}

	public String getUserEmail()
	{
		return userEmail;
	}

	public void setUserEmail(String user_Email)
	{
		this.userEmail = user_Email;
	}

}