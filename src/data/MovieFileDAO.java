//package data;
//
//import java.io.BufferedReader;
//import java.io.InputStream;
//import java.io.InputStreamReader;
//import java.util.ArrayList;
//import java.util.List;
//
//import javax.annotation.PostConstruct;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.web.context.WebApplicationContext;
//
//public class MovieFileDAO implements MovieDAO {
//	private static final String FILE_NAME="/WEB-INF/movielib.csv";
//	private List<Movie> movies = new ArrayList<>();
//
//	
//	@Autowired 
//	private WebApplicationContext wac;
//
//	@PostConstruct
//	public void init() {
//		
//		try (
//				InputStream is = wac.getServletContext().getResourceAsStream(FILE_NAME);
//				BufferedReader buf = new BufferedReader(new InputStreamReader(is));
//			) {
//			String line = buf.readLine();
//			while ((line = buf.readLine()) != null) {
//				String[] tokens = line.split(",,");
//				int id = Integer.parseInt(tokens[0]);
//				if (tokens[0] == null ) 
//					id = movies.lastIndexOf(getAllMovies())+1;
//				String title = tokens[1];
//				String tagline = tokens[2];
//				String year = tokens[3];
//				String rating = tokens[4];
//				String genre = tokens[5];
//				int runtime = Integer.parseInt(tokens[6]);
//				String url = tokens[7];
//				movies.add(new Movie(id, title, tagline, year, rating, genre, runtime, url));
//			}
//		} catch (Exception e) {
//			System.err.println(e);
//			e.printStackTrace();
//		}
//	}
//
//	@Override
//	public Movie getMovieByGenre(String genre) {
//		Movie s = null;
//		for (Movie movie : movies) {
//			if (movie.getGenre().equalsIgnoreCase(genre)) {
//				s = movie;
//				break;
//			}
//		}
//		return s;
//	}
//	@Override
//	public Movie getMovieByTitle(String title) {
//		Movie s = null;
//		for (Movie movie : movies) {
//			if (movie.getTitle().equals(title)) {
//				s = movie;
//				break;
//			}
//		}
//		return s;
//	}
//	@Override
//	public Movie getMovieById(int id) {
//		Movie s = null;
//		for (Movie movie : movies) {
//			if (movie.getId() == id) {
//				s = movie;
//				break;
//			}
//		}
//		return s;
//	}
//	@Override
//	public void addMovie(Movie movie) {
//		movies.add(movie);
//
//	}
//	
//	@Override
//	public List<Movie> getAllMovies() {
//		return movies;
//	}
//
//
//	
//	
//
//	@Override
//	public void removeMovie(Movie movie) {
//		int id = movie.getId();
//		for (int i= 0; i<movies.size(); i++){
//			if (movies.get(i).getId() == id){
//				movies.remove(i);
//				break;
//			}
//		}
//		
//		
//	}
//
//	@Override
//	public void updateMovie(Movie movie, String title, String tagline, String year, String rating, String genre, int runtime, String url) {
//		movie.setTitle(title);
//		movie.setGenre(genre);
//		movie.setTagline(tagline);
//		movie.setUrl(url);
//		movie.setRating(rating);
//		movie.setYear(year);
//		movie.setRuntime(runtime);
//	}
//	
//}
//
