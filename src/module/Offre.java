package module;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "OFFRE")
public class Offre  implements Serializable{
	
	@Id
	@GeneratedValue
	@Column(name = "id")
	Long id;
    String titre,img,desc;
    @JoinColumn(referencedColumnName = "id")
	@OneToOne(optional = false)
    Voiture v;
   
   public   Offre(){}

   public Offre(String titre, String img, String desc,Voiture v) {
		super();
		this.titre = titre;
		this.img = img;
		this.desc = desc;
		this.v=v;
	}

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getTitre() {
		return titre;
	}
	public void setTitre(String titre) {
		this.titre = titre;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	   
	public Voiture getV() {
		return v;
	}

	public void setV(Voiture v) {
		this.v = v;
	}
	
   
   
}
