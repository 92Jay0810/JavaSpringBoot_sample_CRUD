<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <title>Welcome</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        function UpdateRow() {
            // use jquery to retrieve the elements' value
            var Key = $("#updatekey").val();
            var CName = $("#update1").val();
            var EName = $("#update2").val();
            // use jquery to send the request to http://localhost:3000/users/user
            $.ajax({
                method: "PUT",
                url: "/customer/",
                data: {Key,CName,EName}
            })
                .done(function (msg) {
                    // when client side receive the response from server side, reload the page
                    window.location.reload();
                });
        }
        // TODO: delete
        function deleteRow(id) {
        }
        // TODO: insert
        function AddRow() {
        }
    </script>
</head>
<body>

<h2>create</h2>

<form action="/customer" method="post" >
    firstname: <input type="text" name="firstname" />
    <br />
    lastname: <input type="text" name="lastname" />
    <input type="submit" value="create" />
</form>
<br />
<h2>getalluser</h2>
<form action="/customers" method="get">
    <input type="submit" value="getall" />
</form>
<br />
<br />
<h2>getoneuser</h2>
<form action="/customer" method="get">
    id: <input type="text" name="id" />
    <input type="submit" value="get" />
</form>
<br />
<br />
<h2>update</h2>
<form >
    id:<input type="text" name="id" id="updatekey" />
    <br />
    firstname: <input type="text" name="firstname"  id="update1"/>
    <br />
    lastname: <input type="text" name="lastname" id="update2" />
    <button onclick="UpdateRow()">Update</button>
</form>
<h2>delete</h2>
<form action="/customer/delete/id" method="get" >
    id:<input type="text" name="id" />
    <br />
    <input type="submit"   value="delete" />
</form>
</body>
</html>