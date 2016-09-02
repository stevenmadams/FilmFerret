package data;

public class Movie {
	private int id;
	private String title;
	private String tagline;
	private String year;
	private String rating;
	private String genre;
	private int runtime;
	private String url;

	public Movie() {
	}

	public Movie(int id, String title, String tagline, String year, String rating, String genre, int runtime, String url) {
		super();
		this.id = id;
		this.title = title;
		this.tagline = tagline;
		this.year = year;
		this.rating = rating;
		this.genre = genre;
		this.runtime = runtime;
		this.url = url;
	}

	public int getId() {
		return id;
	}

	public String getTitle() {
		return title;
	}

	public String getTagline() {
		return tagline;
	}

	public String getYear() {
		return year;
	}

	public String getRating() {
		return rating;
	}

	public String getGenre() {
		return genre;
	}

	public int getRuntime() {
		return runtime;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setTagline(String tagline) {
		this.tagline = tagline;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public void setRating(String rating) {
		this.rating = rating;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public void setRuntime(int runtime) {
		this.runtime = runtime;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	@Override
	public String toString() {
		return "Movie [id=" + id + ", title=" + title + ", tagline=" + tagline + ", year=" + year + ", rating=" + rating
				+ ", genre=" + genre + ", runtime=" + runtime + ", url=" + url + "]";
	}


	
	
	
}
