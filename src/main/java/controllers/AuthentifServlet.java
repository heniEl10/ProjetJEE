package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Servlet implementation class AuthentifServlet
 */
@WebServlet("/AuthentifServlet")
public class AuthentifServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AuthentifServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Redirect to login page for GET requests
		response.sendRedirect("index.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		// Basic validation
		if (username == null || password == null || username.trim().isEmpty() || password.trim().isEmpty()) {
			response.sendRedirect("index.jsp?error=empty");
			return;
		}
		
		try {
			// Simple authentication logic (in production, use proper password hashing)
			if (authenticateUser(username, password)) {
				// Create session
				HttpSession session = request.getSession();
				session.setAttribute("username", username);
				session.setAttribute("userRole", getUserRole(username));
				session.setMaxInactiveInterval(1800); // 30 minutes
				
				// Redirect based on role
				String userRole = getUserRole(username);
				switch (userRole) {
					case "admin":
					case "directeur":
						response.sendRedirect("AcceuilDirecteur.jsp");
						break;
					case "chef_projet":
						response.sendRedirect("AcceuilChefProjet.jsp");
						break;
					case "developpeur":
						response.sendRedirect("AcceuilDeveloppeur.jsp");
						break;
					default:
						response.sendRedirect("AcceuilDirecteur.jsp");
						break;
				}
			} else {
				// Authentication failed
				response.sendRedirect("index.jsp?error=invalid");
			}
		} catch (Exception e) {
			// Log the error (in production, use proper logging)
			System.err.println("Authentication error: " + e.getMessage());
			response.sendRedirect("index.jsp?error=system");
		}
	}
	
	/**
	 * Authenticate user credentials
	 */
	private boolean authenticateUser(String username, String password) {
		// Simple authentication for demo purposes
		// In production, this should query the database and use proper password hashing
		
		if ("admin".equals(username) && "admin".equals(password)) {
			return true;
		}
		
		if ("directeur".equals(username) && "directeur123".equals(password)) {
			return true;
		}
		
		if ("chef".equals(username) && "chef123".equals(password)) {
			return true;
		}
		
		if ("dev".equals(username) && "dev123".equals(password)) {
			return true;
		}
		
		return false;
	}
	
	/**
	 * Get user role based on username
	 */
	private String getUserRole(String username) {
		if ("admin".equals(username)) {
			return "admin";
		} else if ("directeur".equals(username)) {
			return "directeur";
		} else if ("chef".equals(username)) {
			return "chef_projet";
		} else if ("dev".equals(username)) {
			return "developpeur";
		}
		return "user";
	}
}




















