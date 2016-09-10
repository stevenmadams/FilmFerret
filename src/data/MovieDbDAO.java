package data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MovieDbDAO implements MovieDAO {
	private static final String url = "jdbc:mysql://localhost:3306/moviedb";
	private static final String user = "ferret";
	private static final String pword = "ferret";
	private List<Movie> movies = new ArrayList<>();

	public MovieDbDAO() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (Exception e) {
			e.printStackTrace(System.err);
		}
	}

	@Override
	public Movie getMovieById(int id) {
		Movie movie = null;
		try {
			Connection conn = DriverManager.getConnection(url, user, pword);
			String sqltxt;
			sqltxt = "SELECT id, title, tagline, year, rating, runtime, url FROM movie WHERE id = ?"; 
			PreparedStatement stmt = conn.prepareStatement(sqltxt);
			stmt.setInt(1, id);
			ResultSet rs = stmt.executeQuery();
			System.out.println("HERE");
			if(rs.next()) {
			
				movie = new Movie(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getInt(6), rs.getString(7) );
				movie.setGenre(getMovieGenre(id));
				/////movie.setGenre(getMovieGenre.); //add a for each loop to JSP
				// this is how I'll get the genres in the method getMovieGenre I will add below
				//SELECT m.title, g.value FROM movie m JOIN movie_genre mg ON m.id = mg.movie_id JOIN genre g ON mg.genre_id = g.id
				System.out.println("Movie" + movie);
			}
			
			rs.close(); 
			stmt.close();	
			conn.close();
		}
		catch (SQLException sqle){
			sqle.printStackTrace(System.err);
		}
		return movie;
		
	}

	@Override
	public Movie getMovieByTitle(String title) {
		// TODO Auto-generated method stub
		return null;
	}

	


	@Override
	public Movie getMovieByGenre(String genre) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addMovie(Movie movie) {
		// TODO Auto-generated method stub

	}

	@Override
	public void removeMovie(Movie movie) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateMovie(Movie movie, String title, String tagline, String year, String rating, String genre,
			int runtime, String url) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<Movie> getAllMovies() {
		return movies;
	}

	private ArrayList<String> getMovieGenre(int id){
		ArrayList<String> genres = new ArrayList<>();
		try {
			Connection conn = DriverManager.getConnection(url, user, pword);
			String sqltxt;
			sqltxt = "SELECT g.value FROM movie m JOIN movie_genre mg ON m.id = mg.movie_id JOIN genre g ON mg.genre_id = g.id WHERE m.id =?"; 
			PreparedStatement stmt = conn.prepareStatement(sqltxt);
			stmt.setInt(1, id);
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				genres.add(rs.getString(1));
			}
			
			rs.close(); 
			stmt.close();	
			conn.close();
		}
		catch (SQLException sqle){
			sqle.printStackTrace(System.err);
		}
		
		return genres;
		
	}
	
}
