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
<body>
	  <!-- END OD NAV -->
<div class="container">

<div class="table-responsive">
	<table action = "EditMovies.do" method="GET" class="table">
		<tr>
			<th>Title</th>
			<th>Year</th>
			<th>Genre</th>
			<th>Rating</th>
			<th>Runtime</th>
			<th>Delete</th>
			<th>Edit</th>
		</tr>
<c:forEach items="${movies}" var="movie">
    <tr>
        <td><c:out value="${movie.title}"/></td>
				  <td><c:out value="${movie.year}"/></td>
        <td><c:out value="${movie.genre}"/></td>
				  <td><c:out value="${movie.rating}"/></td>
					  <td><c:out value="${movie.runtime}"/></td>

        <td>
					<form action="RemoveMovie.do" method="POST">
							<input type="hidden" name="id" value="${movie.id}" />
							<button type="submit" class="btn btn-danger"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></button>
						</form></td>
						<td><form action="ChangeMovie.do" method="GET">
									<input type="hidden" name="id" value="${movie.id}" />
									<button type="submit" class="btn btn-warning"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span></button>
								</form> </td>
    </tr>
</c:forEach>
</table>
</div>
</div>
</body>
</html>
