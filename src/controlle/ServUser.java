package controlle;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Mail.Mail;
import data_base.Services;
import module.Utilisateur;



@WebServlet("/Rerv_inscription")
public class ServUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
       Services sc ;
   @Override
   public void init() throws ServletException {
	   sc = new Services();
	super.init();
   	}
   
    public ServUser() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = String.valueOf( request.getParameter("action"));
		
		 if(action.equals("2")){
            HttpSession session=request.getSession();  
            session.invalidate();
            response.sendRedirect("index.jsp");
		}else {
			response.sendRedirect("admin/Home.jsp");
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// PrintWriter out = response.getWriter();
		
		
		if(request.getParameter("action").equals("signup")){
			
		String nom = request.getParameter("nom");
		String prenom = request.getParameter("prenom");
		String adress = request.getParameter("adress");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		String pays = request.getParameter("pays");
		String ville = request.getParameter("ville");
		String mot_pass = request.getParameter("pwd");
		String role= request.getParameter("role");
		
		// out.print(nom+" "+adress+" "+pays+" "+ville);
		Utilisateur u1 = new  Utilisateur(nom, prenom, adress, email, tel, pays, ville, mot_pass,role);
		sc.add(u1);
		//response.sendRedirect("login.jsp");
		String stat = "Votre inscription reussit , vous pouvez s'authentifier maintenent .";
		request.setAttribute("stat",stat);
		request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		
		if(request.getParameter("action").equals("mod_pass")){
		String pwd = request.getParameter("new_pwd");
	    Long id = Long.valueOf(request.getParameter("id_user"));
		Utilisateur u1 = new  Utilisateur();
		u1.setId(id);
		u1.setMot_pass(pwd);
		sc.update(u1);
		response.sendRedirect("admin/Home.jsp?status=1");
		}
		
		if(request.getParameter("action").equals("mail")){
			
			ServletContext context=getServletContext();  
			
			String _subject  = request.getParameter("subject");
	    	String _to = context.getInitParameter("email");  ;
	    	String _message = request.getParameter("msg");
	    	String _from = request.getParameter("from");
	    	
	    	Mail m = new Mail(_from, _to, _message, _subject);
	    	
	    	if(m.send()){
	    		response.sendRedirect("contact.jsp?stat=1");
	    	}else{
	    		response.sendRedirect("contact.jsp?stat=0");
	    	}
	    	
	    }
		
		}
	
	    
		
		
	}


