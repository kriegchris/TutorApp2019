package co.grandcircus.TutorApp2019.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown=true)
public class Business {
	
	private String name;
	private String image_url;
	private String url;
	private Location location;
	
	
	public Business(String name, String image_url, String url, Location location) {
		super();
		this.name = name;
		this.image_url = image_url;
		this.url = url;
		this.location = location;
	}
	
	public Business() {
		super();
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImage_url() {
		return image_url;
	}
	public void setImage_url(String image_url) {
		this.image_url = image_url;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public Location getLocation() {
		return location;
	}
	public void setLocation(Location location) {
		this.location = location;
	}

	@Override
	public String toString() {
		return "name=" + name + "&image_url=" + image_url + "&url=" + url + "&location=" + location;
	} 
	
	
	

}
