package co.grandcircus.TutorApp2019.json;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown=true)
public class Geometry {
	
	Coordinates location;

	public Geometry() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Geometry(Coordinates location) {
		super();
		this.location = location;
	}

	public Coordinates getLocation() {
		return location;
	}

	public void setLocation(Coordinates location) {
		this.location = location;
	}

	@Override
	public String toString() {
		return "Geometry [location=" + location + "]";
	}
	
	

}
