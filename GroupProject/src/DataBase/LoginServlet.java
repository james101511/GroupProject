package DataBase;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.LoginDao;
import com.test.entity.User;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet()
	{
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String username = request.getParameter("email");
		String password = request.getParameter("password");
		if (username == null || username.trim().equals("") || password == null || password.trim().equals(""))

		{
			response.getWriter().println("please dont input empty password or username");
			return;
		}

		LoginDao dao = new LoginDao();
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		User us = dao.login(user);
		if (us == null)
		{
			response.getWriter().println("password or username is incorrect");

			return;
		}
		else
		{
			request.setAttribute("user", us);
			request.getRequestDispatcher("/index.jsp").forward(request, response);

		}

	}

	}

}
