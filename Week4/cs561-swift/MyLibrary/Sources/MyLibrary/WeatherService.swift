import Alamofire

public protocol WeatherService {
    func getTemperature() async throws -> Int

}
public enum URL {
    case local
    case remote
}



private struct Weather: Decodable {
    let main: Main
    struct Main: Decodable {
        let temp: Double
        let temp_min: Double
        let temp_max: Double
    }
}
