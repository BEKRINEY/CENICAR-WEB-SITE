package controlle;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import module.*;
import data_base.Services;


@WebServlet("/ServType")
public class ServType extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ServType() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Services  s = new Services();
		List <Type> lt =  s.getAll("Type");
		
		request.setAttribute("lt", lt);
		request.getRequestDispatcher("admin/GereType.jsp").forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		Services s = new Services();
		
		if(request.getParameter("id_supp")!=null){
		    	
		    	if(s.delete(Long.valueOf(request.getParameter("id_supp")),Type.class)){
		    		boolean stat = true;
		    		request.setAttribute("stat", stat);
		    		request.getRequestDispatcher("Type").forward(request, response);
		    	}
		    	}
		    	
	}

}
