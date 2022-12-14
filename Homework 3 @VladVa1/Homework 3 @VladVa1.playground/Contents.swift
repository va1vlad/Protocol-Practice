import UIKit
import Foundation

//MARK: - PROTOCOL task 1
protocol Movable {
    func run()
}

protocol Fightable {
    func fight()
}

protocol Heroic: Movable, Fightable {
    var name: String { get set }
}

//MARK: - STRUCT Movable
struct Farmer: Movable {
    func run() {
        print("Farmer: ðð»ââï¸")
    }
}

struct Bartender: Movable {
    func run() {
        print("Bartender: ð¥ðð»ââï¸")
    }
}

//MARK: - STRUCT Fightable
struct Bandit: Fightable {
    func fight() {
        print("Bandit: ð¥")
    }
}

struct Butcher: Fightable {
    func fight() {
        print("Butcher: ð¥")
    }
}

//MARK: - STRUCT Heroic
struct Cowboy: Heroic {
    var name: String
    
    func run() {
        print("Cowboy \(name): Run")
    }
    
    func fight() {
        print("The cowboy \(name) started a fightð¥")
    }
}

struct Sheriff: Heroic {
    var name: String
    
    func run() {
        print("Sheriff \(name): Run")
    }
    
    func fight() {
        print("The sheriff \(name) started a fightð¥")
    }
}

//MARK: - CLASS
class Tavern {
    var fighters: [Fightable] = []
    var movers: [Movable] = []
    
    func enterTavern(hero: Heroic) {
        hero.fight()
        
        for mover in movers {
            mover.run()
        }
        
        for fighter in fighters {
            fighter.fight()
        }
    }
}

//MARK: - character creation
var ron = Farmer()
var roy = Bartender()

var dillinger = Bandit()
var boby = Butcher()

var billy = Cowboy(name: "Kid")
var mrSmith = Sheriff(name: "mr. Smith")

var tavern = Tavern()
tavern.movers = [ron, roy]
tavern.fighters = [dillinger, boby]

//tavern.enterTavern(hero: billy)

//MARK: - 2, 4
protocol Emotions {
    func showEmotion(name: String, status: Bool) -> String?
}

struct Gambler {
    var nickname: String
    var status = true
    var hand: [Int] = []
}

class Game {
    var cards = [
        2, 3, 4, 6, 7, 8, 9, 10, 11,
        2, 3, 4, 6, 7, 8, 9, 10, 11,
        2, 3, 4, 6, 7, 8, 9, 10, 11,
        2, 3, 4, 6, 7, 8, 9, 10, 11,
    ]
    
    func startTheGame(firstPlayer: Gambler, secondPlayer: Gambler) {
        cards.shuffle()
    
        var firstPlayer = firstPlayer
        var secondPlayer = secondPlayer
        
        print("We start the game \nGentlemen here are your cardsð\n")
        sleep(1)
        //FOR FIRST
        for (index ,card) in cards[0...1].enumerated() {
            firstPlayer.hand.append(card)
            cards.remove(at: index)
        }
        print("\(firstPlayer.nickname) cards \(firstPlayer.hand)ð¤¯")
        //FOR SECOND
        for (index ,card) in cards[0...1].enumerated() {
            secondPlayer.hand.append(card)
            cards.remove(at: index)
        }
        print("\(secondPlayer.nickname) cards \(secondPlayer.hand)ð«¡\n")
        sleep(1)
        //RESULT
        if firstPlayer.hand.reduce(0, +) > secondPlayer.hand.reduce(0, +) {
            print(firstPlayer.showEmotion(name: firstPlayer.nickname, status: true)!)
            print(secondPlayer.showEmotion(name: secondPlayer.nickname, status: false)!)
            sleep(1)
            print("\(firstPlayer.nickname) win, he has \(firstPlayer.hand.reduce(0, +)) pointsð")
            
        } else if firstPlayer.hand.reduce(0, +) < secondPlayer.hand.reduce(0, +) {
            print(secondPlayer.showEmotion(name: secondPlayer.nickname, status: true)!)
            print(firstPlayer.showEmotion(name: firstPlayer.nickname, status: false)!)
            sleep(1)
            print("\(secondPlayer.nickname) win, he has \(secondPlayer.hand.reduce(0, +)) pointsð")
            
        } else {
            print("You have sameð¥¶")
        }
    }
}

var gambler = Gambler(nickname: "Salivan")
var regular = Gambler(nickname: "Bill")

var casic = Game()
casic.startTheGame(firstPlayer: gambler, secondPlayer: regular)

//MARK: - extension
extension Gambler: Emotions {
    func showEmotion(name: String, status: Bool) -> String? {
        if status == true {
            return "\(name) wonð¤"
        } else {
            return "\(name) lostð­\n"
        }
    }
}

//MARK: - TASK 3
// â Int - Ð¤ÑÐ½ÐºÑÑÑ Ð·Ð²Ð¾Ð´Ð¸ÑÑ ÑÐ¸ÑÐ»Ð¾ N ÑÑÑÐ¿ÑÐ½Ñ. Ð¡Ð¿ÑÐ¾Ð±ÑÐ¹ÑÐµ Ð²Ð¸ÑÑÑÐ¸ÑÐ¸ Ð·Ð°Ð´Ð°ÑÑ Ð±ÐµÐ· Ð²Ð¸ÐºÐ¾ÑÐ¸ÑÑÐ°Ð½Ð½Ñ ÑÑÐ°Ð½Ð´Ð°ÑÑÐ½Ð¾Ñ ÑÑÐ½ÐºÑÑÑ pow(), ÑÐ¾Ð·Ð²'ÑÐ¶ÑÑÑ ÑÑ Ð· Ð²Ð¸ÐºÐ¾ÑÐ¸ÑÑÐ°Ð½Ð½ÑÐ¼ ÑÐ¸ÐºÐ»ÑÐ²

extension Int {
    func usePower(_ pow: Int) {
        var startNum = self
        for _ in 1...pow - 1 {
            startNum *= self
        }
        print(startNum)
    }
}

var num = 9
//num.usePower(4)
//num.usePower(3)
//num.usePower(2)

// â String - ÐÐ±ÑÐ¸ÑÐ»ÑÐ²Ð°Ð½Ð° Ð²Ð»Ð°ÑÑÐ¸Ð²ÑÑÑÑ isPalindrome. ÐÐ¾Ð²ÐµÑÑÐ°Ñ Bool, Ð·Ð°Ð»ÐµÐ¶Ð½Ð¾ Ð²ÑÐ´ ÑÐ¾Ð³Ð¾, ÑÐ¸ Ñ ÑÑÐ´Ð¾Ðº Ð¿Ð°Ð»ÑÐ½Ð´ÑÐ¾Ð¼Ð¾Ð¼
let letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]

extension String {
    func isPalindrome() -> Bool {
        let phrase = self.uppercased().filter { letters.contains(String($0)) }
        return phrase == String(phrase.reversed())
    }
}

var first = "Do geese see God?"
var second = "Sir, I demand, I am a maid named Iris."
first.isPalindrome()
second.isPalindrome()

var firstTest = "A Do geese see God?"
var secondTest = "SirR, I demand, I am a maid named Iris."
firstTest.isPalindrome()
secondTest.isPalindrome()

//MARK: - TASK 5
// â Ð¤ÑÐ½ÐºÑÐ¸Ñ, Ð¿ÑÐ¸Ð½Ð¸Ð¼Ð°ÑÑÑÑ Ð´Ð²Ð° Ð¿Ð°ÑÐ°Ð¼ÐµÑÑÐ° Ð¸ Ð¼ÐµÐ½ÑÑÑÑÑ Ð¼ÐµÑÑÐ°Ð¼Ð¸ Ð¸Ñ Ð·Ð½Ð°ÑÐµÐ½Ð¸Ñ
func flipElements<T>(_ first: inout T,_ second: inout T) {
    var container = first
    first = second
    second = container
}

var first1 = 120
var second1 = 404

//var first1 = true
//var second1 = false

//var first1 = 120.3
//var second1 = 404.6

//print("First \(first1), Second \(second1)")
//flipElements(&first1, &second1)
//print("First \(first1), Second \(second1)")

// â Ð¤ÑÐ½ÐºÑÐ¸Ñ, Ð¿ÑÐ¸Ð½Ð¸Ð¼Ð°ÑÑÑÑ Ð´Ð²Ð° Ð¿Ð°ÑÐ°Ð¼ÐµÑÑÐ° Ð¸ Ð²Ð¾Ð·Ð²ÑÐ°ÑÐ°ÑÑÑÑ typle Ñ Ð½Ð¸Ð¼Ð¸ Ð¶Ðµ
func createTuple<T, P>(_ first: T,_ second: P) -> (T, P) {
    var tuple = (first, second)
    return tuple
}

createTuple(true, "Vlad")
createTuple(4.45, "percent")

let container = createTuple(1, "one")
let oneInt = container.0
let oneStrind = container.1

// â Ð¤ÑÐ½ÐºÑÐ¸Ñ ÑÐ»Ð¾Ð¶ÐµÐ½Ð¸Ñ, ÐºÐ¾ÑÐ¾ÑÐ°Ñ Ð¿ÑÐ¸Ð½Ð¸Ð¼Ð°ÐµÑ Ð´Ð²Ð° Ð¿Ð°ÑÐ°Ð¼ÐµÑÑÐ° Ð¸ Ð²Ð¾Ð·Ð²ÑÐ°ÑÐ°ÐµÑ Ð¸Ñ ÑÑÐ¼Ð¼Ñ
func addition<T: AdditiveArithmetic>(_ first: T,_ second: T) -> T {
    return first + second
}

addition(4.412345432423423, 5.6)
addition(5, 5.6)
addition(14, 39)

// â Ð¢Ð¸Ð¿, ÐºÐ¾ÑÐ¾ÑÑÐ¹ ÑÐ¾Ð´ÐµÑÐ¶Ð¸Ñ ÑÐ²Ð¾Ð¹ÑÑÐ²Ð¾ - Dictionary Ñ Ð´Ð°Ð½Ð½ÑÐ¼Ð¸. ÐÐ°Ð¿Ð¸ÑÐ¸ÑÐµ ÑÑÐ½ÐºÑÐ¸Ð¸, ÐºÐ¾ÑÐ¾ÑÑÐµ Ð´Ð¾Ð±Ð°Ð²Ð»ÑÑÑ Ð² ÑÑÐ¾Ñ ÑÐ»Ð¾Ð²Ð°ÑÑ Ð·Ð½Ð°ÑÐµÐ½Ð¸Ðµ Ð¿Ð¾ ÐºÐ»ÑÑÑ Ð¸ Ð´Ð¾ÑÑÐ°ÑÑ Ð·Ð½Ð°ÑÐµÐ½Ð¸Ðµ Ð¿Ð¾ ÐºÐ»ÑÑÑ
struct SomeStruct<T: Hashable, S> {
    var dict: [T: S] = [:]
    
    mutating func addValueByKey(_ key: T, _ value: S) {
        dict[key] = value
    }
    
    mutating func getValueByKey(_ key: T) -> S? {
        return dict[key]
    }
}

var dictionary = SomeStruct<String, String>()
dictionary.addValueByKey("Lerner", "Dan")
dictionary.addValueByKey("Teacher", "Danilov")
dictionary.addValueByKey("Professor", "mr. Max")

dictionary.dict

//if let testt = dictionary.getValueByKey("rere") {
//    print(testt)
//}

dictionary.getValueByKey("erererer")
dictionary.getValueByKey("Teacher")
dictionary.getValueByKey("Professor")

//MARK: - TASK 6
// â  ÐÐ¸ÐºÐ¾Ð½Ð°Ð¹ÑÐµ Ð¿ÑÐ°ÐºÑÐ¸ÐºÑ Ð´ÑÑÐ³Ð¾Ð³Ð¾ ÑÐ»Ð°Ð¹Ð´Ñ. Ð¢ÑÑ Ð²Ð¸ Ð¼Ð¾Ð¶ÐµÑÐµ ÑÐµÐ°Ð»ÑÐ·ÑÐ²Ð°ÑÐ¸ Ð°Ð±Ð¾ ÑÑÐµÐº Ð°Ð±Ð¾ Ð¿Ð¾Ð²'ÑÐ·Ð°Ð½Ð¸Ð¹ ÑÐ¿Ð¸ÑÐ¾Ðº (stack / linked list)
struct Stack<Element> {
    var stack: [Element] = []
    // adds an element
    mutating func push(_ yourElement: Element) {
        stack.append(yourElement)
    }
    // removes the first added element
    mutating func pop() -> Element? {
        var exFirst = stack.first
        stack.removeFirst()
        return exFirst
    }
    // returns the first added element
    mutating func peek() -> Element? {
        return stack.first
    }
    // removes the last added element element
    mutating func destruction() {
        stack.removeLast()
    }
    // removes the stack
    mutating func clear() {
        stack.removeAll()
    }
}

var stack = Stack<Double>()
stack.push(1.5)
stack.push(2.6)
stack.push(3.7)

stack.stack

stack.pop()
stack.stack

stack.peek()
stack.stack

stack.destruction()
stack.stack

stack.clear()
stack.stack



