<!DOCTYPE html>
<html>
<body>
<p id="result">Wait</p>
<button onClick="history.go(0)">Refresh!</button>

<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script>
    function getLocation() {
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(getBill);
            $( "#result" ).html("waiting on verification...");
        }
        else {
            $( "#result" ).html("Location verification failed. This application requires geoloation support.");
        }
    }

    function getBill(position) {
        var lat=position.coords.latitude;
        var lon=position.coords.longitude;
        $.get( "http://23.20.59.96:8080/getbill/LocVer?lat="+lat+"&lon="+lon+"&rst="+window.rst+"&tbl="+window.tbl, function( data ) {
		var datas = data.split(' ');
		session.setAttribute("uid",datas[1]);
            window.location.replace(data[0]);
        });
    }
	function getUrlParameter(sParam)
	{
	    var sPageURL = window.location.search.substring(1);
	    var sURLVariables = sPageURL.split('&');
	    for (var i = 0; i < sURLVariables.length; i++) 
	    {
		var sParameterName = sURLVariables[i].split('=');
		if (sParameterName[0] == sParam) 
		{
		    return sParameterName[1];
		}
	    }
	}

	window.rst=getUrlParameter('rst');
	window.tbl=getUrlParameter('tbl');
    getLocation();
</script>

</body>
</html>

