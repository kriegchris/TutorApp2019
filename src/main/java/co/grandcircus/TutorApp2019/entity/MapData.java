package co.grandcircus.TutorApp2019.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown=true)
public class MapData {
	
	private Integer accuracy; 
	private Coordinates location;
	
	
	public MapData(Integer accuracy, Coordinates location) {
		super();
		this.accuracy = accuracy;
		this.location = location;
	}
	
	public MapData() {
		super();
	}
	
	public Integer getAccuracy() {
		return accuracy;
	}
	public void setAccuracy(Integer accuracy) {
		this.accuracy = accuracy;
	}


	public Coordinates getLocation() {
		return location;
	}

	public void setLocation(Coordinates location) {
		this.location = location;
	} 
	
	@Override
	public String toString() {
		return "accuracy=" + accuracy + ", coordinates=" + location + "]";
	}
	
	

}
