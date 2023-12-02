package dataLayer;

import java.util.ArrayList;

import models.ChefProjet;
import models.Projet;

public interface IDataProjetManager {
	public void ajouterProjet(Projet p);
	public ArrayList<Projet> getProjets();
	public  Projet getProjetParId(long id);
	public void affecterChefDeProjet(Projet projet,ChefProjet chefprojet);
	public void supprimerProjet(Projet projet);
}
