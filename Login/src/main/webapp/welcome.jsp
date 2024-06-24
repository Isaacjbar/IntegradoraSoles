<%--
  Created by IntelliJ IDEA.
  User: Isaac
  Date: 19/06/2024
  Time: 05:35 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jbar.login.model.Usuario" %>
<%@ page session="true" %>
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
                <span class="textUser text-white  d-sm-block">
                    <%
                        Usuario usuario = (Usuario) session.getAttribute("usuario");
                        if (usuario != null) {
                    %>
                    Hola, <%= usuario.getNombre() %> <%= usuario.getApellido() %><% } else { %><% response.sendRedirect("login.jsp"); %><% } %>
                </span>
            </p>
        </a>
    </div>
</nav>
<br>

<h1 class="title-1 fs-3">Gestión de Historias</h1>

<div class="container mostRecent flex-column d-flex justify-content-center align-items-center">
    <div class="mostRecent__card card shadow-sm d-flex flex-row">
        <div class="card-body">
            <h5 class="card_title card__title--modified">Título Historia</h5>
            <p class="card-text">Esta es una historia interactiva que trata de x cosa y mediante la toma de decisiones puede cambiar su curso. Debes estar atento para tomar la mejor decisión posible y llegar al final correcto.</p>
            <div class="d-flex justify-content-between
    flex-column
    flex-xl-row
    align-items-xl-center
    justify-content-xl-around
    my-xl-2
    ">
                <div class="btn-group my-xl-2">
                    <button type="button" class="btn btn-sm btn-outline-secondary btn-editar">Editar</button>
                    <button type="button" class="btn btn-sm btn-outline-secondary btn-publicar">Publicar</button>
                </div>
                <small class="text-body-secondary"><span class="ultima-mod">Últm. mod:</span> 12/8/24</small>
            </div>
        </div>
        <img class="m-auto bd-placeholder-img card-img-top img_d_card h-2" src="img/1.png" alt="1">
    </div>

    <button id="createHistoryButton" class="btn btn-success btn-positive">
        Crear nueva historia
    </button>

</div>


<hr class="my-4">

<h4 class="title-2 mt-5" >Historias creadas</h4>

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
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary btn-editar">Editar</button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary btn-publicar">Publicar</button>
                                </div>
                                <small class="text-body-secondary"><span class="ultima-mod">Últm. mod:</span> 12/8/24</small>
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
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary btn-editar">Editar</button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary btn-publicar">Publicar</button>
                                </div>
                                <small class="text-body-secondary"><span class="ultima-mod" class="ultima-mod">Últm. mod:</span> 12/8/24</small>
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
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary btn-editar">Editar</button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary btn-publicar">Publicar</button>
                                </div>
                                <small class="text-body-secondary"><span class="ultima-mod">Últm. mod:</span> 12/8/24</small>
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
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary btn-editar">Editar</button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary btn-publicar">Publicar</button>
                                </div>
                                <small class="text-body-secondary"><span class="ultima-mod">Últm. mod:</span> 12/8/24</small>
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
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary btn-editar">Editar</button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary btn-publicar">Publicar</button>
                                </div>
                                <small class="text-body-secondary"><span class="ultima-mod">Últm. mod:</span> 12/8/24</small>
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
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary btn-editar">Editar</button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary btn-publicar">Publicar</button>
                                </div>
                                <small class="text-body-secondary"><span class="ultima-mod">Últm. mod:</span> 12/8/24</small>
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
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary btn-editar">Editar</button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary btn-publicar">Publicar</button>
                                </div>
                                <small class="text-body-secondary"><span class="ultima-mod">Últm. mod:</span> 12/8/24</small>
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
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary btn-editar">Editar</button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary btn-publicar">Publicar</button>
                                </div>
                                <small class="text-body-secondary"><span class="ultima-mod">Últm. mod:</span> 12/8/24</small>
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
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary btn-editar">Editar</button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary btn-publicar">Publicar</button>
                                </div>
                                <small class="text-body-secondary"><span class="ultima-mod">Últm. mod:</span> 12/8/24</small>
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