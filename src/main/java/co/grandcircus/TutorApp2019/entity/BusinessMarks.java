package co.grandcircus.TutorApp2019.entity;

public class BusinessMarks extends GoogleMarks {
	
	private String name;
	private String image_url;
	private String url;
	private String address;
	private double lat;
	private double lng;
	
	public BusinessMarks() {
	}
	
	public BusinessMarks(String name, String image_url, String url, String address, double lat, double lng) {
		super();
		this.name = name;
		this.image_url = image_url;
		this.url = url;
		this.address = address;
		this.lat = lat;
		this.lng = lng;
	}

	public BusinessMarks(String name, double lat, double lng) {
		super();
		this.name = name;
		this.lat = lat;
		this.lng = lng;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getLat() {
		return lat;
	}

	public void setLat(double lat) {
		this.lat = lat;
	}

	public double getLng() {
		return lng;
	}

	public void setLng(double lng) {
		this.lng = lng;
	}
	
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getImage_url() {
		return image_url;
	}

	public void setImage_url(String image_url) {
		this.image_url = image_url;
	}

	public String getAddress() {
		return address;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
	
	@Override
	public String toString() {
		return "[\"" + name + "\", " + "\"" + image_url + "\", " + "\"" + url + "\", " + "\"" + address + "\", " + lat + ", " + lng + "]";
	}

	

}