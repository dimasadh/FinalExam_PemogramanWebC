package net.javaguides.movielist.model;


public class Movie {
	private String movie_id;
    private String movie_name;
    private String director;
    private String year;
    
	public Movie(String movie_id, String movie_name, String director, String year) {
		super();
		this.movie_id = movie_id;
		this.movie_name = movie_name;
		this.director = director;
		this.year = year;
	}
	public String getMovie_id() {
		return movie_id;
	}
	public void setMovie_id(String movie_id) {
		this.movie_id = movie_id;
	}
	public String getMovie_name() {
		return movie_name;
	}
	public void setMovie_name(String movie_name) {
		this.movie_name = movie_name;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
    
    
}
