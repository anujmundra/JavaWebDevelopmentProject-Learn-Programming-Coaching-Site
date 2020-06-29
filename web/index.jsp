<html>
    <body bgcolor="LightGray">
       
        <h2>Learn Programming</h2>
        <hr>
        <form action="VerifyUser">
            <pre>
            UserId      <input type="text" name="userid"/>
            Password    <input type="password" name="password"/>
            UserType    <select name="usertype">
                        <option>admin</option>
                        <option>user</option>
                        </select>
                        <input type="submit" value="Login"/>
            </pre>
        </form>
        <form action="Logout">
            <input type="submit" value="Logout">
        </form>
        <hr>
        <a href="registration.jsp">New-User</a>
    </body>
</html>
