package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Projet;

import java.io.IOException;
import java.util.ArrayList;

import dataLayer.DataProjetManager;

/**
 * Servlet implementation class DirecteurServlet
 */
public class DirecteurServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DirecteurServlet() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String choixDirecteur = request.getParameter("choix");
		if(choixDirecteur.equals("nouveau")) {
			request.getRequestDispatcher("nouveauProjet.jsp").forward(request, response);
		}
		if(choixDirecteur.equals("consulter")) {
			ArrayList<String>  Noms = DataProjetManager.getListeNoms();
	        
	        request.setAttribute("projetNoms", Noms);

			request.getRequestDispatcher("consulterProjet.jsp").forward(request, response);
		}
		
	}

}





















