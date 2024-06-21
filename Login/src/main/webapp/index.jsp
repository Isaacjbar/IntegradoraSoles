<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="bootstrap-5.2.3-dist/css/bootstrap.css">
  <link rel="stylesheet" href="css/stylesIndex.css">
  <link rel="stylesheet" href="css/global.css">
  <link rel="icon" href="img/Logo1.png">
  <title>Gestionar Historias</title>
</head>
<body>
<!-- Navbar -->
<nav id="navbar1" class="navbar navbar-dark bg-dark shadow-sm">
  <div class="container d-flex align-items-center">
    <a id="logo" href="/" class="navbar-brand d-flex align-items-center h-100">
      <svg style="margin-right: .4em; border:2px solid white; border-radius:50%
            ; padding: 2px;" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor"
           class="bi bi-signpost-split-fill" viewBox="0 0 16 16">
        <path
                d="M7 16h2V6h5a1 1 0 0 0 .8-.4l.975-1.3a.5.5 0 0 0 0-.6L14.8 2.4A1 1 0 0 0 14 2H9v-.586a1 1 0 0 0-2 0V7H2a1 1 0 0 0-.8.4L.225 8.7a.5.5 0 0 0 0 .6l.975 1.3a1 1 0 0 0 .8.4h5z" />
      </svg>
      <strong class="app-name-text fs-6">Histority</strong>
    </a>
    <a class="userSession text-decoration-none" href="">
      <p class="text-white d-flex align-items-center justify-content-around">
        <span class="textUser text-white  d-sm-block">Federico Casillas</span> <svg
              xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor"
              class="bi bi-person-circle" viewBox="0 0 16 16">
        <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0" />
        <path fill-rule="evenodd"
              d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8m8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1" />
      </svg>
      </p>
    </a>
  </div>
</nav>
<br>

<h1 class="title-1 fs-3">Gestión de Historias</h1>



<hr class="my-4">

<h4 class="title-2 mt-5" >Historias interactivas creadas</h4>

<div class="searchBar1 container w-50">
  <form class="d-flex flex-md-row align-items-center  justify-content-between searchBar1__form" role="search">
    <input class="searchBar1-input form-control me-2 " type="search" placeholder="Búsque una historia por titulo"
           aria-label="Search">
    <!-- <button id="buscarUsuario" class="btn btn-outline-success btn-positive my-3" type="submit">Buscar</button> -->
    <button class="btn btn-search">
      <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-search search-icon" viewBox="0 0 16 16">
        <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"/>
      </svg></button>
  </form>
</div>

<main>
  <div class="album py-3 bg-body-tertiary">
    <div class="container">

      <div class="row row-cols-1 row-cols-sm-2 row-cols-lg-3 g-3">
        <div class="col">
          <div class="card shadow-sm  card-normal">
            <!-- class="bd-placeholder-img card-img-top" -->
            <img class="bd-placeholder-img card-img-top img_d_card" src="img/1.png" alt="1">
            <div class="card-body">
              <h5 class="card_title">Título Historia</h5>
              <!-- <hr> -->
              <p class="card-text">Esta es una historia interactiva que trata de x cosa y mediante la toma de decisiones puede cambiar su curso. Debes estar atento para tomar la mejor decisión posible y llegar al final correcto.</p>
              <div class="d-flex justify-content-between flex-column text-center flex-lg-row align-items-center">

                <small class="text-body-secondary"><span class="ultima-mod">Autor:</span> Federico Casillas</small>
              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card shadow-sm card-normal">
            <img class="bd-placeholder-img card-img-top img_d_card" src="img/2.png" alt="2">
            <div class="card-body">
              <h5 class="card_title">Título Historia</h5>
              <p class="card-text">Esta es una historia interactiva que trata de x cosa y mediante la toma de decisiones puede cambiar su curso. Debes estar atento para tomar la mejor decisión posible y llegar al final correcto.</p>
              <div class="d-flex justify-content-between flex-column text-center flex-lg-row align-items-center">

                <small class="text-body-secondary"><span class="ultima-mod" class="ultima-mod">Autor:</span> Federico Casillas</small>
              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card shadow-sm  card-normal">
            <img class="bd-placeholder-img card-img-top img_d_card" src="img/3.png" alt="3">
            <div class="card-body">
              <h5 class="card_title">Título Historia</h5>
              <p class="card-text">Esta es una historia interactiva que trata de x cosa y mediante la toma de decisiones puede cambiar su curso. Debes estar atento para tomar la mejor decisión posible y llegar al final correcto.</p>
              <div class="d-flex justify-content-between flex-column text-center flex-lg-row align-items-center">

                <small class="text-body-secondary"><span class="ultima-mod">Autor:</span> Federico Casillas</small>
              </div>
            </div>
          </div>
        </div>

        <div class="col">
          <div class="card shadow-sm card-normal">
            <img class="bd-placeholder-img card-img-top img_d_card" src="img/4.png" alt="4">
            <div class="card-body">
              <h5 class="card_title">Título Historia</h5>
              <p class="card-text">Esta es una historia interactiva que trata de x cosa y mediante la toma de decisiones puede cambiar su curso. Debes estar atento para tomar la mejor decisión posible y llegar al final correcto.</p>
              <div class="d-flex justify-content-between flex-column text-center flex-lg-row align-items-center">

                <small class="text-body-secondary"><span class="ultima-mod">Autor:</span> Federico Casillas</small>
              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card shadow-sm card-normal">
            <img class="bd-placeholder-img card-img-top img_d_card" src="img/5.png" alt="5">
            <div class="card-body">
              <h5 class="card_title">Título Historia</h5>
              <p class="card-text">Esta es una historia interactiva que trata de x cosa y mediante la toma de decisiones puede cambiar su curso. Debes estar atento para tomar la mejor decisión posible y llegar al final correcto.</p>
              <div class="d-flex justify-content-between flex-column text-center flex-lg-row align-items-center">

                <small class="text-body-secondary"><span class="ultima-mod">Autor:</span> Federico Casillas</small>
              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card shadow-sm card-normal">
            <img class="bd-placeholder-img card-img-top img_d_card" src="img/6.png" alt="6">
            <div class="card-body">
              <h5 class="card_title">Título Historia</h5>
              <p class="card-text">Esta es una historia interactiva que trata de x cosa y mediante la toma de decisiones puede cambiar su curso. Debes estar atento para tomar la mejor decisión posible y llegar al final correcto.</p>
              <div class="d-flex justify-content-between flex-column text-center flex-lg-row align-items-center">

                <small class="text-body-secondary"><span class="ultima-mod">Autor:</span> Federico Casillas</small>
              </div>
            </div>
          </div>
        </div>

        <div class="col">
          <div class="card shadow-sm card-normal">
            <img class="bd-placeholder-img card-img-top img_d_card" src="img/7.png" alt="7">
            <div class="card-body">
              <h5 class="card_title">Título Historia</h5>
              <p class="card-text">Esta es una historia interactiva que trata de x cosa y mediante la toma de decisiones puede cambiar su curso. Debes estar atento para tomar la mejor decisión posible y llegar al final correcto.</p>
              <div class="d-flex justify-content-between flex-column text-center flex-lg-row align-items-center">

                <small class="text-body-secondary"><span class="ultima-mod">Autor:</span> Federico Casillas</small>
              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card shadow-sm card-normal">
            <img class="bd-placeholder-img card-img-top img_d_card" src="img/8.png" alt="8">
            <div class="card-body">
              <h5 class="card_title">Título Historia</h5>
              <p class="card-text">Esta es una historia interactiva que trata de x cosa y mediante la toma de decisiones puede cambiar su curso. Debes estar atento para tomar la mejor decisión posible y llegar al final correcto.</p>
              <div class="d-flex justify-content-between flex-column text-center flex-lg-row align-items-center">

                <small class="text-body-secondary"><span class="ultima-mod">Autor:</span> Federico Casillas</small>
              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card shadow-sm card-normal">
            <img class="bd-placeholder-img card-img-top img_d_card" src="img/9.png" alt="9">
            <div class="card-body">
              <h5 class="card_title">Título Historia</h5>
              <p class="card-text">Esta es una historia interactiva que trata de x cosa y mediante la toma de decisiones puede cambiar su curso. Debes estar atento para tomar la mejor decisión posible y llegar al final correcto.</p>
              <div class="d-flex justify-content-between flex-column text-center flex-lg-row align-items-center">

                <small class="text-body-secondary"><span class="ultima-mod">Autor:</span> Federico Casillas</small>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

</main>

<footer class="d-flex flex-wrap justify-content-center align-items-center mt-4 border-top">
  <p class="col-md-4 mb-0 text-body-secondary d-flex justify-content-center">&copy; 2024 Histority SA</p>
</footer>

<script src="bootstrap-5.2.3-dist/js/bootstrap.js"> </script>
</body>
</html>