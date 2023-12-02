package controllers;

import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Projet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import dataLayer.DataProjetManager;

/**
 * Servlet implementation class CreationServlet
 */
public class CreationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	private boolean estNomProjetUnique(String nomProjet) {
        for (Projet projet : DataProjetManager.getListeProjets()) {
            if (projet.getNomProjet().equals(nomProjet)) {
                return false;
            }
        }
        return true;
    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String nomProjet = request.getParameter("nomProjet");
		String description = request.getParameter("descriptionProjet");
		String client = request.getParameter("clientProjet");
		String dateDebut = request.getParameter("dateDebut");
		String dateLivraison = request.getParameter("dateLivraison");
        int joursDeveloppement = Integer.parseInt(request.getParameter("joursDeveloppement"));
		String chefProjet = request.getParameter("chefProjet");
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date dateDebut1 = null;
        Date dateLivraison1 = null;
        try {
            dateDebut1 = dateFormat.parse(dateDebut);
            dateLivraison1 = dateFormat.parse(dateLivraison);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        
        if (estNomProjetUnique(nomProjet)) {
        	  Projet projet = new Projet();
              projet.setNomProjet(nomProjet);
              projet.setDescription(description);
              projet.setClient(client);
              projet.setDateDemarrage (dateDebut1);
              projet.setDateLivraison(dateLivraison1);
              projet.setChefDeProjet(chefProjet);
              projet.setNbrJoursDevelop(joursDeveloppement);
              
              DataProjetManager manager = new DataProjetManager();
              manager.ajouterProjet(projet);
              request.getRequestDispatcher("confirmation.jsp?nomProjet=" + nomProjet).forward(request, response);        
        } 
        else {
            request.setAttribute("erreur", "Ce projet existe déjà.");
            request.getRequestDispatcher("erreurProjet.jsp").forward(request, response);
        }
        
        
        



	}

}
