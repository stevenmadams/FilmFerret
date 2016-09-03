<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
  <title>FilmFerret</title>
  <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/custom.css">
    <link href="https://fonts.googleapis.com/css?family=Exo+2" rel="stylesheet">
    <script src="js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
    <link rel="icon" href="/favicon.ico" type="image/x-icon">

</head>
<body>
  <div class="dip">
        <a href="index.html"> <img id="logo-main" src="img/filmferretlogomd.png" width="100" alt="FilmFerret"></img></a>
  </div>
<header role="banner">

  <nav class="navbar navbar-inverse">
    <div class="container-fluid">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
      </div>
      <div class="collapse navbar-collapse" id="myNavbar">
        <ul class="nav navbar-nav">
          <li class="active"><a href="#">Home</a></li>
          <li><a href="ListMovies.do">List Movies</a></li>
          <li><a href="newMovie.html">Add Movie</a></li>
          <li><a href="EditMovies.do">Edit Movies</a></li>
        </ul>
      </div>
    </div>
  </nav>


</header>

	  <!-- END OD NAV -->
	<c:choose>
		<c:when test="${! empty movie}">

				<div class="jumbotron">
					<div class="container">
					<div class="col-sm-4">
						<center>
						<img class="img-fluid img-responsive" src="${movie.url}" alt="${movie.title} Poster">
						</center>
				</div>
					<div class="col-sm-8">
						<h1>${movie.title}</h1>
						<p>(${movie.year})</p>
						<h3><i>${movie.tagline}</i></h3>
						<hr>

							<hr>
							<h4>${movie.genre}</h4>
							<hr>
							<p>${movie.runtime} mins | Rated ${movie.rating}</p>

					</div>
				</div>
			</div>



<%-- <div class="col-md-3">
			<div class="card text-center">
	  <img class="card-img-top" src="${movie.url}" alt="Card image cap">
	  <div class="card-block">
	    <h4 class="card-title">${movie.title}</h4>
	    <p class="card-text"><i>${movie.tagline}</i></p>
	  </div>
	  <ul class="list-group list-group-flush">
	    <li class="list-group-item">${movie.year}</li>
	    <li class="list-group-item">${movie.genre}</li>
	    <li class="list-group-item">${movie.rating}</li>
			<li class="list-group-item">${movie.runtime}</li>
	  </ul>
	</div>
</div> --%>
		</c:when>
		<c:otherwise>
			<p>No movie found</p>
		</c:otherwise>
	</c:choose>

	<div class="row homebuttons">
	    <a href="ListMovies.do">
	    <div class="col-md-4 list">

	      <h1>LIST</h1>
	      <h1><span class="glyphicon glyphicon-list" aria-hidden="true"></span></h1>

	  </div>
	</a>
	<a href="EditMovies.do">
	    <div class="col-md-4 edit">

	      <h1>EDIT</h1>
	      <h1><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></h1>

	  </div>
	</a>
	<a href="newMovie.html">
	    <div class="col-md-4 add">

	      <h1>ADD</h1>
	      <h1><span class="glyphicon glyphicon-plus" aria-hidden="true"></span></h1>

		</div>
	</a>
	</div>



	<footer class="container-fluid text-center">
	  <p>Footer Text</p>
	</footer>



</body>
</html>
