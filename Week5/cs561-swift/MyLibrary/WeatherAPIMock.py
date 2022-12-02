from fastapi import FastAPI,Request
import requests
import json
app = FastAPI()
@app.get("/data/2.5/weather")
async def root():
    # position = requests.get("http://api.openweathermap.org/geo/1.0/direct?q=Corvallis&appid=3e208bd9c749ac1ceb55d44eeb46dd02")
    # json_string = json.loads(position.text)
    # weather = requests.get(f"https://api.openweathermap.org/data/2.5/weather?lat={json_string[0]['lat']}&lon={json_string[0]['lon']}&appid=3e208bd9c749ac1ceb55d44eeb46dd02")
    weather_json_string ={
    "coord": {
        "lon": -123.262,
        "lat": 44.5646
    },
    "weather": [
        {
        "id": 800,
        "main": "Clear",
        "description": "clear sky",
        "icon": "01n"
        }
    ],
    "base": "stations",
    "main": {
        "temp": 285.12,
        "feels_like": 285.23,
        "temp_min": 284.16,
        "temp_max": 289.51,
        "pressure": 1016,
        "humidity": 86
    },
    "visibility": 10000,
    "wind": {
        "speed": 1.54,
        "deg": 290
    },
    "clouds": {
        "all": 0
    },
    "dt": 1664609050,
    "sys": {
        "type": 1,
        "id": 3727,
        "country": "US",
        "sunrise": 1664633455,
        "sunset": 1664675654
    },
    "timezone": -25200,
    "id": 5720727,
    "name": "Corvallis",
    "cod": 200
    }
    return weather_json_string


#uvicorn WeatherAPIMock:app --reload