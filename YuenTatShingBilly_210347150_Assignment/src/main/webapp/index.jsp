<%-- 
    Document   : index
    Created on : Mar 16, 2023, 6:23:28 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
    <script>
        $(document).ready(function () {

            $(".input").css({"border-color": "#C1E0FF",
                "border-width": "2px",
                "border-style": "solid"});

            $("#tab-1").click(function () {

                $(".input").val('');

            });

            $("#tab-2").click(function () {

                $(".input").val('');

            });

//            $(".input").click(function () {
//
//                $(this).css({"border-color": "#C1E0FF",
//                    "border-width": "1px",
//                    "border-style": "solid"});
//
//            });

            $(".input").keyup(function () {

                if ($(this).val().length > 0) {
                    $(this).css({"border-color": "#C1E0FF",
                        "border-width": "2px",
                        "border-style": "hidden"});

                } else {
                    $(this).css({"border-color": "#C1E0FF",
                        "border-width": "2px",
                        "border-style": "solid"});

                }

            });
            $(".input").keydown(function () {

                if ($(this).val().length > 0) {
                    $(this).css({"border-color": "#C1E0FF",
                        "border-width": "2px",
                        "border-style": "hidden"});

                } else {
                    $(this).css({"border-color": "#C1E0FF",
                        "border-width": "2px",
                        "border-style": "solid"});

                }

            });

            $("#passwords").keyup(function () {

                if ($("#passwords").val() != ($("repassword").val())) {

                    $(this).css({"border-color": "#FFC0CB",
                        "border-width": "3px",
                        "border-style": "solid"});

                } else {
                    $(this).css({"border-color": "#FFC0CB",
                        "border-width": "3px",
                        "border-style": "hidden"});

                }

            });

            $("#repassword").keyup(function () {

                if ($("#passwords").val() != ($("repassword").val())) {

                    $(this).css({"border-color": "#FFC0CB",
                        "border-width": "3px",
                        "border-style": "solid"});

                } else {
                    $(this).css({"border-color": "#FFC0CB",
                        "border-width": "3px",
                        "border-style": "hidden"});

                }

            });




        });

        function validate(input) {
            if (/^\s/.test(input.value))
                input.value = '';
        }
    </script>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Event Point Limited Login Page </title>
        <link href="css/LoginPage.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>
        <div class="login-wrap">
            <div class="login-html">
                <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Sign In</label>
                <input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">Sign Up</label>
                <div class="login-form">
                    <form action="HandleUser"  method="POST">
                        <input type="hidden" value="login" name="action"/>
                        <div class="sign-in-htm">
                            <div class="group">
                                <label for="user" class="label">Username</label>
                                <input id="user" type="text" class="input" name="username" placeholder="Enter Your Username" oninput="validate(this)" />
                            </div>
                            <div class="group">
                                <label for="pass" class="label">Password</label>
                                <input id="pass" type="password" class="input" data-type="password" name="password"  placeholder="Enter Your Password" />
                            </div>

                            <div class="group">
                                <input type="submit" class="button" value="Sign In">
                            </div>
                            <div class="hr"></div>
                            <div class="foot-lnk">
                                <a href="ForgetPassword.jsp">Forgot Password?</a>
                            </div>
                        </div>
                    </form>
                    <form action="HandleUser" method="POST" >
                        <input type="hidden" value="signup" name="action"/>
                        <input type="hidden" value="3" name="role" />
                        <div class="sign-up-htm">
                            <div class="group">
                                <label for="user" class="label">Username</label>
                                <input id="user" type="text" class="input" name="username" placeholder="Enter Username" oninput="validate(this)" />
                            </div>
                            <div class="group">
                                <label for="pass" class="label">Password</label>
                                <input id="passwords" type="password" class="input" data-type="password" name="password"  placeholder="Enter Password" />
                            </div>
                            <div class="group">
                                <label for="pass" class="label">Repeat Password</label>
                                <input id="repassword" type="password" class="input" data-type="password" name="re-password" placeholder="Repeat Password"  />
                            </div>
                            <div class="group">
                                <label for="pass" class="label">Email Address</label>
                                <input id="pass" type="text" class="input" name="email" placeholder="Email Address"  />
                            </div>
                            <div class="group">
                                <input type="submit" class="button" value="Sign Up">
                            </div>

                            <div class="hr"></div>
                            <div class="foot-lnk">
                                <label for="tab-1">Already Member?</a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
