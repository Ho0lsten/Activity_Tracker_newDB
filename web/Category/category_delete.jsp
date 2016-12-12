<%-- 
    Document   : category_delete
    Created on : 02.12.2016, 12:48:56
    Author     : hools_000
--%>

<%@page import="java.util.Arrays"%>
<%@page import="java.lang.reflect.Array"%>
<%@page import="Category.categoryGetter"%>
<%@page import="Hibernate.Category"%>
<%@page import="Hibernate.HibernateUtil"%>
<%@page import="Category.categoryDelete"%>
<%@page import="Category.categorySetter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String[] checked = request.getParameterValues("checker");
    out.println(Arrays.toString(checked));
    if (checked != null) {
        for (int i = 0; i < checked.length; i++) {
            String id = checked[i];
            out.println(id);
            Integer catid = Integer.parseInt(id);
            categoryDelete.categoryDeleteById(catid);
        }
    }%>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Activity Tracker - delete category</title>

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
        <h1><a href="../index.jsp">Kategorien löschen.</a></h1>
        <p>Tipp: Kategorien können nur gelöscht werden wenn keine Aktivitäten auf ihnen gebucht sind.</p> 
    </div>
</div><!-- /End Jumbotron -->
<div class="panel panel-default">
    <div class="panel-heading">Löschen via ID</div>
    <div class="panel-body">


        <form action="category_delete.jsp">

            <input type="text" name="ID">
            <input type="submit" value="OK">
            <% String s1 = request.getParameter("ID");
                try {
                    if (s1 != null) {
                        categoryDelete.categoryDeleteById(Integer.parseInt(s1));
                    }
                } catch (Exception e) {
                    out.println("Bitte gültige ID eingeben!");
                }
            %>
        </form>
    </div>
</div>
<script type="text/javascript">

    function toggle_visibility(id) {
        var e = document.getElementById(id);
        if (e.style.display === 'none')
            e.style.display = 'block';
        else
            e.style.display = 'none';
    }

</script>
<br></br>

<a class="btn btn-default" href="#" onclick="toggle_visibility('foo');">Kategorien anzeigen</a>
<br></br>

<div  id="foo" class="panel panel-default" style="display:none;">
    <!-- Default panel contents -->
    <div class="panel-heading">Kategorien</div>

    <!-- Table -->
    <table class="table" width=”600px” border=”1″ bgcolor=”#FFF380″> 
        <tr>
            <th width=”100px”>ID</th>
            <th width=”100px”>Name</th>
            <th width="100px">Beschreibung</th>
            <th width=”100px”>Typ</th>
            <th width=”100px”>Löschen</th>

        </tr>
        <tr> 
        <form action="category_delete.jsp" method="POST">
            <%
                Category[] CategoryArr = categoryGetter.getCategorys();
                for (int i = 0; i < CategoryArr.length; i++) {
            %> 
            <tr>
                <td><b><%=CategoryArr[i].getCategoryId()%></b></td>
                <td><b><%=CategoryArr[i].getCategoryName()%></b></td>
                <td><b><%=CategoryArr[i].getCategoryDescription()%></b></td>
                <td><b><%=CategoryArr[i].getCategoryType()%></b></td>
                <td><input type="checkbox" name="checker" value="<%=CategoryArr[i].getCategoryId()%>"></td>                


                <% }

                    HibernateUtil.getSessionFactory().getCurrentSession().disconnect();

                %>   



        

        </tr>

    </table>
</div>


<div>
    <input type="submit" value="löschen">
</div>
</form>

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
