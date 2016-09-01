package data;

import java.util.List;

public interface MovieDAO {
	public Movie getMovieById(int id);
	public Movie getMovieByTitle(String title);
	public Movie getMovieByIdEdit(int id);
	public Movie getMovieByIdChange(int id);
	public Movie getMovieByGenre(String genre);
	public void addMovie(Movie movie);
	public void removeMovie(Movie movie);
	public List<Movie> getAllMovies();
	
}
