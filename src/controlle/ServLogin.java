package controlle;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import module.Utilisateur;
import data_base.Services;

/**
 * Servlet implementation class ServLogin
 */
@WebServlet("/ServLogin")
public class ServLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Services s;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServLogin() {
        super();
        s = new Services();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = String.valueOf(request.getParameter("email"));
		String pwd =String.valueOf(request.getParameter("pwd"));
		HttpSession session = request.getSession();
		
		if(s.getAllWhere("Utilisateur","email = '"+email+"' and mot_pass = '"+pwd+"'") != null){
			
			Iterator<Utilisateur> i = s.getAllWhere("Utilisateur","email = '"+email+"' and mot_pass = '"+pwd+"'").iterator();
			if (i.hasNext()) {
				Utilisateur u = i.next();
				 session.setAttribute("u", u);
				 
				 
//					 PrintWriter out = response.getWriter();
//					 out.print(u.getRole());
				 
							 if(u.getRole().equals("admin")){
						 response.sendRedirect("admin/Home.jsp");
							 }else if(u.getRole().equals("user")){
								 response.sendRedirect("index.jsp");
							 }
						 
						 
				 
			}
			
			 
			
			 
			 if(request.getParameter("remember_me") != null)
			 {
			  

			     Cookie c2 = new Cookie("user_pass", pwd);
			     c2.setMaxAge(24*60*60);
			     response.addCookie(c2);  
			     
			     Cookie c = new Cookie("user_email", email);
			     c.setMaxAge(24*60*60);
			     response.addCookie(c); 
			 }
			 
			 
			
			 
			 
			 
		}else{
			String err = "Les donées incorrect !";
			request.setAttribute("err",err);
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		
		}
	}



