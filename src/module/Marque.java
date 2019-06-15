package module;

import java.io.Serializable;

import javax.persistence.*;

@Entity
@Table(name = "MARQUE")
public class Marque implements Serializable {
	
	@Id @GeneratedValue
	@Column(name = "id")
	Long id;
	String marque;
	
	
	public Marque( String marque) {
		super();
		this.marque = marque;
	}
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Marque() {
		super();
	}

	public String getMarque() {
		return marque;
	}
	public void setMarque(String marque) {
		this.marque = marque;
	}
	
	
}
