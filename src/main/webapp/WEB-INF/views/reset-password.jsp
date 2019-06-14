<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>HackeCode | Reset Password</title>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans&display=swap" rel="stylesheet">

    
    <style>
        body {
            font-family: 'Open Sans', sans-serif;

        }
        #logo {
            max-height: 100px;
            margin: 2% 3%;
        }
        .hc-row {
            width: 100%;
            margin: auto;
        }
        .hc-reset {
            width: fit-content;
            margin: auto;
        }
        input.r-inp {
            width: 350px;
            height: 30px;
            padding: 5px 10px;
            margin-top: 5px;
            margin-bottom: 15px;
            font-size: 1.1em;
        }
        label {
            display: block;
            font-weight: bold;
            text-transform: uppercase;
            font-size: 0.8em;
        }
        input#reset {
            width: 100%;
            height: 40px;
            background: #9C27B0;
            border: none;
            color: #fff;
            font-size: 1.2em;
            letter-spacing: 1px;
            font-weight: bold;
        }
        input#reset:hover {
            background: #721d81;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <img src="${ pageContext.request.contextPath }/resources/ff-ideas/logo.png" alt="" id="logo">
    <div class="hc-row">
        <div class="hc-reset">
        
        <c:choose>
		    <c:when test="${ isGoodKey }">
		        <div>
	                <div class="f-input">
	                    <label for="">New Password:</label>
	                    <input id="p" type="password" class="r-inp" placeholder="New Password">
	                </div>
	                <div class="f-input">
	                    <label for="">Confirm Password:</label>
	                    <input id="c-p" type="password" class="r-inp" placeholder="Confirn Password">
	                </div>
	                <input type="hidden" value= "${ resetKey }" id="reset-key">
	                <input type="submit" id="reset" value="Reset">
            	</div>
           
		    </c:when>    
		    <c:otherwise>
		        <div>
	                <h1>Opps! Seems like this link is broken!</h1>
	            </div>
		    </c:otherwise>
		</c:choose>
        </div>
    </div>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script>
        $("#reset").on("click", function(e) {
            let p = $("#p").val();
            let cp = $("#c-p").val();

            if (p.lenght == 0 || cp.length == 0) {
                alert("Password can not be Empty");
            } 
            else if(p !== cp) {
                alert("Passwords do not match. Please check!");
            }
            else {
                $.ajax({
                    method: "POST",
                    url: "/user/api/update-password",
                    data: {
                        password: p,
                        resetKey: $("#reset-key").val()
                    },
                    beforeSend: function() {
                       $("#reset").val("Reseting Password..."); 
                    },
                    success: function(data) {
                    	console.log(data);
                        if (data) {
                            let reset = JSON.parse(data);
                            if (reset.isDone) {
                                $("#reset").val("Password Reset Successful!");
                                window.location.href = "https://hackercode.in";
                            }
                            else {
                                $("#reset").val("Opps! Please try again!");
                            }
                        }
                    },
                    error: function(a, xhr, b) {
                        console.log(a, xhr, b);
                    }
                });
            }
        });
    </script>
</body>
</html>