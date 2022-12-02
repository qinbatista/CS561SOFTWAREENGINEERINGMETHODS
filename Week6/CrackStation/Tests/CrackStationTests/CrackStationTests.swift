import XCTest
@testable import CrackStation

final class CrackStationTests: XCTestCase {

    func testTheSHA256() {
        let myStation = CrackStation()
        let isLuckyNumber =  myStation.crack("e9d71f5ee7c92d6dc9e92ffdad17b8bd49418f98")
        let password  = "b"
        XCTAssertEqual(isLuckyNumber, password)
        // Then
        XCTAssertNotNil(isLuckyNumber)
        XCTAssert(isLuckyNumber != "")
   }
    func testDecrptnil() {
        let myStation = CrackStation()
        let testDecrptvalue =  myStation.decrypt(shaHash: "-e9d71f5ee7c92d6dc9e92ffdad17b8bd49418f98")
        XCTAssert(testDecrptvalue == nil)
   }
    
    func testDecrpt() {
        let myStation = CrackStation()
        let testDecrptvalue =  myStation.decrypt(shaHash: "e9d71f5ee7c92d6dc9e92ffdad17b8bd49418f98")
        
        let password  = "b"
        XCTAssertEqual(testDecrptvalue, password)
        XCTAssert(testDecrptvalue != nil)
   }
}
