import UIKit

var greeting = "Hello, playground"

let earthquakeStrengths = Set([1, 1, 2, 2, 232342, 2, 2, 2, 2, 2, 2, 4, 5, 5])

print("hello", earthquakeStrengths)


//Tuble
var user = (
  firstName: "Cihat",
  lastName: "Salik",
  age: 23,
  gender: "man",
  school: "Firat Uni.",
  test: ""
)

user.firstName = "Hamza"
user.lastName = "Reis"
user.test = "TEST"

type(of: user.age)

user

//Dictionary
let heights: [String: Double] = [
  "Taylor Swift": 1.78,
  "Ed Sheeran": 1.73,
  "213": 1.54,
]

heights["Taylor Swift"]
heights["213"]


let favoriteIceCream: [String: String] = [
  "Paul": "Chocolate",
  "Sophie": "Vanilla",
  "Cihat": "Islak Kek"
]

favoriteIceCream["Musa", default: "Unknown"]



//Creating empty collections

//dictionary
//var teams = [String: String]()
//teams["Paul"] = "Red"
//
////arrays
//var results = [Int]()
//results.insert(1212, at: 0)
//results.insert(1111, at: 1)
//results.insert(1112, at: 2)
//results.insert(1113, at: 3)
//results[0]


var teams = Dictionary<String, Int>()
teams["Hero"] = 30
teams["Hero2"] = 30
teams["Hero3"] = 30
teams["Hero4"] = 30
teams

var results = Array<Int>()
results.insert(1212, at: 0)
results.insert(1111, at: 1)
results.insert(1112, at: 2)
results.insert(1113, at: 3)
results


var words = Set<String>()
//words[0] = "Kalem"
words.insert("Kalem")
words.insert("Kalem2")

words


//enum
enum Result {
  case success
  case failure
  case test
}

Result.test

enum Activity {
  case bored
  case running(destination: String)
  case talking(topic: String)
  case singing(volue: Int)
}

let location = Activity.running(destination: "Gop")
let talking = Activity.talking(topic: "Football")



enum Planet: Int {
  case mercury = 10
  case venus
  case earth
  case mars
}

let earth = Planet(rawValue: 13)



let firstScore = 12
let secondScore = 4

let total = firstScore + secondScore
let difference = firstScore - secondScore
let product = firstScore * secondScore
let divided = firstScore / secondScore
let remainder = 13 % secondScore



let meaningOfLife = 42
let doubleMeaning = 42 + 42

let fakers = "Fakers gonna "
let action = fakers + "fake"

let firstHalf = ["John", "Paul"]
let secondHalf = ["George", "Ringo"]
let beatles = firstHalf + secondHalf


let firstCard = 11
let secondCard = 10

if firstCard + secondCard == 2 {
  print("Aces – lucky")
} else if firstCard + secondCard == 21 {
  print("Blackjack!")
} else {
  print("regular cards")
}


let age1 = 12
let age2 = 21

if age1 > 18 && age2 > 18 {
  print("Both are over 18")
}

if age1 > 18 || age2 > 18 {
  print("At least one is over 18")
}

let score = 85

switch score {
case 0...50:
  print("You failed badly.")
case 85:
  print("YOu are 85")
case 50..<85:
  print("You did OK.")
default:
  print("You did great!")
}


let count = 1...2


for number in 1...3 {
  print("Number is \(number)")
}


let albums = ["Red", "1989", "Reputation"]

for album in albums {
  print("\(album) is on Apple Music")
}


print("Players gonna ")


let startNumber = 10
let finishNumber = 11

for _ in startNumber...finishNumber {
  print("play")
}



var num = 1

while num <= 20 {
  print(num)
  num += 1
}

print("Ready or not, here I come ☺️")


repeat {
  print("This is false")
} while false


outerLoop: for i in 1...10 {
  for j in 1...10 {
    let product = i * j
    print("\(i) * \(j) is \(product)")
    
    if product != 50 {
      print("It's a bullseye!")
      break outerLoop
    }
  }
}


//var counter = 0
//
//while true {
//  print(" ")
//  counter += 1
//
//  if counter == 273 {
//    break
//  }
//}

