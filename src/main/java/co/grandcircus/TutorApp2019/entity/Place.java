package co.grandcircus.TutorApp2019.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown=true)
public class Place {

	String formatted_address;
	Geometry geometry;
	public Place() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Place(String formatted_address, Geometry geometry) {
		super();
		this.formatted_address = formatted_address;
		this.geometry = geometry;
	}
	public String getFormatted_address() {
		return formatted_address;
	}
	public void setFormatted_address(String formatted_address) {
		this.formatted_address = formatted_address;
	}
	public Geometry getGeometry() {
		return geometry;
	}
	public void setGeometry(Geometry geometry) {
		this.geometry = geometry;
	}
	@Override
	public String toString() {
		return "Place [formatted_address=" + formatted_address + ", geometry=" + geometry + "]";
	}
	
	
}
