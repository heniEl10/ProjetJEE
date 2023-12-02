package businessLayer;

import java.sql.Date;

import models.Projet;

public interface IProjetManager {
	public void ajouterProjet(Projet p);
	public void ajouterProjet(String nomProjet, String description, String client, String chefDeProjet, Date dateDemarrage,
			Date dateLivraison, int nbrJoursDevelop);
}
