import Foundation
public struct MapReduce {
    public private(set) var text = "Hello, World!"
    public private(set) var max_value = 5000000
    public private(set) var values = [0]

    public init() {
        max_value = 600
        values = (1...max_value).map( {_ in Int.random(in: 1...100)} )
    }
    public func mapTest()
    {
        let startTime = CFAbsoluteTimeGetCurrent()
        var squares: [Int] = []
        for value in values {
          squares.append(value*value)
        }
        let timeElapsed1 = CFAbsoluteTimeGetCurrent() - startTime
        
        let startTime2 = CFAbsoluteTimeGetCurrent()
        squares = values.map {$0 * $0}
        let timeElapsed2 = CFAbsoluteTimeGetCurrent() - startTime2
        print("Tested mapTest:",max_value,"values,",(1-timeElapsed2/timeElapsed1),"% faster")
    }
    public func reduceTest()
    {
        let startTime = CFAbsoluteTimeGetCurrent()
        var sum = 10
        for value in values {
            sum = sum+value
        }
        let timeElapsed1 = CFAbsoluteTimeGetCurrent() - startTime
        
        let startTime2 = CFAbsoluteTimeGetCurrent()
        var squares = values.reduce(10,+)
        let timeElapsed2 = CFAbsoluteTimeGetCurrent() - startTime2
        print("Tested reduceTest:",max_value,"values,",(1-timeElapsed2/timeElapsed1),"% faster")
    }
    
    public func Queue()
    {
        let queue = DispatchQueue(label: "myqueue", attributes: .concurrent)
        
        queue.sync {
            print("sync task1 start")
            print("sync ask1 end")
        }
        queue.async {
            print("task1 start")
            queue.sync {
                print("async sync task1 start")
                print("async sync ask1 end")
            }
            print("task1 end")
        }
        
        queue.async {
            print("task2 start")
            print("task2 end")
        }
        queue.async {
            print("task3 start")
            print("task3 end")
        }
        queue.async {
            print("task4 start")
            print("task4 end")
        }
        queue.async {
            print("task5 start")
            print("task5 end")
        }
    }
    func cook(food: String) -> String {
        var transformedFood = ""

        switch food {
        case "🌽": transformedFood = "🍿"
        case "🐮": transformedFood = "🍔"
        case "🐔": transformedFood = "🍳"
        default: transformedFood = food // remains uncooked
        }

        return transformedFood
    }
    
    func eat(food:String) -> String {
        var transformedFood = ""

        switch food {
        case "🍿": transformedFood = "💩"
        case "🍔": transformedFood = "💩"
        case "🍳": transformedFood = "💩"
        default: transformedFood = food // remains uncooked
        }

        return transformedFood
    }
}
