package mail;

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

@WebServlet("/ForgotEmail")
public class ForgotEmail extends HttpServlet {
	private static final long serialVersionUID = 1L;   
    public ForgotEmail() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		        HttpSession httpSession = request.getSession();
		        String email  =request.getParameter("forgotemail");
                UserDao userDao = new UserDao(FactoryProvider.getFactory());
                UserData user= userDao.getUserByEmail(email);
                String message = " please click on the given below link to reset your password ";// your message which we send on email ;
                if(user==null) {
                	httpSession.setAttribute("msg", "Sorry your email is not registered!");
                	response.sendRedirect("index.jsp");              	
                }
                else {
                	httpSession.setAttribute("mailexist","yes");
                	httpSession.setAttribute("yourmail",email);
                   boolean value = SendTextMail.sendMail(message, "Reset Password", email,"ashutoshdhakad63@gmail.com","sfsnmaibmggpankx");     
                	if(value) {
                		httpSession.setAttribute("msg", "Successfully Reset password email has been sent on your email");
                    	response.sendRedirect("index.jsp"); 
                	}
                	else {
                		httpSession.setAttribute("msg", "fail");
                    	response.sendRedirect("index.jsp"); 
                	}
                }
	}

}
