package module;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "PAYEMENT")
public class Payement {
	
	@Id
	@GeneratedValue
	@Column(name = "id")
     Long id;
     String mod_pay;
     boolean status;
     
     
	public Payement() {
		super();
	}


	public Payement(String mod_pay, boolean status) {
		super();
		this.mod_pay = mod_pay;
		this.status = status;
	}
	
	
	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}



	public String getMod_pay() {
		return mod_pay;
	}
	public void setMod_pay(String mod_pay) {
		this.mod_pay = mod_pay;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
    
     
}
