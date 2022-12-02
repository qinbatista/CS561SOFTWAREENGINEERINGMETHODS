import XCTest
import Alamofire
final class MyLibraryTests: XCTestCase {
    private struct Weather: Decodable {
        let main: Main
        struct Main: Decodable {
            let temp: Double
            let temp_min: Double
            let temp_max: Double
        }
    }
    func testAPI() async {
        // Given
        print("getTemperature start")
        var url = "http://127.0.0.1:8000/data/2.5/weather"
        try await withCheckedThrowingContinuation { continuation in
            AF.request(url, method: .get).validate(statusCode: 200..<300).responseDecodable(of: Weather.self) { response in
                switch response.result {
                    
                case let .success(weather):
                    print("getTemperature await")
                    var temperature = weather.main.temp
                    var temp_min = weather.main.temp_min
                    var temp_max = weather.main.temp_max
                    temperature = temperature-273.15
                    temp_min = temp_min-273.15
                    temp_max = temp_max-273.15
                    print(temperature)
                    print(temp_min)
                    print(temp_max)
                    let temperatureAsInteger = Int(temperature)
                    let tem_min_AsInteger = Int(temp_min)
                    let tem_max_AsInteger = Int(temp_max)
                    if (temperatureAsInteger<tem_max_AsInteger && temperatureAsInteger>tem_min_AsInteger)
                    {
                        //temperature is normal
                        print("ok")
                        
                    }
                    else
                    {
                        //temperature is abnormal
                        print("wrong")
                        
                    }

                case let .failure(error):
                    print("failed")
                    
                }
            }
        }
        XCTAssert(true)
    }

}
