<%@page import="com.fasterxml.jackson.annotation.JsonValue"%>
<%@page import="com.mysql.cj.xdevapi.JsonArray"%>
<%@page import="com.mysql.cj.xdevapi.JsonParser"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.io.IOException"%>
<%@page import="javax.servlet.http.HttpServlet"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%@page import="com.mashape.unirest.http.HttpResponse"%>
<%@page import="com.mashape.unirest.http.Unirest"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mashape.unirest.http.JsonNode"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="org.apache.tomcat.util.json.JSONParser"%>
<%@page import="java.util.Scanner"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.Reader"%>
<%@page import="org.json.JSONException"%>
<%@page import="java.nio.charset.Charset"%>
<%@page import="java.net.URLConnection"%>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Corona tracker : Dashboard</title>
<%@include file="all_js_css.jsp"%>
</head>

<body>
	<div class="container-fluid p-0">
		<%@include file="navbar.jsp"%>
	</div>

	<%
	  	int confirmed = 0;
		int death = 0;
		int recovered = 0;
 		URL url = new URL("https://covid19.mathdro.id/api/countries/INDIA");
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.connect();
		String temp = null;
		if (conn.getResponseCode() == 200) {
			Scanner scan = new Scanner(url.openStream());
			while (scan.hasNext()) {
				temp = scan.nextLine();
			}
			scan.close();
		}
		JSONObject json = new JSONObject(temp); 
		try
		{
			JSONObject jsonObject = new JSONObject(temp.toString());
			JSONObject confirmed_obj = jsonObject.getJSONObject("confirmed");
			confirmed =  confirmed_obj.getInt("value");
			JSONObject deaths_obj = jsonObject.getJSONObject("deaths");
			death = deaths_obj.getInt("value");
			recovered = confirmed-death;
			
		}
		catch (JSONException e)
		{
			System.out.println("Error "+e.toString());
		} 
	%>

	<div class="container text-center pt-5 pb-5">
		<div class="row align-items-center">
			<p class="fs-1">Coronavirus Cases INDIA:</p>
		</div>
		<div class="row align-items-center">
	    <div class="col">
	    	<div class="shadow rounded bg-warning  p-2 text-light bg-opacity-30 p-5">
	    		<p class="fs-1 fw-bold">Confirmed</p>
				<p class="fs-1 fw-bolder"><%=confirmed%></p>
	    	</div>
	    </div>
	    <div class="col">
	    	<div class="shadow rounded bg-danger p-2 text-light bg-opacity-30 p-5">
	    		<p class="fs-1 fw-bold">Deaths</p>
	    		<p class="fs-1 fw-bolder"><%=death%></p>
	    	</div>
	    </div>
	    	    <div class="col">
	    	<div class="shadow rounded bg-success p-2 text-light bg-opacity-75 p-5">
	    		<p class="fs-1 fw-bold">Recovered</p>
	    		<p class="fs-1 fw-bolder"><%=recovered%></p>
	    	</div>
	    </div>
	  </div>
	</div>

	<%@include file="footer.jsp"%>
</body>

</html>