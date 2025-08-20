package models;

import java.util.Date;

public class Projet {
	
	private long idProjet;
	private long idChefProjet;
	private String nomProjet;
	private String description;
	private String client;
	private Date dateDemarrage;
	private Date dateLivraison;
	private int nbrJoursDevelop;
	
	
	
	public Projet() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Projet(String nomProjet, String description, String client, Date dateDemarrage,
			Date dateLivraison, int nbrJoursDevelop) {
		super();
		this.idChefProjet=0;
		this.nomProjet = nomProjet;
		this.description = description;
		this.client = client;
		this.dateDemarrage = dateDemarrage;
		this.dateLivraison = dateLivraison;
		this.nbrJoursDevelop = nbrJoursDevelop;
	}
	
	public long getIdProjet() {
		return idProjet;
	}
	public void setIdProjet(long idProjet) {
		this.idProjet = idProjet;
	}
	public long getIdChefProjet() {
		return idChefProjet;
	}
	public void setIdChefProjet(long idChefProjet) {
		this.idChefProjet = idChefProjet;
	}
	
	// Method to set chef de projet by name (for compatibility)
	public void setChefDeProjet(String chefProjetName) {
		// This is a temporary method for compatibility
		// In a real application, you would look up the chef by name and set the ID
		this.idChefProjet = 0; // Default value
	}
	
	public String getNomProjet() {
		return nomProjet;
	}
	public void setNomProjet(String nomProjet) {
		this.nomProjet = nomProjet;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getClient() {
		return client;
	}
	public void setClient(String client) {
		this.client = client;
	}
	public Date getDateDemarrage() {
		return dateDemarrage;
	}
	public void setDateDemarrage(Date dateDemarrage) {
		this.dateDemarrage = dateDemarrage;
	}
	public Date getDateLivraison() {
		return dateLivraison;
	}
	public void setDateLivraison(Date dateLivraison) {
		this.dateLivraison = dateLivraison;
	}
	public int getNbrJoursDevelop() {
		return nbrJoursDevelop;
	}
	public void setNbrJoursDevelop(int nbrJoursDevelop) {
		this.nbrJoursDevelop = nbrJoursDevelop;
	}
	@Override
	public String toString() {
		return "Projet [idProjet=" + idProjet + ", nomProjet=" + nomProjet
				+ ", description=" + description + ", client=" + client + ", dateDemarrage=" + dateDemarrage
				+ ", dateLivraison=" + dateLivraison + ", nbrJoursDevelop=" + nbrJoursDevelop + "]";
	}

}
