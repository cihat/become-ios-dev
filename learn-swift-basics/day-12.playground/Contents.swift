var age: Int? = nil
age = 22

var name: String? = "Ciaht"

if let unwrapped = name {
  print("\(unwrapped.count) letters")
} else {
  print("Missing name.")
}

func greet(_ name: String?) {
  guard let unwrapped = name else {
    print("You didn't provide a name!")
    return
  }
  
  print("Hello, \(unwrapped)!")
}

greet("Cihat")


let str = "242343242234234"
let num = Int(str)!


let age2: Int! = 1000

func username(for id: Int) -> String? {
  if id == 1  {
    return "Taylor Swift"
  } else {
    return nil
  }
}

let user = username(for: 15) ?? "Anonymous"

let names = ["John", "Paul", "George", "Ringo"]

let beatle = names.first?.uppercased()


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
  try! checkPassword("sekrit")
  print("OK!")
}

struct Person {
  var id: String
  
  init?(id: String) {
    if id.count == 9 {
      self.id = id
    } else {
      return nil
    }
  }
}

let cihat = Person(id: "123123123")


class Animal {
  func makeNoise() {
    print("TEst")
  }
}
class Dog: Animal {

}
class Fish: Dog {
  override func makeNoise() {
    print("Blug blug")
  }
}


let pets = [Fish(), Dog(), Fish(), Dog(), Dog(), Dog(), Fish(), Fish(), Fish()]
pets.count
for pet in pets {
  if let dog = pet as? Dog {
    dog.self
  }
}
