package DataBase;

public class TaskInvolve
{
	private String taskName;
	private String userEmail;
	private String projectName;
	private String progress;
	private String percentage;

	public TaskInvolve(String taskName, String userEmail, String projectName, String progress, String percentage)
	{
		this.taskName = taskName;
		this.userEmail = userEmail;
		this.projectName = projectName;
		this.progress = progress;
		this.percentage = percentage;
	}

	public TaskInvolve(String taskName, String userEmail, String projectName)
	{
		this.taskName = taskName;
		this.userEmail = userEmail;
		this.projectName = projectName;
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

	public String getProgress()
	{
		return progress;
	}

	public String getPercentage()
	{
		return percentage;
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
