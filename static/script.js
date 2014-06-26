function updateInfo(sel)
{
  var x = new XMLHttpRequest();
  x.open("POST", "/weather", false);
  x.send("city=" + sel.value);
  var j = JSON.parse(x.response);
  $("#weather-icon")[0].src = "http://openweathermap.org/img/w/"+j.icon+".png";
  var fields = ["weather", "temperature", "humidity", "pressure"];
  for (i in fields)
  {
    $("#"+fields[i])[0].innerHTML = j[fields[i]];
  }
}
