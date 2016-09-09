<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add a Movie!</title>
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
				<li ><a href="index.html">Home</a></li>
				<li><a href="ListMovies.do">List Movies</a></li>
				<li><a href="newMovie.html">Add Movie</a></li>
				<li class="active"><a href="EditMovies.do">Edit Movies</a></li>
			</ul>
		</div>
	</div>
</nav>


</header>


<div class="container text-center">

	<h1>Add your movie info:</h1>
	<form action="UpdateMovie.do" method="POST">
		<input type="hidden" value = "${movie.id }" name ="id">
		<h3>Title:</h3>
		<input class="form-control form-control-lg text-center" type="text" name="title" value="${movie.title}"/><br/>
		<h3>Tagline:</h3>
		<input class="form-control form-control-lg text-center" type="text" name="tagline" value="${movie.tagline}"/><br/>
		<h3>Year:</h3>
		<input class="form-control form-control-lg text-center" type="text" name="year" value="${movie.year}"/><br/>
<h3>Rating:</h3>


<select class="form-control form-control-lg text-center" selected ="${movie.rating}" name="rating">
  <option value="G">G</option>
  <option value="PG" >PG</option>
  <option value="PG-13" >PG-13</option>
  <option value="R">R</option>
</select>



	<h3>Genre:</h3>
<label class="form-check-inline">
  <input  type="radio" name="genre" value="Action" >Action</label>
	<label class="form-check-inline">
  <input type="radio" name="genre" value="Adventure" >Adventure</label>
	<label class="form-check-inline">
  <input type="radio" name="genre" value="Comedy" >Comedy</label>
<label class="form-check-inline">
  <input type="radio" name="genre" value="Documentary" >Documentary</label>
<label class="form-check-inline">
	<input type="radio" name="genre" value="Drama" >Drama</label>
<label class="form-check-inline">
	<input type="radio" name="genre" value="Horror" >Horror</label>
<label class="form-check-inline">
	<input type="radio" name="genre" value="Independent" >Independent</label>
<label class="form-check-inline">
  <input type="radio" name="genre" value="Musical" >Musical</label>
<label class="form-check-inline">
  <input type="radio" name="genre" value="Romance" >Romance</label>
<label class="form-check-inline">
	<input type="radio" name="genre" value="Sci-Fi" >Sci-Fi</label>
<label class="form-check-inline">
  <input type="radio" name="genre" value="Thriller" >Thriller</label>
<label class="form-check-inline">
	<input type="radio" name="genre" value="Western" >Western</label>



		<h3>Runtime:</h3>
		<input type="text" class="form-control form-control-lg text-center" name="runtime" value ="${movie.runtime}"/><br/>
		<h3>Poster URL</h3>
		<input type="text" class="form-control form-control-lg text-center" name="url" value ="${movie.url}"/><br/>
		<input type="submit" class="btn btn-primary" value="Update Movie" />
	</form>

</div>
</body>
</html>
