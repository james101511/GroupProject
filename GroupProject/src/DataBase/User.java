package DataBase;

public class User
{
	private int USERID;
	private String LastName;
	private String FirstName;
	private String Email;
	private String Password;
	public User(int USERID,String lastName, String firstName, String email, String password)
	{
		super();
		this.USERID=USERID;
		LastName = lastName;
		FirstName = firstName;
		Email = email;
		Password = password;
		
	}
	
	
	public User(String lastName, String firstName, String email, String password)
	{
		super();
		LastName = lastName;
		FirstName = firstName;
		Email = email;
		Password = password;
	}


	public User(String email, String password)
	{
		super();
		Email = email;
		Password = password;
	}


	public int getUSERID()
	{
		return USERID;
	}
	public void setUSERID(int uSERID)
	{
		USERID = uSERID;
	}
	public String getLastName()
	{
		return LastName;
	}
	public void setLastName(String lastName)
	{
		LastName = lastName;
	}
	public String getFirstName()
	{
		return FirstName;
	}
	public void setFirstName(String firstName)
	{
		FirstName = firstName;
	}
	public String getEmail()
	{
		return Email;
	}
	public void setEmail(String email)
	{
		Email = email;
	}
	public String getPassword()
	{
		return Password;
	}
	public void setPassword(String password)
	{
		Password = password;
	}


	@Override
	public String toString()
	{
		return " LastName=" + LastName + ", FirstName=" + FirstName+Email ;
	}
	
	
	
	
}
