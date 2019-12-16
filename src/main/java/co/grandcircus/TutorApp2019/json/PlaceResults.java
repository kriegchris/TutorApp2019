package co.grandcircus.TutorApp2019.json;

import java.util.ArrayList;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown=true)
public class PlaceResults {

	ArrayList<Place> results;
	String status;
	
	public PlaceResults() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PlaceResults(ArrayList<Place> results, String status) {
		super();
		this.results = results;
		this.status = status;
	}

	public ArrayList<Place> getResults() {
		return results;
	}

	public void setResults(ArrayList<Place> results) {
		this.results = results;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "PlaceResults [results=" + results + ", status=" + status + "]";
	}
	
}
