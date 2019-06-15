package controlle;

import java.io.IOException;




import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import module.Offre;
import data_base.Services;




@WebServlet("/Serv_specialOffers")
public class ServOffer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public ServOffer() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Services  s = new Services();
		List <Offre> lo =  s.getAll("Offer");
		
		request.setAttribute("lo", lo);
		request.getRequestDispatcher("offres_specials.jsp").forward(request, response);
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}




}
