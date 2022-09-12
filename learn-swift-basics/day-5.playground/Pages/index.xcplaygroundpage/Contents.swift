import UIKit

var greeting = "Hello, playground"

func printHelp() {
  let message = """
  Welcome to MyApp!
  
  Run this app inside a directory of images and
  MyApp will resize them all into thumbnails
  """
  
  print(message)
}

printHelp()

func square(number: Int) -> Int {
  print(number * number)
  return number * number
}

square(number: 5)


//Parameter labels

func sayHello(to name: String) -> Void {
  print("Hello \(name) !👋🏻")
}

sayHello(to: "Ahmet")


func greet2(_ person: String) {
  print("Hello, \(person)!")
}

greet2  ("Hasan")


func greet(_ person: String, nicely: Bool = true) {
  if nicely == true {
    print("Hello, \(person)")
  } else {
    print("Oh no, it's \(person) again...")
  }
}


greet("Veli", nicely: true)


func square(numbers: Int...) {
    for number in numbers {
        print("\(number) squared is \(number * number)")
    }
}



func square2(_ numbers: Int...) -> Void {
  for number in numbers {
    print("\(number) squared is \(number * number)")
  }
}


square2(1, 2, 3, 4, 5, 6, 6, 6, 3)


enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
  if password == "password" {
    throw PasswordError.obvious
  }
  
  return true
}

do {
  try checkPassword("password")
  print("That password is good!")
} catch {
  print("You can't use that password.")
}

//inout parameters
func change(_ number: inout Int){
  number = 2
}
var number = 1
change(&number)
print(number)


//let driving = {
//  print("I'm driving in my car")
//}
//
//driving()


//let driving = {(place: String) in
//  print("I'm going to \(place) in my car")
//}

//driving("Adiyaman")
//

//let drivingWithReturn = {( place: String ) -> String in
//  return "I'm going to \(place) in my car"
//}
//
//drivingWithReturn("London")
//
//
//let driving = {
//    print("I'm driving in my car")
//}
//
//func travel(action: () -> Void) {
//  print("I'm getting ready to go.")
//  print("I'm getting ready to go.")
//  action()
//  print("I arrived!")
//}
//
//travel(action: driving)


//func travel(action: (String) -> Void) {
//  print("I'm getting ready to go.")
//  action("London")
//  print("I arrived!")
//}
//
//travel {(place: String) in
//  print("I'm going to \(place) in my car")
//}


//func travel(action: (String) -> String) {
//  print("I'm getting ready to go.")
//  let description = action("London")
//  print(description)
//  print("I arrived!")
//}
//
//travel {(place: String) -> String in
//  return "I'm going to \(place) in my car"
//}
//


func travel(action: (String, Int) -> String) {
  print("I'm getting ready to go.")
  let description = action("London", 234)
  print(description)
  print("I arrived!")
}

travel {
  "I'm going to \($0) at \($1) miles per hour."
}


func travel2() -> (String, Int) -> Void {
  return {
    print("I'm going to \($0) and per second \($1)")
  }
}


let result = travel2()
result("Adiyaman", 50)

travel2()("Ankara", 100)


func travel3() -> (String) -> Void {
    var counter = 1

    return {
        print("\(counter). I'm going to \($0)")
        counter += 1
    }
}


let result2 = travel3()

result2("London")

result2("Adiyaman")
result2("Malatya")
result2("Urfa")
result2("Samsun")
result2("Van")


struct Sport {
  var name: String
}

var tennis = Sport(name: "Tennis")
tennis.name





struct Sport2 {
  var name: String
  var isOlympicSport: Bool
  
  var olympicStatus: String {
    if isOlympicSport {
      return "\(name) is an Olympic sport"
    } else {
      return "\(name)' is not a Olympic sport"
    }
  }
}

let sport = Sport2(name: "Gures", isOlympicSport: true)
sport.olympicStatus


struct Progress {
  var task: String
  var amound: Int {
    willSet {
      print("\(task) is now \(amound)% completed❌")
    }
  }
}


var progress1 = Progress(task: "Loading Data", amound: 0)
progress1.amound = 30
progress1.amound = 80
progress1.amound = 100



struct City {
  var population: Int
  
  func collectTaxes() -> Int {
    return population * 1000
  }
}


let istanbul = City(population: 9_000_000_000)

struct Person {
    var name: String

    mutating func makeAnonymous() {
      name = "Cihat"
    }
}

var person = Person(name: "Ed")
person.makeAnonymous()
print(person)


var toys = ["Woody"]

print(toys.count)
toys.append("Buzz")
toys.firstIndex(of: "Buzz")
toys.sorted()
toys.remove(at: 0)
