package dataLayer;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import models.ChefProjet;
import models.Projet;

public class DataProjetManager implements IDataProjetManager {

	private ArrayList<Projet> projets = new ArrayList<Projet>();
	private Projet projet = new Projet();
	
    @Override
    public void ajouterProjet(Projet projet) {
    	Connection connection = ConnectionDB.getConnection();
    	try {
			PreparedStatement ps = connection.prepareStatement
			("INSERT INTO projets (nomProjet,description,client,dateDemarrage,dateLivraison,nbrJoursDevelop) VALUES (?,?,?,?,?,?) ");
			ps.setString(1,projet.getNomProjet());
			ps.setString(2,projet.getDescription());
			ps.setString(3,projet.getClient());
			ps.setDate(4,(Date) projet.getDateDemarrage());
			ps.setDate(5,(Date) projet.getDateLivraison());
			ps.setInt(6,projet.getNbrJoursDevelop());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    
    @Override
    public ArrayList<Projet> getProjets() {
    	ArrayList<Projet> projetsList = new ArrayList<Projet>();
    	Connection connection = ConnectionDB.getConnection();
    	try {
			PreparedStatement ps = connection.prepareStatement("SELECT * FROM projets");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Projet p = new Projet();
				p.setIdProjet(rs.getLong("idProjet"));
				p.setIdChefProjet(rs.getLong("idChefDeProjet"));
				p.setDescription(rs.getString("description"));
				p.setDateLivraison(rs.getDate("dateLivraison"));
				p.setDateDemarrage(rs.getDate("dateDemarrage"));
				p.setClient(rs.getString("client"));
				p.setNomProjet(rs.getString("nomProjet"));
				p.setNbrJoursDevelop(rs.getInt("nbrJoursDevelop"));
				projetsList.add(p);
			}
			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
        return projetsList;
    }
    
    // Static method to get list of projects (for compatibility)
    public static ArrayList<Projet> getListeProjets() {
    	DataProjetManager manager = new DataProjetManager();
    	return manager.getProjets();
    }
    
    // Static method to get list of project names (for compatibility)
    public static ArrayList<String> getListeNoms() {
    	ArrayList<String> noms = new ArrayList<String>();
    	DataProjetManager manager = new DataProjetManager();
    	ArrayList<Projet> projets = manager.getProjets();
    	
    	for (Projet projet : projets) {
    		noms.add(projet.getNomProjet());
    	}
    	
    	return noms;
    }
    
    @Override
    public Projet getProjetParId(long id) {
    	Connection connection = ConnectionDB.getConnection();
    	try {
			PreparedStatement ps = connection.prepareStatement("SELECT * FROM projets WHERE idProjet = ?");
			ps.setLong(1,id);
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				Projet p = new Projet();
				p.setIdProjet(rs.getLong("idProjet"));
				p.setIdChefProjet(rs.getLong("idChefDeprojet"));
				p.setDescription(rs.getString("description"));
				p.setDateLivraison(rs.getDate("dateLivraison"));
				p.setDateDemarrage(rs.getDate("dateDemarrage"));
				p.setClient(rs.getString("client"));
				p.setNomProjet(rs.getString("nomProjet"));
				p.setNbrJoursDevelop(rs.getInt("nbrJoursDevelop"));
				projet = p;
			}
			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
        return projet;
    }
    
	@Override
	public void affecterChefDeProjet(Projet projet, ChefProjet chefprojet) {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public void supprimerProjet(Projet projet) {
		// TODO Auto-generated method stub
		
	}
    
   

}
