package controlle;

import data_base.*;
import module.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ServVoiture
 */
@WebServlet("/ServVoiture")
public class ServVoiture extends HttpServlet {
	private static final long serialVersionUID = 1L;

	Services s;

	public ServVoiture() {
		super();
	}

	@Override
	public void init() throws ServletException {
		s = new Services();
		super.init();
	}

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		Services s = new Services();

		if (req.getParameter("action") != null
				&& req.getParameter("action").equals("add_Type")) {

			String type = req.getParameter("type");
			Type t = new Type(type);
			s.add(t);

			resp.sendRedirect("admin/GereType.jsp?status=f1PkJn84L");
		}

		if (req.getParameter("action") != null
				&& req.getParameter("action").equals("add_Marque")) {

			String marque = req.getParameter("marque");
			Marque m = new Marque(marque);
			s.add(m);

			resp.sendRedirect("admin/GereMarque.jsp?status=Jk7Ml2Kd");

		}

		if (req.getParameter("action") != null
				&& req.getParameter("action").equals("add")) {

			if (doajouter(req, resp)) {
				resp.sendRedirect("admin/AddVoiture.jsp?status=1");
			} else {

			}

		} /* fin add */

		if (req.getParameter("action") != null
				&& req.getParameter("action").equals("mod_voiture")) {

			if (domodifier(req, resp)) {
				resp.sendRedirect("admin/GereVoiture.jsp?status=1");
			} else {
				resp.sendRedirect("admin/GereVoiture.jsp?status=0");
			}

		} /* fin update */

		if (req.getParameter("action") != null
				&& req.getParameter("action").equals("cherche")) {

			try {
				if (docherche(req, resp) != null) {
					req.setAttribute("res", docherche(req, resp));
					Type t = (Type) s.getById(Long.valueOf(req.getParameter("type")), Type.class);
					req.setAttribute("type",t.getType());
					req.setAttribute("dd", req.getParameter("dd"));
				} else {
					req.setAttribute("stat", "Non voiture trouvé !");
				}

				req.getRequestDispatcher("gallery.jsp").forward(req, resp);

			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} /* fin cherche */

	}

	private boolean doajouter(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		String immatricule = req.getParameter("immatricule");
		String model = req.getParameter("model");
		String img = req.getParameter("img");
		Long idmarque = Long.valueOf(req.getParameter("idmarque"));
		Long idtype = Long.valueOf(req.getParameter("idtype"));
		int nb_place = Integer.valueOf(req.getParameter("nb_place"));
		double prix_jour = Double.valueOf(req.getParameter("prix_jour"));

		Type t = (Type) s.getById(idtype, Type.class);
		Marque m = (Marque) s.getById(idmarque, Marque.class);

		Voiture v4 = new Voiture(immatricule, model, img, prix_jour, nb_place,
				m, t);
		if (s.add(v4)) {
			return true;
		} else {
			return false;
		}
	}

	private boolean domodifier(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {

		String immatricule = req.getParameter("immatricule");
		String model = req.getParameter("model");
		String img = req.getParameter("img");
		Long idmarque = Long.valueOf(req.getParameter("idmarque"));
		Long idtype = Long.valueOf(req.getParameter("idtype"));
		int nb_place = Integer.valueOf(req.getParameter("nb_place"));
		double prix_jour = Double.valueOf(req.getParameter("prix_jour"));

		Type t = (Type) s.getById(idtype, Type.class);
		Marque m = (Marque) s.getById(idmarque, Marque.class);

		Voiture v4 = new Voiture(immatricule, model, img, prix_jour, nb_place,
				m, t);
		v4.setId(Long.valueOf(req.getParameter("id_voiture")));
		if (s.update(v4)) {
			return true;
		} else {
			return false;
		}
	}
	
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	private List<Voiture> docherche(HttpServletRequest req,
			HttpServletResponse resp) throws IOException, ParseException {

		

		Date date = formatter.parse(req.getParameter("dd"));
		Long id_type = Long.valueOf(req.getParameter("type"));

		// PrintWriter o = resp.getWriter();
		// o.print(date);
		// o.print(id_type);

		

		return s.getAllWhere("Voiture", "disponible=1 and  type_id=" + id_type);

	}

}
