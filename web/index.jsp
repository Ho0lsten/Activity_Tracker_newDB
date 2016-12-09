<%-- 
    Document   : index
    Created on : 01.12.2016, 16:02:14
    Author     : hools_000
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Activity Tracker</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="css/font-awesome.min.css">

    <!-- Custom Style -->
    <link rel="stylesheet" href="css/style.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>



<!-- Jumbotron -->
<div class="jumbotron">
    <div class="container">
        <h1><a href="index.jsp">Activity Tracker</a></h1>
        <p>Wir haben doch keine Zeit !</p> 
    </div>
</div><!-- /End Jumbotron -->

<!-- Header Navigation -->

   <!-- Single button -->
   <div class="container">
        <div class="col-md-4">
            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Kategorie<span class="caret"></span>
            </button>
            <ul class="dropdown-menu">
                <li><a href="Category/category_create.jsp">anlegen</a></li>
                <li><a href="Category/category_delete.jsp">löschen</a></li>
                <li><a href="Category/category_update.jsp">bearbeiten</a></li>
                <li role="separator" class="divider"></li>
                <li><a href="#">Übersicht</a></li>
            </ul>
        </div>
   <!-- Single button -->
        <div class="col-md-4" >
            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Aktivität <span class="caret"></span>
            </button>
            <ul class="dropdown-menu">
                <li><a href="Activity/activity_create.jsp">anlegen</a></li>
                <li><a href="Activity/activity_delete.jsp">löschen</a></li>
                <li><a href="Activity/activity_update.jsp">bearbeiten</a></li>
                <li role="separator" class="divider"></li>
                <li><a href="#">Übersicht</a></li>
            </ul>
        </div>
         <!-- Single button -->
        <div class="col-md-4">
            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Auswertung <span class="caret"></span>
            </button>
            <ul class="dropdown-menu">
                <li><a href="Statistics/analysis.jsp">los !</a></li>
                <li role="separator" class="divider"></li>
                <li><a href="#">Übersicht</a></li>
            </ul>
        </div>
</div>
<!-- End Header Navigation -->
        
 <div class="container">
      <!-- Example row of columns -->
      <div class="row">
        <div class="col-md-4">
          <h2>Kategorien verwalten</h2>
          <p>Erstellen Sie Kategorien für die Einordnung ihrer Aktivitäten. </p>
         
        </div>
        <div class="col-md-4">
          <h2>Aktivitäten verwalten</h2>
          <p>Dokumentieren Sie ihre Aktivitäten.</p>
         
       </div>
        <div class="col-md-4">
          <h2>Auswertung</h2>
          <p>Verschaffen Sie sich einen Überblick.</p>
         
        </div>
      </div>

      <hr>

      <footer>
        <p>&copy; 2016 MoveoMed, GmbH</p>
      </footer>
    </div> <!-- /container -->  



<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/bootstrap.min.js"></script>
