package module;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

public class Paypal {
	@Id
	@GeneratedValue
	@Column(name = "id")
	Long id ;
	Long receiver_id, ipn_track_id, payer_id ;
	
	String invoice, mc_gross , payment_gross, business, item_name,receiver_email,payer_status, payer_email, full_post ,first_name, last_name, 
	protection_eligibility, payment_status , payment_type;
	int item_number;
	double amount;
	Date payment_date;
	
	
	public Long getId() {
		return id;
	}



	public void setId(Long id) {
		this.id = id;
	}
	
	
	
	
	public Paypal(String invoice, String mc_gross, String payment_gross,
			String business, String item_name, String receiver_email,
			String payer_status, String payer_email, String full_post,
			String first_name, String last_name, String protection_eligibility,
			String payment_status, String payment_type, int item_number,
			double amount, Date payment_date, Long receiver_id,
			Long ipn_track_id, Long payer_id) {
		super();
		this.invoice = invoice;
		this.mc_gross = mc_gross;
		this.payment_gross = payment_gross;
		this.business = business;
		this.item_name = item_name;
		this.receiver_email = receiver_email;
		this.payer_status = payer_status;
		this.payer_email = payer_email;
		this.full_post = full_post;
		this.first_name = first_name;
		this.last_name = last_name;
		this.protection_eligibility = protection_eligibility;
		this.payment_status = payment_status;
		this.payment_type = payment_type;
		this.item_number = item_number;
		this.amount = amount;
		this.payment_date = payment_date;
		this.receiver_id = receiver_id;
		this.ipn_track_id = ipn_track_id;
		this.payer_id = payer_id;
	}
	
	
	
	public String getInvoice() {
		return invoice;
	}
	public void setInvoice(String invoice) {
		this.invoice = invoice;
	}
	public String getMc_gross() {
		return mc_gross;
	}
	public void setMc_gross(String mc_gross) {
		this.mc_gross = mc_gross;
	}
	public String getPayment_gross() {
		return payment_gross;
	}
	public void setPayment_gross(String payment_gross) {
		this.payment_gross = payment_gross;
	}
	public String getBusiness() {
		return business;
	}
	public void setBusiness(String business) {
		this.business = business;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public String getReceiver_email() {
		return receiver_email;
	}
	public void setReceiver_email(String receiver_email) {
		this.receiver_email = receiver_email;
	}
	public String getPayer_status() {
		return payer_status;
	}
	public void setPayer_status(String payer_status) {
		this.payer_status = payer_status;
	}
	public String getPayer_email() {
		return payer_email;
	}
	public void setPayer_email(String payer_email) {
		this.payer_email = payer_email;
	}
	public String getFull_post() {
		return full_post;
	}
	public void setFull_post(String full_post) {
		this.full_post = full_post;
	}
	public String getFirst_name() {
		return first_name;
	}
	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}
	public String getLast_name() {
		return last_name;
	}
	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}
	public String getProtection_eligibility() {
		return protection_eligibility;
	}
	public void setProtection_eligibility(String protection_eligibility) {
		this.protection_eligibility = protection_eligibility;
	}
	public String getPayment_status() {
		return payment_status;
	}
	public void setPayment_status(String payment_status) {
		this.payment_status = payment_status;
	}
	public String getPayment_type() {
		return payment_type;
	}
	public void setPayment_type(String payment_type) {
		this.payment_type = payment_type;
	}
	public int getItem_number() {
		return item_number;
	}
	public void setItem_number(int item_number) {
		this.item_number = item_number;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public Date getPayment_date() {
		return payment_date;
	}
	public void setPayment_date(Date payment_date) {
		this.payment_date = payment_date;
	}
	public Long getReceiver_id() {
		return receiver_id;
	}
	public void setReceiver_id(Long receiver_id) {
		this.receiver_id = receiver_id;
	}
	public Long getIpn_track_id() {
		return ipn_track_id;
	}
	public void setIpn_track_id(Long ipn_track_id) {
		this.ipn_track_id = ipn_track_id;
	}
	public Long getPayer_id() {
		return payer_id;
	}
	public void setPayer_id(Long payer_id) {
		this.payer_id = payer_id;
	} 
	
    
	
	
	
	
	
}
