package DataBase;

public class Task
{
	private String taskName;
	private String projectName;
	private String startDate;
	private String endDate;
	private String taskProgress;

	public Task(String projectName)
	{

		this.projectName = projectName;
	}

	public Task(String projectName, String taskName, String startDate, String endDate)
	{
		this.projectName = projectName;
		this.taskName = taskName;
		this.startDate = startDate;
		this.endDate = endDate;
	}

	public String getTaskName()
	{
		return taskName;
	}

	public void setTaskName(String taskName)
	{
		this.taskName = taskName;
	}

	public String getProjectName()
	{
		return projectName;
	}

	public void setProjectName(String projectName)
	{
		this.projectName = projectName;
	}

	public String getStartDate()
	{
		return startDate;
	}

	public void setStartDate(String startDate)
	{
		this.startDate = startDate;
	}

	public String getEndDate()
	{
		return endDate;
	}

	public void setEndDate(String endDate)
	{
		this.endDate = endDate;
	}

	public String getTaskProgress()
	{
		return taskProgress;
	}

	public void setTaskProgress(String taskProgress)
	{
		this.taskProgress = taskProgress;
	}

}
