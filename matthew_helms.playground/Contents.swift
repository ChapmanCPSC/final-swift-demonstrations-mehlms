//: Playground - noun: a place where people can play

import UIKit

// THROWABLE ERRORSS
let err = NSError(domain: "melms.net", code: 0, userInfo: nil)
enum Error : ErrorType
{
    case Error
    case Success
}

func failure() throws
{
    throw Error.Error
}

do {
    try failure()
}
catch Error.Error {
    //only catches if error is error.whoops happened
    print("Whoops, that's an error")
}
catch Error.Success {
    //only happens when error is Error.How
    print("How did you manage this?")
}

try? failure()

// OPTIONAL CLASS STUFF
class Person {
    var name : String?
    
    func sayHello()
    {
        print ("Hello")
    }
}

var p1 = Person()
var p2 : Person?

p1.sayHello()
p2?.sayHello()

p1.name = "John"
p1.name!.uppercaseString
p2?.name?.lowercaseString

// ENUMS
enum status {
    case running
    case initiated
    case finished
    case idle
}

let process1 = status.initiated
let process2 = status.finished
let process3 = status.idle

// RAW VALUE ENUMS
enum living : String{
    case apt = "apartment"
    case hou = "house"
    case stu = "studio"
    case dor = "dorm"
}

let person1 = "apartment"
let person2 = living(rawValue: person1)
let person3 = living.dor

// ARRAY
let nums : [Int]!
nums = [10, 23, 8, 6, 15, 16, 5]

// SLICING
nums[2...4]

let expensiveLiving : [living] = [.hou, .apt]
let inexpensive : [living] = [.dor, .stu]

// Init, Failable Init, Casting, static variable
class Machine {
    var classification : String
    var cost : Int
    static var owner : String = "John Smith"
    
    init?(classification : String, cost : Int = 0, owner : String = "Owner not defined") {
        self.classification = classification
        self.cost = cost
        
        if cost <= 0 {
            return nil
        }
    }
    
    func createMachine() {
        print("Machine created")
    }
}

var m : Machine? = Machine(classification: "medical", cost : 27000)
m!.createMachine() // unwrap to call

var m2 = Machine(classification: "medical", cost: 0)
m2?.createMachine() // will not unwrap since init? returned nil

// SUBSCRIPTS
class peopleCollection {
    private var people = ["Jason", "Ryan", "Jack", "Chris", "Jess", "Jackie", "Kate"]
    subscript(idx : Int) -> String {
        return self.people[idx]
    }
}

let people = peopleCollection()
print("Do you know \(people[2])?")

// STRUCTS
struct breakfast
{
    var restaurant : String
    var meal : String
}

let b1 = breakfast(restaurant: "Olive Garden", meal: "Garlic bread")
var b2 = b1
b2.meal = "lasagna"

// INHERITANCE
class mammal {
    var name : String
    var age : Int
    
    init (name : String, age: Int) {
        self.name = name
        self.age = age
    }
    
    convenience init() {
        self.init(name : "", age : 0)
        print("soo convenient")
    }
    
    func sleep() {
        print("going to sleep")
    }
}

class human : mammal {
    final override func sleep() {
        super.sleep()
        print("zzzzzzzz")
    }
    func doWork() {
        print("stress, then not do work")
    }
}

final class dolphin : mammal {
    override func sleep() {
        super.sleep()
        print("EHEHEHEHEHHR")
    }
    
    func mate() {
        print("dolphin is now currently mating")
    }
}

let Kevin = dolphin(name: "Kevin", age: 100)
Kevin.sleep()
Kevin.mate()

// PROTOCOLS
protocol Baby {
    var name : String {get}
    func eat() -> Void
    func breath() -> Void
}

class UglyBaby : Baby {
    var name : String = "Matthew"
    
    func eat() {
        print("mmm yummy food)")
    }
    
    func breath() {
        print("H2O")
    }
}

var bae = UglyBaby()
bae.breath()
bae.eat()

// UMBRELLA
func anyObjectExpect(obj : AnyObject) {}
func anyClassExpect(cls : AnyClass) {}
func anyExpect(a : Any) {}

anyObjectExpect("hello")
anyObjectExpect(bae)

anyObjectExpect(UIView)
anyObjectExpect(UglyBaby)

anyExpect("")
anyExpect(String)


// EXTENSIONS
extension String {
    func add(s2 : String) -> Int {
        return Int(self)! + Int(s2)!
    }
}

let str1 = "2"
let str2 = "4"

print (str1.add(str2))

// TERNARY OPERATORS
let num = 10
let posNeg = (num < 0) ? "negative" : "Positive"

// WHILE
var persons : [String] = ["Matt", "Ryan", "John"]
while let name = persons.popLast() {
    print(name)
}

// SQL LIKE FOR IN
for var num in nums where num - 14 > 0 {
    print(num)
}

// OUTER BREAK
outer: for x in 0 ... 10
{
    for y in 0 ... 10
    {
        print("(\(x),\(y))")
        if x == 3 && y == 2
        {
            break outer
        }
    }
}

// INDEX
print(nums[4])

// DICTIONARIES
var cats = [Int:String]()
cats[19834] = "Coco"
cats[12432] = "Kai"
cats[11111] = "James"
cats[13240] = "Cali"
cats

// EENUMERATIONS
let subset = cats.filter { (id, name) -> Bool in
    return name.containsString("a")
}










