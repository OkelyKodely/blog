<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<html>
    <head>
        <title>Blog</title>
        <link rel="stylesheet" type="text/css"href="conf.css">
        <link href="https://getbootstrap.com/docs/4.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            a {
                text-decoration: underline;
                text-decoration-color: red;
            }
            a:hover {
                color: hotpink;
            }
            textarea {
                width: 260px;
                height: 400px;
                background-color: #3CBC8D;
            }
            * {
                font-size: 13px;
            }
        </style>
    </head>
    <body bgcolor="black">
    <center>
        <table width="550" bgcolor="white">
            <tr>
                <td align="left">
        <H1>Blog</h1>
        <H3>Sign Up</H3>
        <H6><a href="posts.jsp">Go Back</a></h6>
        <HR align="left" style="width:550px"/>
        <table width="550">
                <%
                String hostName = "ec2-54-163-240-54.compute-1.amazonaws.com";
                String dbName = "d89l9begjikklj";
                String userName = "isscllglmxgeln";
                String password = "334f696049572d4bc9c3b6b78c3410301e24dd3b5fd2b96dc15bf4c1c6fed113";
                
                Connection conn = null;

                try {
                    Class.forName("org.postgresql.Driver");
                    String url = "jdbc:postgresql://" + hostName + "/" + dbName + "?user=" + userName + "&password=" + password + "&ssl=true&sslfactory=org.postgresql.ssl.NonValidatingFactory";
                    conn = DriverManager.getConnection(url);
                } catch(Exception e) {out.println(e.getMessage());}

                                if(request.getParameter("email") != null) {
                                    String email = request.getParameter("email");
                                    String passWord = request.getParameter("password");
                                    String sql = "insert into blog_signup (email, password, inputdate) values ('"+email+"', '"+passWord+"', now());";
                                    
                                    Statement st = conn.createStatement();
                                    st.execute(sql);
                                    %>
                                    <tr><td colspan="2">Signed up.</td></tr>
                                    <%
                                }
                        %>
                        <form method="post" action="signup.jsp">
                        <tr>
                            <td>
                                Email:
                            </td>
                            <td>
                                <input type="text" name="email">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Password:
                            </td>
                            <td>
                                <input type="password" name="password">
                                <br>
                                <input type="submit" value="Sign up.">
                            </td>
                        </tr>
                        </form>
                        <%
                if(conn != null) {
                    try {
                        conn.close();
                    } catch(Exception e) {}
                }
                %>
        </table>
                </td>
            </tr>
        </table>
    </center>
    </body>
</html>