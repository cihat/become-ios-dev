class User {
    var username: String

  init() {
    username = "Anonymous"
    print("Creating a new user !")
  }
}

var user = User()


struct Employee {
  var name: String
  var yearsActive = 0
}

extension Employee {
    init() {
        self.name = "Anonymous"
        print("Creating an anonymous employee…")
    }
}


let roslin = Employee(name: "Laura Roslin")

// as does creating an anonymous employee
let anon = Employee()


struct Person {
    var name: String

    init(name: String) {
        print("\(name) was born!")
        self.name = name
    }
}


struct Student {
    var name: String
    var bestFriend: String

    init(name studentName: String, bestFriend studentBestFriend: String) {
        print("Enrolling \(studentName) in class…")
        name = studentName
        bestFriend = studentBestFriend
    }
}

let student = Student(name: "Ciaht", bestFriend: "ahmet")



struct FamilyTree {
    init() {
        print("Creating family tree!")
    }
}

struct Person2 {
    var name: String
    lazy var familyTree = FamilyTree()

    init(name: String) {
        self.name = name
    }
}

var ed = Person2(name: "Ed")

ed.familyTree


struct Student2 {
    static var classSize = 0
    var name: String

    init(_ name: String) {
        self.name = name
        Student2.classSize += 1
    }
}

print(Student2.classSize)


let student2 = Student2("Cihat Salik")
student2.name
Student2.classSize

//
//var entropy: Int = Int.random(in: 1...1000)



struct Person4 {
  public var id: String
  
  init(id: String) {
    self.id = id
  }
  
  func identify() -> String {
    return "My social security number is \(id)"
  }
}

let person4 = Person4(id: "123")
print(person4.id)
