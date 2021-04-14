import UIKit

struct Position: Equatable, Hashable {
    var x: Int
    var y: Int
    
    init(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
    }
}

let availablePositions = [Position(0, 0), Position(0, 1), Position(1, 0)]
let gemPosition = Position(1, 0)

for position in availablePositions {
    if gemPosition == position { // == due to conformance with equatable protocol
        print("Gem found at (\(position.x), \(position.y))!")
    } else {
        print("No gem at (\(position.x), \(position.y))")
    }
}

// to test hashable
var visitedPositions: Set = [Position(0, 0), Position(1, 0)] // set requires conformance to Hashable
let currentPosition = Position(1, 3)

if visitedPositions.contains(currentPosition) { // requires conformance to Hashable to use this method
    print("Already visited (\(currentPosition.x), \(currentPosition.y))")
} else {
    print("First time at (\(currentPosition.x), \(currentPosition.y))")
    visitedPositions.insert(currentPosition)
}

class CompareValueClass: Hashable {
    var name: String?
    var address: String?
    
    init(_ name: String, _ address: String) {
        self.name = name
        self.address = address
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.name)
        hasher.combine(self.address)
    }
    
    static func ==(lhs: CompareValueClass, rhs: CompareValueClass) -> Bool {
        return lhs.name == rhs.name && lhs.address == rhs.address
    }
}

let obj1 = CompareValueClass("Anks", "MH")
let obj2 = CompareValueClass("Test", "KA")

let obj3 = CompareValueClass("Test", "KA")
let obj4 = CompareValueClass("Test", "KA")
let obj5 = CompareValueClass("Test", "KA")

var arrayValue = [CompareValueClass]()
arrayValue = [obj1, obj2, obj3, obj4, obj5]

if obj1 == obj2 { // needs conformance to Equatable protocol
    print("Same")
} else {
    print("Different")
}


// using hashable
let test = CompareValueClass("Anks", "MH")
print(arrayValue.contains(test)) // requires conformance to hashable because 'arrayValue' is a collection of custom type 'CompareValueClass'

