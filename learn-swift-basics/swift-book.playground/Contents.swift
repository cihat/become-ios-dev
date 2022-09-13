class NamedShape {
  var numberOfSides: Int = 0
  var name: String
  
  init(name: String) {
    self.name = name
  }
  
  func simpleDescription() -> String {
    return "A shape with \(numberOfSides) sides."
  }
}

class Square: NamedShape {
  var sideLength: Double
  
  init(sideLength: Double, name: String) {
    self.sideLength = sideLength
    super.init(name: name)
    numberOfSides = 4
  }
  
  func area() -> Double {
    return sideLength * sideLength
  }
  
  override func simpleDescription() -> String {
    return "A square with sides of length \(sideLength)."
  }
}

class EquilateralTriangle: NamedShape {
  var sideLength: Double = 0.0
  
  init(sideLength: Double, name: String) {
    self.sideLength = sideLength
    super.init(name: name)
    numberOfSides = 3
  }
  
  var perimeter: Double {
    get {
      return 3.0 * sideLength
    }
    set {
      sideLength = newValue / 3.0
    }
  }
  
  override func simpleDescription() -> String {
    return "An equilateral triangle with sides of length \(sideLength)."
  }
}


var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
triangle.perimeter = 9.3
triangle.sideLength


class TriangleAndSquare {
  var triangle: EquilateralTriangle {
    willSet {
      square.sideLength = newValue.sideLength
    }
  }
  var square: Square {
    willSet {
      triangle.sideLength = newValue.sideLength
    }
  }
  init(size: Double, name: String) {
    square = Square(sideLength: size, name: name)
    triangle = EquilateralTriangle(sideLength: size, name: name)
  }
}

var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
print(triangleAndSquare.triangle.sideLength)


let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength



enum Rank: Int {
case ace = 1
case two, three, four, five, six, seven, eight, nine, ten
case jack, queen, king
  
  func simpleDescription() -> String {
    switch self {
    case .ace:
      return "ace"
    case .jack:
      return "jack"
    case .queen:
      return "queen"
    case .king:
      return "king"
    default:
      return String(self.rawValue)
    }
  }
}

let ace = Rank.ace
ace.rawValue
ace.simpleDescription()


if let convertedRank = Rank(rawValue: 3) {
  let threeDescription = convertedRank.simpleDescription()
  print(threeDescription)
}

//Protocol
protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}
//
//class SimpleClass: ExampleProtocol {
//  var simpleDescription: String = "A very simple Class"
//  var anotherProperty: Int = 34234
//  func adjust() {
//    simpleDescription += "  Now 100% adjusted."
//  }
//}
//
//var a = SimpleClass()
//a.adjust()
//a.simpleDescription = "TEst TEst "
//let aDescription = a.simpleDescription
//
//
//struct SimpleStructure: ExampleProtocol {
//  var simpleDescription: String = "A simple structure"
//  mutating func adjust() {
//    simpleDescription += " (adjusted)"
//  }
//}
//var b = SimpleStructure()
//b.adjust()
//let bDescription = b.simpleDescription



extension Int: ExampleProtocol {
  var simpleDescription: String {
    return "The number \(self)"
  }
  mutating func adjust() {
    self += 42
  }
}

print(7.simpleDescription)
// Prints "The number 7"

enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}

func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    }
    return "Job sent"
}


do {
  let printerResponse = try send( job: 1040, toPrinter: "Bi Sheng" )
  print(printerResponse)
} catch {
  print(error)
}



do {
    let printerResponse = try send(job: 1440, toPrinter: "Never Has Toner")
    print(printerResponse)
} catch PrinterError.onFire {
    print("I'll just put this over here, with the rest of the fire.")
} catch let printerError as PrinterError {
    print("Printer error: \(printerError).")
} catch {
    print(error)
}
// Prints "Job sent"


let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
let printerFailure = try? send(job: 1885, toPrinter: "Never Has Toner")


let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}

let three = 3
let minusThree = -three       // minusThree equals -3
let plusThree = -minusThree   // plusThree equals 3, or "minus minus three"



let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 < s2
}
var reversedNames = names.sorted(by: backward(_:_:))
reversedNames = names.sorted(by: backward)
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in return s1 > s2 } )
reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 } )
let test = reversedNames = names.sorted(by: { $0 > $1 } )
reversedNames = names.sorted(by: >)
