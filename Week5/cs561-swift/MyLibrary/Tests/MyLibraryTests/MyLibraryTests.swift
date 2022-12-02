import XCTest
import MyLibrary
@testable import MyLibrary
final class MyLibraryTests: XCTestCase {

        func testTheSHA256() async {
             let mockWeatherService = MockWeatherService(
                shouldSucceed: false,
                 shouldReturnTemperatureWithAnEight: false
             )
    
           let myLibrary = MyLibrary(weatherService: mockWeatherService)
    
       // When
            let isLuckyNumber = await myLibrary.crack("7902699be42c8a8e46fbbb4501726517e86b22c56a189f7625a6da49081b2451")
          print(isLuckyNumber as! String)
          // Then
          XCTAssertNotNil(isLuckyNumber)
          XCTAssert(isLuckyNumber != "")
       }

    func testGetTemperature() async {
        let mockWeatherService = MockWeatherService(
            shouldSucceed: false,
            shouldReturnTemperatureWithAnEight: false
        )
        let myLibrary = MyLibrary(weatherService: mockWeatherService)
        // When
        let temp = await myLibrary.GetStandardTemperature()
        // Then
        XCTAssertNotNil(temp)
    }
//    func testGetTemperatureFromWeatherServiceImpl() async {
//        let thisService = WeatherServiceImpl()
//        thisService.myURL = .local
//        let temperature = try await thisService.getTemperature()
////        return temperature
//    }
    func testGetTemperatureFromWeatherServiceImpl() async {
        // Check the simple case first: 3, 5 and 8 are automatically lucky.
        let queue = DispatchQueue(label: "my queue")

        print("1")
        queue.async {
            print("2")

            queue.sync {
                print("3")
            }

            print("4")
        }

        print("5")

//        do
//        {
//            print("GetStandardTemperature")
//            let thisService = WeatherServiceImpl()
//            thisService.myURL = .local
//            let temperature = try await thisService.getTemperature()
//            XCTAssertNotNil(temperature)
//        }
//        catch
//        {
//            XCTAssert(false)
//        }
    }
}
