package module;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Utilisateur")
public class Utilisateur  implements Serializable{
	
	@Id
	@GeneratedValue
	@Column(name = "id")
	Long id ;
	String nom,prenom,adress,email,tel,pays,ville,mot_pass,role;
	
	
	
	
	
	


	public Utilisateur(String nom, String prenom, String adress, String email,
			String tel, String pays, String ville, String mot_pass, String role) {
		super();
		this.nom = nom;
		this.prenom = prenom;
		this.adress = adress;
		this.email = email;
		this.tel = tel;
		this.pays = pays;
		this.ville = ville;
		this.mot_pass = mot_pass;
		this.role = role;
	}
	
	
	public Utilisateur() {
	}


	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getPrenom() {
		return prenom;
	}
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}
	public String getAdress() {
		return adress;
	}
	public void setAdress(String adress) {
		this.adress = adress;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getPays() {
		return pays;
	}
	public void setPays(String pays) {
		this.pays = pays;
	}
	public String getVille() {
		return ville;
	}
	public void setVille(String ville) {
		this.ville = ville;
	}
	public String getMot_pass() {
		return mot_pass;
	}
	public void setMot_pass(String mot_pass) {
		this.mot_pass = mot_pass;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	
	
	


	

}
