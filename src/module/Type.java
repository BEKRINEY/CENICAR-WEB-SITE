package module;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.*;

@Entity
@Table(name = "TYPE")
public class Type  implements Serializable{
	
	 @Id @GeneratedValue
	 @Column(name = "id")
	Long id;
	String type;
	
	
	
	public Type() {
		super();
	}


	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public Type( String type) {
		super();
		this.type = type;
	}


	public String getType() {
		return type;
	}
	
	
	public void setType(String type) {
		this.type = type;
	}
	
	
 
 
}
