import Foundation
import CryptoKit
public class MyLibrary {
    private let weatherService: WeatherService

    /// The class's initializer.
    ///
    /// Whenever we call the `MyLibrary()` constructor to instantiate a `MyLibrary` instance,
    /// the runtime then calls this initializer.  The constructor returns after the initializer returns.
    public init(weatherService: WeatherService? = nil) {
        self.weatherService = weatherService ?? WeatherServiceImpl()
    }

    public func crack(_ _string: String) async -> String? {
        return CheckTable(from:_string)
    }
    

    func CheckTable(from input: String) -> String
    {
        do
        {
            let lookupTable = try loadDictionaryFromDisk()
            if(lookupTable[input]?.count==nil)
            {
                return ""
            }
            return lookupTable[input] as! String
        }
        catch
        {
           return ""
        }
    }
    func encryptUsingSha1(from input: String) -> String
    {
        let inputData = Data(input.utf8)
        let output = Insecure.SHA1.hash(data: inputData)
        return output.description
    }
    func encryptUsingSha2(from input: String) -> String
    {
        let inputData = Data(input.utf8)
        let output = SHA256.hash(data: inputData)
        return output.description.replacingOccurrences(of: "SHA256 digest: ", with: "")
    }
    
    func loadDictionaryFromDisk() throws -> [String : String] {
        guard let path = Bundle.module.url(forResource: "table", withExtension: "json") else { return [:] }
        let data = try Data(contentsOf: path)
        let jsonResult = try JSONSerialization.jsonObject(with: data)
//        print("jsonResult:")
        if let lookupTable: Dictionary = jsonResult as? Dictionary<String, String> {

            return lookupTable
        } else {
            print("error:")
            return [:]
        }
    }
    public func GetStandardTemperature() async -> Int? {
        // Check the simple case first: 3, 5 and 8 are automatically lucky.
        do
        {
            print("GetStandardTemperature")
            let thisService = WeatherServiceImpl()
            thisService.myURL = .local
            let temperature = try await thisService.getTemperature()
            return temperature
        }
        catch
        {
            return nil
        }
    }


}

private extension Int {
    /// Sample usage:
    ///   `558.contains(558, "8")` would return `true` because 588 contains 8.
    ///   `557.contains(557, "8")` would return `false` because 577 does not contain 8.
    func contains(_ character: Character) -> Bool {
        return String(self).contains(character)
    }
}
