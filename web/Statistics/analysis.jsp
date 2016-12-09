<%-- 
    Document   : analysis
    Created on : 02.12.2016, 12:52:45
    Author     : hools_000
--%>

<%@page import="parser.durationCalc"%>
<%@page import="Activity.activityGetter"%>
<%@page import="Hibernate.Activity"%>
<%@page import="Hibernate.Activity"%>
<%@page import="Hibernate.HibernateUtil"%>
<%@page import="Category.categoryGetter"%>
<%@page import="Hibernate.Category"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Activity Tracker - show analysis</title>

    <!-- Bootstrap -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="../css/font-awesome.min.css">

    <!-- Custom Style -->
    <link rel="stylesheet" href="../css/style.css">

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
        <h1><a href="../index.jsp">Auswertung deiner Daten</a></h1>
        <p>queryn</p> 
    </div>
</div><!-- /End Jumbotron -->
<div>
    <div class="panel panel-default">
        <div class="panel-heading">Typ auswählen</div>
        <div class="panel-body">
            <lable>Privat<input type="checkbox" name="checker" value="Privat"></lable>
            <lable>Arbeit<input type="checkbox" name="checker" value="Arbeit"></lable>
        </div>
    </div>

    <div class="panel panel-default">
        <div class="panel-heading">Kategorie auswählen</div>
        <div class="panel-body">
            <select name="Kategorien">

                <%
                    Category[] CategoryArr = categoryGetter.getCategorys();
                    Activity[] ActivityArr = activityGetter.getActivities();
                    for (int i = 0; i < CategoryArr.length; i++) {

                %> 

                <option value="<%=CategoryArr[i].getCategoryId()%>"><%=CategoryArr[i].getCategoryName()%></option>        

                <%
                    }
                    HibernateUtil.getSessionFactory().getCurrentSession().disconnect();

                %>
            </select>
        </div>
    </div>




</div>

<a href="#" onclick="toggle_visibility('foo');">Aktivitäten anzeigen</a>
<br></br>

<div id="foo" class="panel panel-default">
    <!-- Default panel contents -->
    <div class="panel-heading">Aktivitäten</div>
    <!-- Table -->
    <table class="table" width=”600px” border=”1″ bgcolor=”#FFF380″> 
        <tr>
            <th width=”100px”>ID</th>
            <th width=”100px”>Name</th>
            <th width=”100px”>Beschreibung</th>
            <th width=”100px”>Typ</th>
            <th width=”100px”>Dauer</th>
        </tr>
        <tr>                
            <%                for (int i = 0; i < CategoryArr.length; i++) {
                    if (CategoryArr != null) {

            %> 
        <tr>
            <td><b><%=CategoryArr[i].getCategoryId()%></b></td>
            <td><b><%=CategoryArr[i].getCategoryId()%>"><%=CategoryArr[i].getCategoryName()%></b></td>
            <td><b><%=CategoryArr[i].getCategoryDescription()%></b></td>
            <td><b><%=CategoryArr[i].getCategoryType()%></b></td>
            <td><b><%=durationCalc.calculateDuration(ActivityArr[i].getActivityStartTime(), ActivityArr[i].getActivityEndTime())%></b></td>


            <%
                    }
                }
                HibernateUtil.getSessionFactory().getCurrentSession().disconnect();

            %>               
        </tr>
    </table>
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
</html>
