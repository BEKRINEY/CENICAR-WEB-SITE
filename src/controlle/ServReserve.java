package controlle;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.xml.internal.bind.Locatable;

import data_base.Services;
import module.*;

/**
 * Servlet implementation class ServReserve
 */
@WebServlet("/ServReserve")
public class ServReserve extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 Services s;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServReserve() {
        super();
        s = new Services();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();  
		
		
		if (request.getParameter("action")!=null &&  request.getParameter("action").equals("Reserve")) {
			
			Long id = Long.valueOf(request.getParameter("id_voi"));
			Voiture v = (Voiture) s.getById(id,Voiture.class);
			
	        session.setAttribute("v_res",v);
	        response.sendRedirect("reserve.jsp");
		}
		
		if(request.getParameter("action")!=null && request.getParameter("action").equals("pay_cache")){
			if(session.getAttribute("v_res") != null){
				
			
					 Date dd1 = (Date) session.getAttribute("dd");
					 Date da1 = (Date) session.getAttribute("da");
					 
				
				
				double prix_total =(double) session.getAttribute("prix_total");
				
				
				
				Voiture v = ( Voiture)session.getAttribute("v_res");
				Utilisateur u = ( Utilisateur)session.getAttribute("u");
				Payement p = new Payement("Cache", false);
				s.add(p);
				
				
				Location l = new Location(dd1, da1, prix_total, u, v, p);
				if(s.add(l)){
			            session.removeAttribute("v_res");;  
			            session.removeAttribute("dd");
			            session.removeAttribute("da");;  
			            session.removeAttribute("prix_total");
			            
			            
			            request.setAttribute("l", l);
			            request.getRequestDispatcher("facture.jsp").forward(request, response);
				}
				
				
				
			}
	    }
		
		if(request.getParameter("action")!=null && request.getParameter("action").equals("pass_pay")){
		
			if(session.getAttribute("v_res") != null){
				
				try {
					
					Date dd = new SimpleDateFormat("yyy-mm-dd").parse(request.getParameter("dd"));
					Date da = new SimpleDateFormat("yyy-mm-dd").parse(request.getParameter("da"));
					
					session.setAttribute("dd",dd);
					session.setAttribute("da", da);
					
//					PrintWriter o = response.getWriter();
//					o.print(da.getDate()-dd.getDate());
					Voiture v = ( Voiture)session.getAttribute("v_res");
					
					int nb_jrs = da.getDate()-dd.getDate();
					if(nb_jrs<=0){
						response.sendRedirect("reserve.jsp?stat=date");
					}else{
						session.setAttribute("nb_jrs", nb_jrs);
					double prix_total = nb_jrs * v.getPrix_jour();
					
					session.setAttribute("prix_total", prix_total);
					response.sendRedirect("payment.jsp");
					}
					
				} catch (ParseException e) {
					e.printStackTrace();
				}
			
			}
		
		}
		
	}

}
