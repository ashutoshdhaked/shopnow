package servlets;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import dao.CategoryDao;
import dao.ProductDao;
import entities.Category;
import entities.Product;
import helper.FactoryProvider;

@WebServlet("/ProductOperationServlet")
@MultipartConfig
public class ProductOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ProductOperationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		     String op = request.getParameter("operation");
		    if(op.trim().equals("addcategory")) {
		    	// add category
		    	String catTittle = request.getParameter("cattitle");
				String catDesc=request.getParameter("carddesc");

                 Category category = new Category();
                 category.setCategoryTittle(catTittle);
                 category.setCategoryDescription(catDesc);
                CategoryDao categoryDao= new CategoryDao(FactoryProvider.getFactory());
                int id = categoryDao.saveCategory(category);
                HttpSession httpSession = request.getSession();
                if(id!=0) {
                httpSession.setAttribute("msg","success");
                response.sendRedirect("admin.jsp");
                }
                else {
                	httpSession.setAttribute("msg","fail");
                    response.sendRedirect("admin.jsp");
                }
		    }
		    else if(op.trim().equals("addproduct")) {
		    	// add product
		    	String pName= request.getParameter("proname");
		    	String pDesc= request.getParameter("prodesc");
		    	int pPrice= Integer.parseInt(request.getParameter("proprice"));
		    	int pDiscount= Integer.parseInt(request.getParameter("prodiscount"));
		    	int pQuantity= Integer.parseInt(request.getParameter("proquantity"));
		    	int pCategoryId= Integer.parseInt(request.getParameter("selectcategory"));
		    	
		    	Part part = request.getPart("pic");
		    	
		    	Product p = new Product();
		    	p.setpName(pName);
		    	p.setpDesc(pDesc);
		    	p.setpPrice(pPrice);
		    	p.setpDiscount(pDiscount);
		    	p.setpQuantity(pQuantity);
		    	p.setpPhoto(part.getSubmittedFileName());
		    	// get category by id 
		    	CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
		    	Category category = categoryDao.getCategory(pCategoryId);
		    	p.setCategory(category);
		    	// finding the path for the products folder 
		    	   String path = request.getRealPath("images")+File.separator+"products"+File.separator+part.getSubmittedFileName();
		    	 System.out.println("path is : "+path);
		    	   try {
		    	   FileOutputStream fout = new FileOutputStream(path);
		    	   File f = new File(part.getSubmittedFileName());
		    	   FileInputStream fin = new FileInputStream(f);
		    	   byte[] data = new byte[fin.available()]; 
		    	   fin.read(data);
		    	   fout.write(data);
		    	   }
		    	   catch(Exception e) {
		    		   e.printStackTrace();
		    	   }
		    	
		    	ProductDao pDao = new ProductDao(FactoryProvider.getFactory());
		    	boolean check =pDao.saveProduct(p);
		    	if(check) {
		    		HttpSession httpSession = request.getSession();
		    		httpSession.setAttribute("msg","success");
		    		response.sendRedirect("admin.jsp");
		    	}
		    	else {
		    		HttpSession httpSession = request.getSession();
		    		httpSession.setAttribute("msg","fail");
		    		response.sendRedirect("admin.jsp");
		    	}
		    }
		
	}

}
