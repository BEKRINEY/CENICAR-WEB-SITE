package module;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "LOCATION")
public class Location {

	@Id
	@GeneratedValue
	@Column(name = "id")
	Long id;
	Date date_debut;
	Date date_retour;
	double prix;
	
	@JoinColumn(referencedColumnName = "id")
	@ManyToOne(optional = false)
	Utilisateur utilisateur ;
	
	@JoinColumn(referencedColumnName = "id")
	@OneToOne(optional = false)
	Voiture voiture;
	
	@JoinColumn(referencedColumnName = "id")
	@ManyToOne(optional = false)
	Payement payement;
	
	
	
	
	
	public Location() {
		super();
	}
	
	public Location(Date date_debut, Date date_retour, double prix,
			Utilisateur utilisateur, Voiture voiture, Payement payement) {
		super();
		this.date_debut = date_debut;
		this.date_retour = date_retour;
		this.prix = prix;
		this.utilisateur = utilisateur;
		this.voiture = voiture;
		this.payement = payement;
	}
	public Payement getPayement() {
		return payement;
	}
	public void setPayement(Payement payement) {
		this.payement = payement;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Date getDate_debut() {
		return date_debut;
	}
	public void setDate_debut(Date date_debut) {
		this.date_debut = date_debut;
	}
	public Date getDate_retour() {
		return date_retour;
	}
	public void setDate_retour(Date date_retour) {
		this.date_retour = date_retour;
	}
	public double getPrix() {
		return prix;
	}
	public void setPrix(double prix) {
		this.prix = prix;
	}
	public Utilisateur getUtilisateur() {
		return utilisateur;
	}
	public void setUtilisateur(Utilisateur utilisateur) {
		this.utilisateur = utilisateur;
	}
	public Voiture getVoiture() {
		return voiture;
	}
	public void setVoiture(Voiture voiture) {
		this.voiture = voiture;
	}
	
	
	
	
	
}
