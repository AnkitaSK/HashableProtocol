import UIKit

class CompareValueClass: Equatable, Hashable {
    var name: String?
    var address: String?
    
    init(_ name: String, _ address: String) {
        self.name = name
        self.address = address
    }
    
    func hash(into hasher: inout Hasher) {
        
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

if obj1 == obj2 {
    print("Same")
} else {
    print("Different")
}

let values = arrayValue.filter { (compareValueObject) -> Bool in
    return compareValueObject.address == "KA"
}

//print(values)

let conditions: [(CompareValueClass) -> Bool] = [
{$0.name == "Test"},
{$0.address == "KA"},
]

let result1 = arrayValue.filter({ (compareValueObject) -> Bool in
    conditions.reduce(true) { $0 && $1(compareValueObject) }
}).map{ $0.name }


//let result2 = arrayValue.reduce(true) { (o1, o2) -> Bool in
//    return o1 == o2
//    }.map{ $0.name }
print(result1)
