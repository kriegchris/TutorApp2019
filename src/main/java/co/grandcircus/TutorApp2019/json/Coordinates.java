package co.grandcircus.TutorApp2019.json;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown=true)
public class Coordinates {
	
	private Double lat;
	private Double lng;
	
	
	public Coordinates(Double lat, Double lng) {
		super();
		this.lat = lat;
		this.lng = lng;
	}

	public Coordinates() {
		super();
	}
	
	public Double getLat() {
		return lat;
	}
	public void setLat(Double lat) {
		this.lat = lat;
	}
	public Double getLng() {
		return lng;
	}
	public void setLng(Double lng) {
		this.lng = lng;
	}

	@Override
	public String toString() {
		return "lat=" + lat + "&lng=" + lng;
	}
	
	

}
