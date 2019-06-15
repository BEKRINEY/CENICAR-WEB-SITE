package module;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "VOITURE")
public class Voiture implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue
	@Column(name = "id")
	public Long id;
	public String immatricule;
	public String model;
	public String img;
	double prix_jour;
	int nb_place;
	boolean disponible;

	

	@JoinColumn(referencedColumnName = "id")
	@ManyToOne(optional = false)
	Marque marque;
	@JoinColumn(referencedColumnName = "id")
	@ManyToOne(optional = false)
	Type type;
	
	

	public Voiture() {
	}

	public Voiture(String immatricule, String model, String img,
			double prix_jour, int nb_place, Marque marque, Type type) {
		super();
		this.immatricule = immatricule;
		this.model = model;
		this.img = img;
		this.prix_jour = prix_jour;
		this.nb_place = nb_place;
		this.marque = marque;
		this.type = type;
		this.disponible = true;
	}


	public boolean isDisponible() {
		return disponible;
	}

	public void setDisponible(boolean disponible) {
		this.disponible = disponible;
	}
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getImmatricule() {
		return immatricule;
	}

	public void setImmatricule(String immatricule) {
		this.immatricule = immatricule;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public double getPrix_jour() {
		return prix_jour;
	}

	public void setPrix_jour(double prix_jour) {
		this.prix_jour = prix_jour;
	}

	public int getNb_place() {
		return nb_place;
	}

	public void setNb_place(int nb_place) {
		this.nb_place = nb_place;
	}

	public Marque getMarque() {
		return marque;
	}

	public void setMarque(Marque marque) {
		this.marque = marque;
	}

	public Type getType() {
		return type;
	}

	public void setType(Type type) {
		this.type = type;
	}

}
