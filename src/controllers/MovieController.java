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
	public ModelAndView getMovieByIdEdit() {
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
	
	@RequestMapping(path = "ChangeMovie.do", method = RequestMethod.POST)
	public ModelAndView getMovieByIdChange(Movie movie) {
		movieDao.equals(movie);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("changeMovie.jsp");
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
