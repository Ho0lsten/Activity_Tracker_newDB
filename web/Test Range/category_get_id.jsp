<%-- 
    Document   : category_get_id
    Created on : 08.12.2016, 14:00:01
    Author     : MM-Produktion
--%>

<%@page import="Hibernate.HibernateUtil"%>
<%@page import="Category.categoryGetter"%>
<%@page import="Hibernate.Category"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Activity Tracker - create activity</title>

    <!-- Bootstrap -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="../css/font-awesome.min.css">

    <!-- Custom Style -->
    <link rel="stylesheet" href="../css/style.css">

    <!-- Combodate.js -->
    <link rel="javascript" href="../css/combodate.js">


    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
    <body>
        <form action="single_category_overview.jsp">
            <input type="text" name="ID">
            <input type="submit" value="einlesen">

            <% // String s0 = request.getParameter("ID");
              //  if (s0 != null) {
               //     Category cat = categoryGetter.getCategoryById(Integer.parseInt(s0));
                 //   String s1 = cat.getCategoryName();
                    // out.println(s1);
                 //   String s2 = cat.getCategoryDescription();
                    // out.println(s2);
                 //   String s3 = cat.getCategoryType();
                    // out.println(s3);
                    // Array s4[] = cat.getActivities();            

                    // request.setAttribute("Type", s3);
                    // request.setAttribute("Activities", s3);
                //}
            %> 

        </form>
            
            <table class="table" width=”600px” border=”1″ bgcolor=”#FFF380″> 
    <tr>
        <th width=”100px”>ID</th>
        <th width=”100px”>Name</th>
        <th width="100px">Beschreibung</th>
        <th width=”100px”>Typ</th>

    </tr>
    <tr>                
        <%
            Category[] CategoryArr = categoryGetter.getCategorys();
            for (int i = 0; i < CategoryArr.length; i++) {
                
        %> 
    <tr>
        <td><b><%=CategoryArr[i].getCategoryId()%></b></td>
        <td><b><a href="single_category_overview.jsp?ID=<%=CategoryArr[i].getCategoryId()%>"><%=CategoryArr[i].getCategoryName()%></a></b></td>
        <td><b><%=CategoryArr[i].getCategoryDescription()%></b></td>
        <td><b><%=CategoryArr[i].getCategoryType()%></b></td>


        <%
            }
            HibernateUtil.getSessionFactory().getCurrentSession().disconnect();

        %>               
    </tr>
</table>
    </body>
</html>
