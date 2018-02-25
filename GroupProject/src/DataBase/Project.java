package DataBase;

public class Project
{
	private String ProjectName;
	private int UserID;
	private String SubTask;
	private String StartDate;
	private String EndDate;
	
	public Project(String projectName)
	{
		super();
		ProjectName = projectName;
	}
	public String getProjectName()
	{
		return ProjectName;
	}
	public void setProjectName(String projectName)
	{
		ProjectName = projectName;
	}
	public int getUserID()
	{
		return UserID;
	}
	public void setUserID(int userID)
	{
		UserID = userID;
	}
	public String getSubTask()
	{
		return SubTask;
	}
	public void setSubTask(String subTask)
	{
		SubTask = subTask;
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
