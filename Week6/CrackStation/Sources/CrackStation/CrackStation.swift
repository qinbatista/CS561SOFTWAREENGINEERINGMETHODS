import Foundation
import CryptoKit

public protocol Decrypter {
    init()

    /// Either returns the cracked plain-text password
    /// or, if unable to crack, then returns nil.
    /// - Parameter shaHash: The SHA-1 or SHA-256 digest that corresponds to the encrypted password.
    /// - Returns: The underlying plain-text password if `shaHash` was successfully cracked. Otherwise returns nil.
    func decrypt(shaHash: String) -> String?
}
public struct CrackStation:Decrypter {
    public private(set) var text = "Hello, World!"
    public private(set) var lookupTable1 = [String: String]()
    public private(set) var lookupTable2 = [String: String]()
    public private(set) var lookupTable3 = [String: String]()

    public init() {
        if(lookupTable1==[:])
        {
            do
            {
                lookupTable1 = try loadDictionaryFromDisk(from: "table1")
            }
            catch
            {
            }
        }
        if(lookupTable2==[:])
        {
            do
            {
                lookupTable2 = try loadDictionaryFromDisk(from: "table2")
            }
            catch
            {
            }
        }
    }

    public func decrypt(shaHash: String) -> String? {
        return CheckTable(from:shaHash)
    }
    
    public func crack(_ _string: String) -> String? {
        return CheckTable(from:_string)
    }
    func CheckTable(from input: String) -> String?{
        if(lookupTable1[input]?.count==nil)
        {
            if(lookupTable2[input]?.count==nil)
            {
                return nil
            }
            else
            {
                return lookupTable2[input]!
            }
        }
        return lookupTable1[input]!
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
    
    func loadDictionaryFromDisk(from tableName: String) throws -> [String : String] {
        guard let path = Bundle.module.url(forResource: tableName, withExtension: "json") else { return [:] }
        let data = try Data(contentsOf: path)
        let jsonResult = try JSONSerialization.jsonObject(with: data)
        if let lookupTable: Dictionary = jsonResult as? Dictionary<String, String> {
            return lookupTable
        } else {
            print("error:")
            return [:]
        }
    }
}
