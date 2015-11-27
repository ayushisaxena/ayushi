<%-- 
    Document   : POPULARITY
    Created on : Nov 7, 2015, 7:46:59 PM
    Author     : Ayushi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>POPULARITY</title>
    </head>
    <body>
    <center><h1>POPULARITY</h1>
        <%
    try{
        String sql="";
        int i=1;
        String year=request.getParameter("syear");
        String top=request.getParameter("stop");
        String sex=request.getParameter("sex");
        //out.println(year+","+top+","+sex);
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        if(sex.equals("M") || sex.equals("F"))
            sql="select syear,sname,gender from hospital where syear="+Integer.parseInt(year)+" and gender='"+sex+"' order by amount desc";
                else if(sex.equals("B"))
                  sql="select syear,sname,gender from hospital where syear="+Integer.parseInt(year)+" order by amount desc";
          // out.println(sql);       
        Connection con=DriverManager.getConnection("jdbc:odbc:abc");
        Statement stmt=con.createStatement();
        ResultSet rs=stmt.executeQuery(sql);
        out.println("<table border=1 width='50%'>");
        out.print("<tr><th>Year</th><th>Name</th><th>Sex</th></tr>");
        int flag=0;
        while(i<=Integer.parseInt(top))
                       {
            flag=1;
            rs.next();
            out.println("<tr><td>"+rs.getInt(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td></tr>");
            i++;
                     }
        out.println("</table>");
        if(flag==0)
            out.println("Record not Available");
        out.println("<a href=index.html>Home</a>");
        out.println("<a href=popularity.html>Back</a>");
    }catch(Exception e){
    out.println(e);
    }
   %>
</html>
