package helper;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;

@WebServlet("/UpdatePassword")
public class UpdatePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdatePassword() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String email = request.getParameter("email");  
		 String password = request.getParameter("confirmPassword");
		 System.out.println("email is : "+email);
		 System.out.println("and password for change : "+password);
		  UserDao userDao = new UserDao(FactoryProvider.getFactory());
		  boolean info= userDao.updatePasswordByEmail(email, password);
		 if(info) {
			 HttpSession httpSession = request.getSession();
			 httpSession.setAttribute("msg","success");
			 response.sendRedirect("login.jsp");
		 }
		 else {
			 HttpSession httpSession = request.getSession();
			 httpSession.setAttribute("msg","fail");
			 response.sendRedirect("index.jsp");
		 }
		
		
	}

}
