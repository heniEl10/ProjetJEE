package dataLayer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.ChefProjet;
import models.Developpeur;

public class DataUserManager implements IDataUserManager {

	@Override
	public void ajouterDirecteur() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void ajouterChefDeProjet() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void ajouterDevelopper() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ArrayList<ChefProjet> getListeDesChefs() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Developpeur> getListeDesDeveloppeurs() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ChefProjet getChefProjetParId(long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Developpeur getDeveloppeurParId(long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Developpeur> getDeveloppeursParTechnologie(String tech) {
		List<Developpeur> developpeurs = new ArrayList<Developpeur>();
		Connection connection = ConnectionDB.getConnection();
		try {
			PreparedStatement ps = connection.prepareStatement
					("SELECT * FROM developpeur WHERE idProjet = ?");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
}
