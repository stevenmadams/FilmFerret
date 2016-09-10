package data;

public class MovieGenre {
	private int genreId;
	  private String value;
	
	  
	  public MovieGenre(int genreId, String value) {
		super();
		this.genreId = genreId;
		this.value = value;
	}
	  public MovieGenre(String value) {
		  super();
		  this.value = value;
	  }


	@Override
	public String toString() {
		return value;
	}


	public int getGenreId() {
		return genreId;
	}


	public String getValue() {
		return value;
	}


	public void setGenreId(int genreId) {
		this.genreId = genreId;
	}


	public void setValue(String value) {
		this.value = value;
	}
	  

	 
	  

}
