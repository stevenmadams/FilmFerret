<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<head>

  <!-- Basic Page Needs
  –––––––––––––––––––––––––––––––––––––––––––––––––– -->
  <meta charset="utf-8">
  <title>Your page title here :)</title>
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

    <div class="row">
      <div class="four columns" style="margin-top: 5%">
        <div class="one-half column center" style="margin-top: 5%">
          <img class="animated bounceInLeft img-responsive" src="img/ferretflip.gif">
        </div>
      </div>
      <div class="eight columns" style="margin-top: 5%">
        <div class="container text-center">
          <div class="row" style="
    height: 300px;
    overflow: scroll;">
    <form action="UpdateMovie.do" method="POST">
      <input type="hidden" value = "${movie.id }" name ="id">
            <h3>Title:</h3>
            <input id ="title" type="text" name="title" required value="${movie.title}"/><br/>
            <h3>Tagline:</h3>
            <input  type="text" name="tagline"required value="${movie.tagline}"/><br/>
            <h3>Year:</h3>
            <input  type="number" name="year" max="2016" min="1900" required value="${movie.year}" /><br/>
        <h3>Rating:</h3>


        <select name= "rating" class="form-control form-control-lg form-check-inline " required>

          <option id="none" value="none">None</option>
          <option id="G" value="G">G</option>
          <option id="PG" value="PG" >PG</option>
          <option id="PG-13" value="PG-13" >PG-13</option>
          <option id="R"  value="R">R</option>

        </select>



          <h3>Genre:</h3>
          <span>
           <label><input id="1" type="checkbox" name="genre" value="Action"> Action</label>
           <label><input id="2" type="checkbox" name="genre" value="Adventure"> Adventure</label>
           <label><input id="3" type="checkbox" name="genre" value="Animated"> Animated</label>
          <label><input id="16" type="checkbox" name="genre" value="Biography"> Biography</label>
           <label><input id="4" type="checkbox" name="genre" value="Comedy"> Comedy </label>
          <label><input id="5" type="checkbox" name="genre" value="Crime"> Crime</label>
          <label><input id="6" type="checkbox" name="genre" value="Documentary"> Documentary</label>
          <label><input id="7" type="checkbox" name="genre" value="Drama"> Drama</label>
          <label><input id="17" type="checkbox" name="genre" value="Family"> Family</label>
          <label><input id="8" type="checkbox" name="genre" value="Fantasy"> Fantasy</label>
          <label><input id="9" type="checkbox" name="genre" value="History"> History</label>
          <label><input id="10" type="checkbox" name="genre" value="Horror"> Horror</label>
          <label><input id="19" type="checkbox" name="genre" value="Music"> Music</label>
          <label><input id="11" type="checkbox" name="genre" value="Mystery"> Mystery</label>
          <label><input id="12" type="checkbox" name="genre" value="Romance"> Romance</label>
          <label><input id="13" type="checkbox" name="genre" value="Sci-Fi"> Sci-Fi</label>
          <label><input id="18" type="checkbox" name="genre" value="Sport"> Sport</label>
          <label><input id="14" type="checkbox" name="genre" value="Thriller"> Thriller</label>
          <label><input id="20" type="checkbox" name="genre" value="War"> War</label>
          <label><input id="15" type="checkbox" name="genre" value="Western"> Western</label>

  </span>


            <h3>Runtime:</h3>
            <input type="number" name="runtime" min="0" max="999" required value="${movie.runtime}"/><br/>
            <h3>Poster URL</h3>
            <input type="url" name="url" value="${movie.url}"/><br/>
            <input type="submit" class="btn btn-primary" value="Add Movie" />

          </form>
        </div>
        </div>
      </div>
    </div>
  </div>

<!-- End Document
  –––––––––––––––––––––––––––––––––––––––––––––––––– -->
