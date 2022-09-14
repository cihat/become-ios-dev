var name: String
name = "Cihat Salik"

func getHaterStatus(weather: String) -> String? {
  if weather == "sunny" {
    return nil
  } else {
    return "Hate"
  }
}

func takeHaterAction(status: String) {
  if status == "Hate" {
    print("Hating")
  }
}

if let haterStatus = getHaterStatus(weather: "rainy") {
  takeHaterAction(status: haterStatus)
}


func yearAlbumReleased(name: String) -> Int? {
  if name == "cihat Swift" { return 2006 }
  if name == "Fearless" { return 2008 }
  if name == "Speak Now" { return 2010 }
  if name == "Red" { return 2012 }
  if name == "1989" { return 2014 }
  
  return nil
}

var year = yearAlbumReleased(name: "Red")

if year == nil {
  print("There was an error")
} else {
  print("It was released in \(year!)")
}

var uhoh: String? = nil
print("here comes a crash", uhoh ?? "TEts")


//var songs = [String]()
//var songs2: [String] = []

var songs = ["Shake it Off", "You Belong with Me", "Love Story"]
var songs2 = ["Today was a Fairytale", "Welcome to New York", "Fifteen"]
var both = songs + songs2

both += ["Everything has Changed"]


var person = [
  "first": "Taylor",
  "middle": "Alison",
  "last": "Swift",
  "month": "December",
  "website": "taylorswift.com"
]

person["middle"]
person["month"]

let endNum: Int = 10
let startNum: Int = 1

for i in startNum...endNum {
  print("\(i) x 10 is \(i * 10)")
}


var people = ["players", "haters", "heart-breakers", "fakers"]
var actions = ["play", "hate", "break", "fake"]

for i in 0..<people.count {
  var str = "\(people[i]) gonna"
  
  for _ in 1...5 {
    str += " \(actions[i])"
  }
  
  print(str)
}

let liveAlbums = 2

switch liveAlbums {
case 0:
  print("You're just starting out")
  
case 1:
  print("You just released iTunes Live From SoHo")
  
case 2:
  print("You just released Speak Now World Tour")
  
default:
  print("Have you done something new?")
}


func getMeaningOfLife(_ value: String) -> String {
  value
}

getMeaningOfLife("Test")


func albumReleased(year: Int) -> String? {
  switch year {
  case 2006: return "Taylor Swift"
  case 2008: return "Fearless"
  case 2010: return "Speak Now"
  case 2012: return "Red"
  case 2014: return "1989"
  default: return nil
  }
}

let album = albumReleased(year: 2014)
if let checkAlbum = album {
  print("The album is \(checkAlbum)")
} else {
  print("Album's release date not found")
}

enum WeatherType {
  case sun
  case cloud
  case rain
  case wind(speed: Int)
  case snow
}

func getHaterStatus(weather: WeatherType) -> String? {
  switch weather {
  case .sun:
    return nil
  case .wind(let speed) where speed < 10:
    return "meh"
  case .cloud, .wind:
    return "dislike"
  case .rain, .snow:
    return "hate"
  }
}
getHaterStatus(weather: WeatherType.wind(speed: 5))


func knockKnock(_ caller: String?) {
  print("Who's there ?")
  
  switch caller {
  case .none:
    print("* silence *")
  case .some(let person):
    print(person)
  }
}

knockKnock(nil)
knockKnock("Orange")


//Struct
struct Person {
    var clothes: String
    var shoes: String
  
  init(clothes: String, shoes: String) {
    self.clothes = clothes
    self.shoes = shoes
  }
}

let taylor = Person(clothes: "T-shirts", shoes: "sneakers")
let other = Person(clothes: "short skirts", shoes: "high heels")

var taylorCopy = taylor
taylorCopy.shoes = "flip flops"

print(taylor)
print(taylorCopy)

struct Person2 {
  var clothes: String
  var shoes: String
  
  func describe() {
    print("I like wearing \(clothes) with \(shoes)")
  }
}

let taylor2 = Person2(clothes: "T-shirts", shoes: "sneakers")
taylor2.describe()


//Class
//class Person3 {
//    var clothes: String
//    var shoes: String
//}


let peope: String
peope = "TESt"

class Singer {
    private var name: String
    var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }

    func sing() {
        print("La la la la")
    }
}

var veli = Singer(name: "veli", age: 25)
veli.age
veli.age
veli.sing()


class CountrySinger: Singer {
    override func sing() {
        print("Trucks, guitars, and liquor")
    }
}

var cihat = CountrySinger(name: "cihat", age: 25)
cihat.sing()


class HeavyMetalSinger: Singer {
    var noiseLevel: Int

    init(name: String, age: Int, noiseLevel: Int) {
        self.noiseLevel = noiseLevel
        super.init(name: name, age: age)
    }

    override func sing() {
        print("Grrrrr rargh rargh rarrrrgh!")
    }
}

let heavyCihat = HeavyMetalSinger(name: "Cihat", age: 22, noiseLevel: 45)
heavyCihat.sing()
heavyCihat.noiseLevel
heavyCihat.age
