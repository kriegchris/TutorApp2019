package co.grandcircus.TutorApp2019.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown=true)
public class MapData {
	
	private Integer accuracy; 
	private Location location;
	
	
	public MapData(Integer accuracy, Location location) {
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
	public Location getLocation() {
		return location;
	}
	public void setLocation(Location location) {
		this.location = location;
	}

	@Override
	public String toString() {
		return "MapData [accuracy=" + accuracy + ", location=" + location + "]";
	} 
	
	

}
