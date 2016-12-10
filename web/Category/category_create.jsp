<%-- 
    Document   : category_create
    Created on : 02.12.2016, 12:48:37
    Author     : hools_000
--%>

<%@page import="Hibernate.HibernateUtil"%>
<%@page import="Hibernate.Category"%>
<%@page import="Category.categorySetter" %> 
<%@page import="Category.categoryGetter" %> 

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Activity Tracker - create category</title>

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
        <h1><a href="../index.jsp">Kategorien anlegen</a></h1>
        <p>aaaleng</p> 
    </div>
</div><!-- /End Jumbotron -->
<form action="category_create.jsp">

    <div class="panel panel-default">
        <div class="panel-heading">Name eingeben</div>
        <div class="panel-body">
            <input type="text" name="Name" value="" /> 
        </div>
    </div>

    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">Typ auswählen</h3>
        </div>
        <div class="panel-body">
            <select name="Typ">

                <option value="Arbeit"> Arbeit</option>      
                <option value="Privat"> Privat</option>     


            </select>
        </div>
    </div> 

    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">Beschreibung</h3>
        </div>
        <div class="panel-body">
            <input type="text" name="Beschreibung" value="" />
        </div>
    </div> 
    <input type="submit" value="speichern" >

    <%  String s1 = request.getParameter("Name");
        String s2 = request.getParameter("Typ");
        String s3 = request.getParameter("Beschreibung");

        if (s1 != null && s2 != null && s3 != null) {

            categorySetter.createCat(s1, s2, s3);

        }
    %> 
</form>

<script type="text/javascript">
<!--
    function toggle_visibility(id) {
        var e = document.getElementById(id);
        if (e.style.display == 'none')
            e.style.display = 'block';
        else
            e.style.display = 'none';
    }
//-->
</script>     
<br></br>

<a href="#" onclick="toggle_visibility('foo');">Kategorien anzeigen</a>
<br></br>

<div id="foo" class="panel panel-default">
    <!-- Default panel contents -->
    <div class="panel-heading">Kategorien</div>

    <!-- Table -->
    <table class="table" width=”600px” border=”1″ bgcolor=”#FFF380″> 
        <tr>
            <th width=”50px”>ID</th>
            <th width=”50px”>Name</th>
            <th width="400px">Beschreibung</th>
            <th width=”50px”>Typ</th>

        </tr>
        <tr>                
            <%
                Category[] CategoryArr = categoryGetter.getCategorys();
                for (int i = 0; i < CategoryArr.length; i++) {
            %> 
        <tr>
            <td><b><%=CategoryArr[i].getCategoryId()%></b></td>
             <td><b><a href="category_update.jsp?ID=<%=CategoryArr[i].getCategoryId()%>"><%=CategoryArr[i].getCategoryName()%></a></b></td>
            <td><b><%=CategoryArr[i].getCategoryDescription()%></b></td>
            <td><b><%=CategoryArr[i].getCategoryType()%></b></td>


            <%
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
