import json
from aiohttp import web
import platform
import os
import json

class HttpRequestManager:
    def __init__(self, worlds=[]):
        if platform.system() == "Darwin":
            self.__log_file_location = "/Users/qin/Desktop/logs.txt"
        else:
            self.__log_file_location = "/root/logs.txt"
        with open('./table.json') as f:
            self.__json_table = json.load(f)
        # print(self.__json_table)

    async def _get_log(self):
        if os.path.isfile(self.__log_file_location)==False: return "no file"
        content = ""
        with open(self.__log_file_location, "r") as f:
            content = f.readlines()
        return content

    async def _get_password(self, sha256):
        return self.__json_table[sha256]



ROUTES = web.RouteTableDef()


def _json_response(body: dict = "", **kwargs) -> web.Response:
    kwargs["body"] = json.dumps(body or kwargs["kwargs"]).encode("utf-8")
    kwargs["content_type"] = "text/json"
    return web.Response(**kwargs)


@ROUTES.get("/password/{value}")
async def get_log(request: web.Request) -> web.Response:
    sha256 = request.rel_url.name
    print("sha256="+sha256)
    result = await (request.app["MANAGER"])._get_password(sha256)

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
    return _json_response(weather_json_string)

@ROUTES.get("/failedTest")
async def get_log(request: web.Request) -> web.Response:
    return web.HTTPNotFound()


def run():
    print("version:1.0")
    app = web.Application()
    app.add_routes(ROUTES)
    app["MANAGER"] = HttpRequestManager()
    web.run_app(app, port="80")

if __name__ == "__main__":
    run()
