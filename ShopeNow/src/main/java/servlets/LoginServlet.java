package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;
import entities.UserData;
import helper.FactoryProvider;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public LoginServlet() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("loginemail");
		String password = request.getParameter("loginpassword");
		HttpSession httpSession = request.getSession();
		
		// user Authentication
		UserDao userDao= new UserDao(FactoryProvider.getFactory());
		UserData user = userDao.getUserByEmailAndPassword(email, password);
		//System.out.println(user);
		if(user==null) {
			httpSession.setAttribute("msg","fail");
			response.sendRedirect("login.jsp");
		}
		else {
			httpSession.setAttribute("currentuser", user); // this is for protecting admin and normal user page
			if(user.getUserTyope().equals("admin")) {
				response.sendRedirect("admin.jsp");
			}
			else if(user.getUserTyope().equals("normal")) {
				response.sendRedirect("normaluser.jsp");
			}
			else {
				httpSession.setAttribute("msg","fail");
				response.sendRedirect("login.jsp");
				
			}
			
		}
		
	}

}
