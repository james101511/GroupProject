package DataBase;

public class TaskInvolve
{
	private String taskName;
	private String userName;

	public TaskInvolve(String taskName, String userName)
	{
		this.taskName = taskName;
		this.userName = userName;
	}
	public TaskInvolve(String taskName)
	{
		this.taskName = taskName;
	}

	public String getTaskName()
	{
		return taskName;
	}

	public void setTaskName(String taskName)
	{
		this.taskName = taskName;
	}

	public String getUserName()
	{
		return userName;
	}

	public void setUserName(String userName)
	{
		this.userName = userName;
	}

}
