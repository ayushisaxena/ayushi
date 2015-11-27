<%-- 
    Document   : TREND
    Created on : Nov 7, 2015, 7:46:59 PM
    Author     : Ayushi
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TREND</title>
    </head>
    <body>
    <center> 
        <h1>NAME TREND</h1>
         <h1>
                            <img src="baby1.jpg" width="1000" height="100" align="center">
			</h1>
        
    <%
    
    try{
        String sql="";
        int i=1;
        String syear=request.getParameter("syear");
           
        //String eyear=request.getParameter("eyear");
        String eyear="2013";
        String sname=request.getParameter("sname");
        String sex=request.getParameter("sex"); 
       // out.println(year+","+top+","+sex);
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        if(sex.equals("M") || sex.equals("F"))
        sql="select syear,sname,gender,amount from hospital where syear between "+Integer.parseInt(syear)+" and "+Integer.parseInt(eyear)+" and sname like '"+sname+"' and gender='"+sex+"'"+" order by syear,position desc";
        else
        sql="select syear,sname,gender,amount from hospital where syear between "+Integer.parseInt(syear)+" and "+Integer.parseInt(eyear)+" and sname like '"+sname+"' order by syear,position desc";          
          // out.println(sql);       
        Connection con=DriverManager.getConnection("jdbc:odbc:abc");
        Statement stmt=con.createStatement();
        ResultSet rs=stmt.executeQuery(sql);
        out.println("<table border=1"+" width='50%'>");
        out.print("<tr><th>Year</td><th>Name</th><th>Sex</th><th>Amount</th></tr>");
        int flag=0;
        while(rs.next())
                       {
            flag=1;
            out.println("<tr><td>"+rs.getInt(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getInt(4)+"</td></tr>");
                       }
        out.println("</table>");
        if (flag==0)
            out.println("no record available");
        out.println("<a href=index.html>Back</a>");
    }catch(Exception e){
    out.println(e);
    }
            %>
</html>
