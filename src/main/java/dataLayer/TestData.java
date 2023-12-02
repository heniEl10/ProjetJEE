package dataLayer;

import java.sql.Date;

import models.Projet;

public class TestData {

	public static void main(String[] args) {
		IDataProjetManager test = new DataProjetManager();
		//test.ajouterProjet(new Projet("Mon","Description du projet","ClientXYZ",new Date(System.currentTimeMillis()),new Date(System.currentTimeMillis() + 86400000L), 180));
		//test.ajouterProjet(new Projet("MonProjet2","Description du projet2","Client",new Date(System.currentTimeMillis()),new Date(System.currentTimeMillis() + 86400000L), 180));
		//Projet projet1 = test.getProjetParId(25);
		//Projet projet2 = test.getProjetParId(22);
		//System.out.println(projet1.toString());
		//System.out.println(projet2.toString());
	}

}
