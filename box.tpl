<!DOCTYPE html>
<html>
  <head>
    <title>Weather</title>
    <meta charset="utf8" />
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
        <select name="city" onchange="this.form.submit()">
          % for i in ["Oslo,no", "Tokyo,jp", "Kairo,eg", "Dodoma,tz", "Rio de Janeiro,br"]:
            % if i == location:
          <option value="{{i}}" selected>{{i.split(',')[0]}}</option>
            % else:
          <option value="{{i}}">{{i.split(',')[0]}}</option>
            % end
          % end
        </select>
      </form>
    </div>
  </body>
</html>
