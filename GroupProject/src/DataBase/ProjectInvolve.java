package DataBase;

public class ProjectInvolve
{
	private String projectName;
	private boolean admin;
	private String userEmail;

	public ProjectInvolve(String userEmail)
	{
		this.userEmail = userEmail;
	}

	public ProjectInvolve(String projectName, boolean admin, String userEmail)
	{
		this.projectName = projectName;
		this.admin = admin;
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

	public boolean isAdmin()
	{
		return admin;
	}

	public void setAdmin(boolean admin)
	{
		this.admin = admin;
	}

	public String getUserEmail()
	{
		return userEmail;
	}

	public void setUserEmail(String userEmail)
	{
		this.userEmail = userEmail;
	}

}
