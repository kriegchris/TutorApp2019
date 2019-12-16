package co.grandcircus.TutorApp2019.json;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown=true)
public class BusinessResults {
	
	private List<Business> businesses;
	private Integer total;
	
	
	public BusinessResults(List<Business> businesses, Integer total) {
		super();
		this.businesses = businesses;
		this.total = total;
	}
	
	public BusinessResults() {
		super();
	}

	public List<Business> getBusinesses() {
		return businesses;
	}
	public void setBusinesses(List<Business> businesses) {
		this.businesses = businesses;
	}
	public Integer getTotal() {
		return total;
	}
	public void setTotal(Integer total) {
		this.total = total;
	}

	@Override
	public String toString() {
		return "businesses=" + businesses + "&total=" + total;
	}
	
	

}
