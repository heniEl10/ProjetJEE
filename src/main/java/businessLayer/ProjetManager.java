package businessLayer;

import java.sql.Date;

import dataLayer.DataProjetManager;
import models.Projet;

public class ProjetManager implements IProjetManager {
	
	DataProjetManager db=new DataProjetManager();
	
	public void ajouterProjet(Projet p) {
		db.ajouterProjet(p);
		
	}
	
	public void ajouterProjet(String nomProjet, String description, String client, String chefDeProjet, Date dateDemarrage,
			Date dateLivraison, int nbrJoursDevelop) {
		
			Projet p=new Projet();
			db.ajouterProjet(p);
	}

}
