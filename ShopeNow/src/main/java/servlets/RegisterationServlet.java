package servlets;

import java.io.IOException;
import java.io.Serializable;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import dao.UserDao;
import entities.UserData;
import helper.FactoryProvider;


@WebServlet("/RegisterationServlet")
public class RegisterationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public RegisterationServlet() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String userName=request.getParameter("username");
			String userEmail = request.getParameter("email");
			String userPassword = request.getParameter("password");
			String userPhone = request.getParameter("phone");
			String userAddress = request.getParameter("address");
			String userType = request.getParameter("usertype");
			// validation like user is already exist or not 
			UserDao userDao= new UserDao(FactoryProvider.getFactory());
			UserData user1 = userDao.getUserByEmailAndPassword(userEmail, userPassword);
			//System.out.println(user);
			if(user1!=null) {
				HttpSession httpSession = request.getSession();
				httpSession.setAttribute("msg","fail");
				response.sendRedirect("register.jsp");
			}
			else {			
			// creating user object to store data
			UserData user =new UserData(userName,userEmail,userPassword,userPhone,"default.jpg",userAddress,userType);
			Session session =FactoryProvider.getFactory().openSession();
			Transaction transaction =session.beginTransaction();
			Serializable userId = session.save(user);
			if(userId!=null) {
				HttpSession httpSession = request.getSession();
				httpSession.setAttribute("msg","success");
				response.sendRedirect("register.jsp");			
			}
			else {
				HttpSession httpSession = request.getSession();
				httpSession.setAttribute("msg","fail");
				response.sendRedirect("register.jsp");
			}
			
			
			transaction.commit();
			session.close();
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}

}
