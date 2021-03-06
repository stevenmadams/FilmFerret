package data;

import java.util.List;

public interface MovieDAO {
	public Movie getMovieById(int id);
	public Movie getMovieByTitle(String title);
	public Movie getMovieByGenre(String genre);
	public void addMovie(Movie movie);
	public void removeMovie(Movie movie);
	public void updateMovie(Movie movie, String title, String tagline, int year, String rating, List<MovieGenre> genre, int runtime, String url);
	public List<Movie> getAllMovies();	
}
