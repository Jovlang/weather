import json
import math
from urllib.request import urlopen
from bottle import *

def weather_info(location):
    response = urlopen('http://api.openweathermap.org/data/2.5/weather?q=' + location)
    return json.loads(response.read().decode('utf-8'))

@get('/weather')
def fn():
    location = 'Oslo,no'
    body = weather_info(location)
    return template('box.tpl',
                    location = location,
                    temperature = math.ceil(float(body['main']['temp']) - 273.15),
                    humidity = body['main']['humidity'],
                    pressure = body['main']['pressure'],
                    weather = body['weather'][0]['main'],
                    icon = body['weather'][0]['icon'])

@post('/weather')
def fn():
    location = request.forms.get("city")
    response = urlopen('http://api.openweathermap.org/data/2.5/weather?q=' + location)
    body = json.loads(response.read().decode('utf-8'))
    return json.dumps({'location': location,
                        'temperature': math.ceil(float(body['main']['temp']) - 273.15),
                        'humidity': body['main']['humidity'],
                        'pressure': body['main']['pressure'],
                        'weather': body['weather'][0]['main'],
                        'icon': body['weather'][0]['icon']})

@get('/static/<name:path>')
def fn(name):
    return static_file(name, root='./static')

run(host='localhost', port=8080)
