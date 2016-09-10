package data;

import java.sql.Array;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
				movie.setGenre(getMovieGenre(movie.getId()));
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
		try {
			Connection conn = DriverManager.getConnection(url, user, pword);
			String sqltxt;
			sqltxt = "INSERT INTO movie (title, tagline, year, rating, runtime, url) " 
			+ " VALUES(?, ?, ?, ?, ?, ?)"; 
			PreparedStatement stmt = conn.prepareStatement(sqltxt);
			stmt.setString(1, movie.getTitle());
			stmt.setString(2, movie.getTagline());
			stmt.setInt(3, movie.getYear());
			stmt.setString(4, movie.getRating());
			stmt.setInt(5, movie.getRuntime());
			stmt.setString(6, movie.getUrl());
			int uc = stmt.executeUpdate();
			System.out.println("HERE");
			if (uc == 1) {
		        System.out.println("DEBUG: MovieDbDAO.addMovie(): Movie added: " + movie);
		        ResultSet rs2 = stmt.getGeneratedKeys();
		        int newMovieId;
		        if (rs2.next()) {
		          newMovieId = rs2.getInt(1);
		          System.out.println("Movie added, id: "+newMovieId);
		          // Use newMovieId to insert each genre from movie.getGenres() as
		          // records in movie_genre
		          List<MovieGenre> syms = movie.getGenre();
		          if (syms.size() > 0) {
		            sqltxt = "INSERT INTO movie_genre (movie_id, genre_id) "
		                   + " VALUES (?, ?)";
		            stmt = conn.prepareStatement(sqltxt);
		            for (MovieGenre sym : syms) {
		              stmt.setInt(1, newMovieId);
		              stmt.setInt(2, sym.getGenreId());
		              uc = stmt.executeUpdate();
		              if (uc == 1 ) {
		                System.out.println("Added genre "+ sym);
		              }
		            }
		          }
		        }
		      }
			else {
				System.err.println("No movie added! :( ");
			}
			
			stmt.close();	
			conn.close();
		}
		catch (SQLException sqle){
			sqle.printStackTrace(System.err);
		}

	}

	@Override
	public void removeMovie(Movie movie) {
		try {
		      Connection conn = DriverManager.getConnection(url, user, pword);

		      PreparedStatement stmt = conn.prepareStatement("DELETE FROM movie WHERE id = ?");
		      stmt.setInt(1, movie.getId());
		      stmt.executeUpdate(); 
		      stmt.close();
		      conn.close();
		      
		      }
		   
	
		    catch (SQLException sqle) {
		      sqle.printStackTrace(System.err);
		    }

	}

	@Override
	public void updateMovie(Movie movie, String title, String tagline, int year, String rating, List<MovieGenre> genre, int runtime, String url) {
		try {
			Connection conn = DriverManager.getConnection(this.url, user, pword);
			String sqltxt;
			sqltxt = "UPDATE movie SET title =?, tagline=?, year=?, rating=?, runtime=?, url=? " 
			+ " WHERE id = ?"; 
	
			PreparedStatement stmt = conn.prepareStatement(sqltxt);
			stmt.setString(1, title);
			stmt.setString(2, tagline);
			stmt.setInt(3, year);
			stmt.setString(4, rating);
			stmt.setInt(5, runtime);
			stmt.setString(6, url);
			stmt.setInt(7, movie.getId());
			int uc = stmt.executeUpdate();
			System.out.println("HERE");
			if (uc == 1) {
		        System.out.println("DEBUG: MovieDbDAO.addMovie(): Movie added: " + movie);
		        ResultSet rs2 = stmt.getGeneratedKeys();
		        int newMovieId;
		        if (rs2.next()) {
		          newMovieId = rs2.getInt(1);
		          System.out.println("Movie added, id: "+newMovieId);
		          // Use newMovieId to insert each genre from movie.getGenres() as
		          // records in movie_genre
		          List<MovieGenre> syms = movie.getGenre();
		          if (syms.size() > 0) {
		            sqltxt = "UPDATE movie_genre SET movie_id =?, genre_id =? "
		                   + " WHERE id =?";
		            stmt = conn.prepareStatement(sqltxt);
		            for (MovieGenre sym : syms) {
		              stmt.setInt(1, newMovieId);
		              stmt.setInt(2, sym.getGenreId());
		              stmt.setInt(3, newMovieId);
		              uc = stmt.executeUpdate();
		              if (uc == 1 ) {
		                System.out.println("Added genre "+ sym);
		              }
		            }
		          }
		        }
		      }
			else {
				System.err.println("No movie added! :( ");
			}
			
			stmt.close();	
			conn.close();
		}
		catch (SQLException sqle){
			sqle.printStackTrace(System.err);
		}

	}

	@Override
	public List<Movie> getAllMovies() {
		ArrayList<Movie> movies = new ArrayList<>();
		try {
			Connection conn = DriverManager.getConnection(url, user, pword);
			String sqltxt = "SELECT id, title, year, url FROM movie";
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sqltxt);
			while(rs.next()) {
				movies.add(new Movie (rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4)));
			}
			
			rs.close(); 
			stmt.close();	
			conn.close();
		}
		catch (SQLException sqle){
			sqle.printStackTrace(System.err);
		}
		
		return movies;
	}

	private List<MovieGenre> getMovieGenre(int id){
		List<MovieGenre> genres = new ArrayList<>();
		try {
			Connection conn = DriverManager.getConnection(url, user, pword);
			String sqltxt;
			sqltxt = "SELECT g.value FROM movie m JOIN movie_genre mg ON m.id = mg.movie_id JOIN genre g ON mg.genre_id = g.id WHERE m.id =?"; 
			PreparedStatement stmt = conn.prepareStatement(sqltxt);
			stmt.setInt(1, id);
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				genres.add(new MovieGenre(rs.getString(1)));
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
	
//	private ArrayList<String> setMovieGenre(){
//		
//		
//		return null;
//		
//	}
	private List<MovieGenre> getMovieGenres(int id) {
	    List<MovieGenre> syms = null;
	    try {
	      Connection conn = DriverManager.getConnection(url, user, pword);
	      String sqltxt;
	      sqltxt = "SELECT g.value FROM movie m JOIN movie_genre mg ON m.id = mg.movie_id JOIN genre g ON mg.genre_id = g.id WHERE m.id =?";
	      			//g: genre
	      			//mg: movie_genre
	      			//m: movie
	      PreparedStatement stmt = conn.prepareStatement(sqltxt);
	      stmt.setInt(1, id);
	      ResultSet rs = stmt.executeQuery();
	      syms = new ArrayList<>();
	      while (rs.next()) {
	        syms.add(new MovieGenre(rs.getString(1)));
	      }
	      rs.close();
	      stmt.close();
	      conn.close();
	    }
	    catch (SQLException sqle) {
	      sqle.printStackTrace(System.err);
	    }
	    return syms;
	  }

	
}
