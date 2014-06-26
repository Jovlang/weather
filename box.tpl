<!DOCTYPE html>
<html>
  <head>
    <title>Weather</title>
    <meta charset="utf8" />
    <link rel="stylesheet" type="text/css" href="static/style.css">
    <script type="text/javascript" src="static/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="static/script.js"></script>
  </head>
  <body>
    <div id="container">
      <div id="box">
        <img id="weather-icon" src="http://openweathermap.org/img/w/{{icon}}.png" /><br>
        <div id="weather-text">
          <span id="weather">{{weather}}</span><br>
          Temperature: <span id="temperature">{{temperature}}</span>° C<br>
          Humidity: <span id="humidity">{{humidity}}</span>%<br>
          Pressure: <span id="pressure">{{pressure}}</span> hPa
        </div>
      </div>
      <form id="cityform" action="/weather" method="post">
        <select name="city" onchange="updateInfo(this)">
          % for i in ["Oslo,no", "Tokyo,jp", "Kairo,eg", "Dodoma,tz", "Rio de Janeiro,br"]:
          <option value="{{i}}">{{i.split(',')[0]}}</option>
          % end
        </select>
      </form>
    </div>
  </body>
</html>
