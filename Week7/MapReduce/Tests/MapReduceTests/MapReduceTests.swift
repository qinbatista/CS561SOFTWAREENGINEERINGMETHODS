import XCTest
@testable import MapReduce

final class MapReduceTests: XCTestCase {

    func testMap() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        MapReduce().mapTest()
//    }
//    func testReduce() throws {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct
//        // results.
//        MapReduce().reduceTest()
//    }
//    func testQueue() throws {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct
//        // results.
//        MapReduce().Queue()
//    }

//    func testCook() throws {
//
//        let meals = ["🌽", "🐮", "🐔"].map(MapReduce().cook)
//        print(meals)
//    }
//    func testShit() throws {
//
//        let shit = ["🌽", "🐮", "🐔"].map(MapReduce().cook).map(MapReduce().eat);
//        print(shit)
//    }
//    func testisVegetarian() throws {
//        let meals = ["🌽", "🐮", "🐔"]
//        let filteredMeals = meals.map(MapReduce().cook).filter{(food) -> Bool in
//        food == "🍿" || food == "🍳"
//        }
//        print(filteredMeals)
//    }
//    func testCaptial() throws {
//         for _ in 0...1000 {
//         let foodNames = ["🍔": "hamburger", "🍟": "french fries", "🌽": "popcorn"]
//         var outcome = foodNames.map {$0.value.capitalized}.reduce(""){"\($0) \($1)"}
//         outcome.removeFirst()
//         print(outcome)
//         assert(
//         outcome == "French Fries Hamburger Popcorn" ||
//         outcome == "French Fries Popcorn Hamburger" ||
//         outcome == "Popcorn French Fries Hamburger" ||
//         outcome == "Popcorn Hamburger French Fries" ||
//         outcome == "Hamburger French Fries Popcorn" ||
//         outcome == "Hamburger Popcorn French Fries"
//         )
//         }
//    }
//    func testProduct()
//    {
//         let outcome = [2, 3, 5, 8].map {$0 + 1}.reduce(1, *)
//         assert(outcome == 648)
//         print("result=\(outcome)")
//    }
//    func forProduct()
//    {
//         let outcome2 = [2, 3, 5, 8].map{$0 + 1}
//         var result = 1
//         for num in outcome2 {
//         result *= num
//         }
//         print("result= \(result)")
    }
    
}
