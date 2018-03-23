package DataBase;

public class Task
{
	private String TaskName;
	private String ProjectName;
	private String StartDate;
	private String EndDate;

	public Task(String projectName)
	{

		ProjectName = projectName;
	}

	public Task(String taskName, String projectName, String startDate, String endDate)
	{

		TaskName = taskName;
		ProjectName = projectName;
		StartDate = startDate;
		EndDate = endDate;
	}

	public String getTaskName()
	{
		return TaskName;
	}

	public void setTaskName(String taskName)
	{
		TaskName = taskName;
	}

	public String getProjectName()
	{
		return ProjectName;
	}

	public void setProjectName(String projectName)
	{
		ProjectName = projectName;
	}

	public String getStartDate()
	{
		return StartDate;
	}

	public void setStartDate(String startDate)
	{
		StartDate = startDate;
	}

	public String getEndDate()
	{
		return EndDate;
	}

	public void setEndDate(String endDate)
	{
		EndDate = endDate;
	}

}
