<!doctype html>
<html>
  <head>
    <title>Weather</title>
    <link rel="stylesheet" type="text/css" href="static/style.css">
  </head>
  <body>
    <div id="container">
      <div id="box">
        {{weather}}<br>
        Temperature: {{temperature}}° C<br>
        Humidity: {{humidity}}%<br>
        Pressure: {{pressure}} hPa
      </div>
      <form id="cityform" action="/weather" method="post">
        <select name="city">
          % for i in ["Oslo,no", "Tokyo,jp", "Kairo,eg", "Dodoma,tz", "Rio de Janeiro,br"]:
            % if i == location:
          <option value="{{i}}" selected>{{i}}</option>
            % else:
          <option value="{{i}}">{{i}}</option>
            % end
          % end
        </select>
        <input value="Go" type="submit" />
      </form>
    </div>
  </body>
</html>
