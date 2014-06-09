<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no"/>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>

    <title>gpsHub: Sign In</title>

    <script src="js/jquery-1.11.1.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script src="js/user.min.js" type="text/javascript"></script>

    <link rel="StyleSheet" type="text/css" href="css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <label for="id">id:</label>
    <input id="id" class="form-control" value="1">
    <label for="lat">lat:</label>
    <input id="lat" class="form-control" value="37.61778" onchange="send()">
    <label for="lon">lon:</label>
    <input id="lon" class="form-control" value="145.75167" onchange="send()">
</div>

<script language="JavaScript">
    function send() {
        $.ajax({
            url: 'actions/Drivers.php',
            type: 'POST',
            data: {
                id: $("#id").val(),
                lat: $("#lat").val(),
                lon: $("#lon").val()
            },
            success: function (data) {
                console.log(data);
            }
        })
    }
</script>
</body>
</html>