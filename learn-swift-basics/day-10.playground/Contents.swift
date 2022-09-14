class Dog {
  var name: String
  var breed: String
  
  init(name: String, breed: String) {
    self.name = name
    self.breed = breed
  }
  
  func makeNoise() {
    print("Woof!")
  }
}


final class Poodle: Dog {
  init(name: String) {
    super.init(name: name, breed: "Poodle")
  }
  
  override func makeNoise() {
    print("Yip!")
  }
}

let poodle = Poodle(name: "Karabas")
poodle.makeNoise()


struct Singer {
  var name = "Taylor Swift"
}

var singer = Singer()
print(singer.name)

var singerCopy = singer
singerCopy.name = "Ciaht Salik"

print(singerCopy.name)
print(singer.name)



//deinit

class Person {
  var name = "John Doe"
  
  init() {
    print("\(name) is alive!")
  }
  
  func printGreeting() {
    print("********************************************************")
    print("Hello, I'm \(name)")
    print("********************************************************")
  }
  
  deinit {
    print("\(name) is no more!")
  }
}

for _ in 1...3 {
  let person = Person()
  person.printGreeting()
}


class Singer2 {
  var name = "Taylor Swift"
}

let taylor = Singer2()
taylor.name = "Ed Sheeran"
print(taylor.name)


protocol Identifiable {
    var id: String { get set }
}

struct User: Identifiable {
  var id: String
}

func displayID(thing: Identifiable) {
    print("My ID is \(thing.id)")
}


protocol Payable {
  func calculateWages() -> Int
}

protocol NeedsTraining {
  func study()
}

protocol HasVacation {
  func takeVacation(days: Int)
}

protocol EmployeeIU: Payable, NeedsTraining, HasVacation {}

class Employee: EmployeeIU {
  func calculateWages() -> Int {
    return 0
  }
  
  func study() {
  }
  
  func takeVacation(days: Int) {
  }
  
}


let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]
let beatles = Set(["John", "Paul", "George", "Ringo"])

extension Collection {
  func summarize() {
    print("There are \(count) of us!")
    for name in self {
      print(name)
    }
  }
}

pythons.summarize()
beatles.summarize()


protocol Identifiable2 {
  var id: String { get set }
  func identify()
}


extension Identifiable2 {
  func identify() {
    print("My ID is \(id)")
  }
}


struct User2: Identifiable2 {
    var id: String
}

let twostraws = User2(id: "twostraws")
twostraws.identify()
