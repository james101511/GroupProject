package DataBase;

public class TaskInvolve
{
	private String taskName;
	private String userEmail;
	private String projectName;

	public TaskInvolve(String taskName, String userEmail,String projectName)
	{
		this.taskName = taskName;
		this.userEmail = userEmail;
		this.projectName=projectName;
	}
	public TaskInvolve(String taskName)
	{
		this.taskName = taskName;
	}

	public String getTaskName()
	{
		return taskName;
	}
	public String getProjectName()
	{
		return projectName;
	}

	public void setTaskName(String taskName)
	{
		this.taskName = taskName;
	}

	public String getUserEmail()
	{
		return userEmail;
	}

	public void setUserName(String userEmail)
	{
		this.userEmail = userEmail;
	}

}
