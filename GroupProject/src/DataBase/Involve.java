package DataBase;

public class Involve
{
	private String ProjectName;
	private String Email;
	private boolean Admin;
	
	
	
	
	public Involve(String email)
	{
		super();
		Email = email;
	}
	public Involve(String projectName, String email)
	{
		super();
		ProjectName = projectName;
		Email = email;
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
