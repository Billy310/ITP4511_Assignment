<%-- 
    Document   : index
    Created on : Mar 16, 2023, 6:23:28 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forget Password</title>
        <link href="css/LoginPage.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>
        <div class="login-wrap">
            <div class="login-html">
                <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Forget Password</label>
                <input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab"></label>
                <div class="login-form">
                    <form action="resetpassowrd.jsp"  method="get" />
                    <div class="sign-in-htm">
                        <div class="group">
                            <label for="user" class="label">Username</label>
                            <input id="user" type="text" class="input">
                        </div>
       
                        <div class="group">
                            <label for="pass" class="label">HKID Card Number</label>
                            <input id="hkid" type="text" class="input" data-type="password"/>
                        </div>
                        <div class="group">
                            <label for="pass" class="label">Password</label>
                            <input id="pass" type="text" class="input" data-type="password"/>
                        </div>
                        <div class="group">
                            <label for="pass" class="label">Confirm Password</label>
                            <input id="cpass" type="text" class="input" data-type="password"/>
                        </div>
                        <div class="group">
                            <input type="submit" class="button" value="Reset Password"/>
                        </div>
                        <div class="hr"></div>
                        <div class="foot-lnk">
                            <label for="tab-1"><a href="index.jsp"/>Already Member?</a>
                        </div>
                    </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
