<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<head>

  <!-- Basic Page Needs
  –––––––––––––––––––––––––––––––––––––––––––––––––– -->
  <meta charset="utf-8">
  <title>FilmFerret EDIT</title>
  <meta name="description" content="">
  <meta name="author" content="">

  <!-- Mobile Specific Metas
  –––––––––––––––––––––––––––––––––––––––––––––––––– -->
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- FONT
  –––––––––––––––––––––––––––––––––––––––––––––––––– -->
  <link href="//fonts.googleapis.com/css?family=Raleway:400,300,600" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Exo+2" rel="stylesheet">


  <!-- CSS
  –––––––––––––––––––––––––––––––––––––––––––––––––– -->
  <link rel="stylesheet" href="css/stevens.css">
  <link rel="stylesheet" href="css/normalize.css">
  <link rel="stylesheet" href="css/skeleton.css">

  <!-- Script
  –––––––––––––––––––––––––––––––––––––––––––––––––– -->
  <script src="https://use.fontawesome.com/f3e697ff49.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
  <!-- Favicon
  –––––––––––––––––––––––––––––––––––––––––––––––––– -->
  <link rel="icon" type="image/png" href="images/favicon.png">

</head>
<body>

  <!-- Menu
  –––––––––––––––––––––––––––––––––––––––––––––––––– -->

    <div class="row" style="margin: 2%">
      <div class="navfont">
      <div class="two columns center">
        <a href="index.html"><img src="img/filmferretlogomd.png" width="100" alt="FilmFerret"></a>
      </div>
      <div class="four columns">
        <a href="index.html"><h1 class="center">FilmFerret</h1></a>
      </div>

      <div class="two columns">
        <a href="ListMovies.do">
        <i class="fa fa-list fa-3x" aria-hidden="true"></i>
        <h6>LIST MOVIES</h6>
      </a>
      </div>
      <div class="two columns">
        <a href="newMovie.html">
        <i class="fa fa-film fa-3x" aria-hidden="true"></i>
        <h6>ADD MOVIES</h6>
      </a>
      </div>
      <div class="two columns">
        <a href="EditMovies.do">
        <i class="fa fa-pencil-square-o fa-3x" aria-hidden="true"></i>
        <h6>EDIT MOVIES</h6>
      </a>
      </div>
    </div>
    </div>
    <hr>
  </div>
  <!-- Primary Page Layout
  –––––––––––––––––––––––––––––––––––––––––––––––––– -->

  <div class="container">


		<div action="EditMovies.do" method="GET">
  <div class ="center">
  <img class="center animated flipInX" src="img/filmstrip.png" style="size: 50%">
  </div>
  <hr>
			<c:forEach items="${movies}" var="movie">
				<div class="row">
					<div class="eight columns">
						<h4>
							<c:out value="${movie.title}" />
						</h4>
						<p>
							<c:out value="${movie.year}" />
						</p>
					</div>
					<div class="four columns center">


									<form action="RemoveMovie.do" method="POST">
										<input type="hidden" name="id" value="${movie.id}" />
										<button type="submit" class="button">
                      <i class="fa fa-trash fa-3x" aria-hidden="true"></i>
										</button>
									</form>
							
									<form action="ChangeMovie.do" method="GET">
										<input type="hidden" name="id" value="${movie.id}" />
										<button type="submit" class="button">
											<i class="fa fa-pencil fa-3x" aria-hidden="true"></i>
										</button>
									</form>

					</div>


				</div>
				<hr>
			</c:forEach>
		</div>
	</div>


<!-- End Document
  –––––––––––––––––––––––––––––––––––––––––––––––––– -->
