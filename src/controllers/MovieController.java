package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import data.Movie;
import data.MovieDAO;

@Controller
public class MovieController {
	@Autowired
	private MovieDAO movieDao;

	@RequestMapping(path = "ListMovies.do",
			method = RequestMethod.GET)
	public ModelAndView getMovieById() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("listMovies.jsp");
		mv.addObject("movies", movieDao.getAllMovies());
		return mv;
	}

	@RequestMapping(path = "EditMovies.do",
			method = RequestMethod.GET)
	public ModelAndView editMovies() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("editMovies.jsp");
		mv.addObject("movies", movieDao.getAllMovies());
		return mv;
	}


	@RequestMapping(path = "NewMovie.do", method = RequestMethod.POST)
	public ModelAndView newMovie(Movie movie) {
		movieDao.addMovie(movie);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("viewMovie.jsp");
		return mv;
	}
	
	
	
	
	
	@RequestMapping(path = "UpdateMovie.do", method = RequestMethod.POST)
	public ModelAndView updateMovie(@RequestParam("title") String title,
			@RequestParam("tagline") String tagline,
			@RequestParam("year") String year,
			@RequestParam("rating") String rating,
			@RequestParam("genre") String genre,
			@RequestParam("runtime") int runtime,
			@RequestParam("url") String url,
			@RequestParam("id") int id
			
			) {
	
		ModelAndView mv = new ModelAndView();
		mv.setViewName("viewMovie.jsp");
		Movie m = movieDao.getMovieById(id);
		movieDao.updateMovie(m, title , tagline, year, rating, genre, runtime, url);
		mv.addObject(m);
		return mv;
	}
	
	@RequestMapping(path = "ChangeMovie.do", method = RequestMethod.GET)
	public ModelAndView changeMovie(@RequestParam("id") int id) {
		ModelAndView mv = new ModelAndView();
		Movie movie = movieDao.getMovieById(id);
		mv.addObject("movie", movie);
		mv.setViewName("changeMovie.jsp");
		return mv;
	}
	
	
	@RequestMapping(path = "ViewMovie.do", method = RequestMethod.GET)
	public ModelAndView viewMovie(@RequestParam("id") int id) {
		ModelAndView mv = new ModelAndView();
		Movie movie = movieDao.getMovieById(id);
		mv.setViewName("viewMovie.jsp");
		mv.addObject("movie", movie);
		return mv;
	}
	
	
	
	
	@RequestMapping(path = "RemoveMovie.do", method = RequestMethod.POST)
	public ModelAndView removeMovie(Movie movie) {
		movieDao.removeMovie(movie);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("editMovies.jsp");
		mv.addObject("movies", movieDao.getAllMovies());
		return mv;
	}
}
