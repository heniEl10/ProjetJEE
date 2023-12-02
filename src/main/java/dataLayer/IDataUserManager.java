package dataLayer;

import java.util.ArrayList;
import java.util.List;

import models.ChefProjet;
import models.Developpeur;

public interface IDataUserManager {
	public void ajouterDirecteur();
	public void ajouterChefDeProjet();
	public void ajouterDevelopper();
	public ArrayList<ChefProjet> getListeDesChefs();
	public ArrayList<Developpeur> getListeDesDeveloppeurs();
	public ChefProjet getChefProjetParId(long id);
	public Developpeur getDeveloppeurParId(long id);
	public List<Developpeur> getDeveloppeursParTechnologie(String tech);
}
