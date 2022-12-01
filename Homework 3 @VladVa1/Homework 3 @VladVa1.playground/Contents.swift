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
        print("Farmer: 🏃🏻‍♂️")
    }
}

struct Bartender: Movable {
    func run() {
        print("Bartender: 🥃🏃🏻‍♂️")
    }
}

//MARK: - STRUCT Fightable
struct Bandit: Fightable {
    func fight() {
        print("Bandit: 🥊")
    }
}

struct Butcher: Fightable {
    func fight() {
        print("Butcher: 🥊")
    }
}

//MARK: - STRUCT Heroic
struct Cowboy: Heroic {
    var name: String
    
    func run() {
        print("Cowboy \(name): Run")
    }
    
    func fight() {
        print("The cowboy \(name) started a fight🥋")
    }
}

struct Sheriff: Heroic {
    var name: String
    
    func run() {
        print("Sheriff \(name): Run")
    }
    
    func fight() {
        print("The sheriff \(name) started a fight🥋")
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
        
        print("We start the game \nGentlemen here are your cards🃏\n")
        sleep(1)
        //FOR FIRST
        for (index ,card) in cards[0...1].enumerated() {
            firstPlayer.hand.append(card)
            cards.remove(at: index)
        }
        print("\(firstPlayer.nickname) cards \(firstPlayer.hand)🤯")
        //FOR SECOND
        for (index ,card) in cards[0...1].enumerated() {
            secondPlayer.hand.append(card)
            cards.remove(at: index)
        }
        print("\(secondPlayer.nickname) cards \(secondPlayer.hand)🫡\n")
        sleep(1)
        //RESULT
        if firstPlayer.hand.reduce(0, +) > secondPlayer.hand.reduce(0, +) {
            print(firstPlayer.showEmotion(name: firstPlayer.nickname, status: true)!)
            print(secondPlayer.showEmotion(name: secondPlayer.nickname, status: false)!)
            sleep(1)
            print("\(firstPlayer.nickname) win, he has \(firstPlayer.hand.reduce(0, +)) points😎")
            
        } else if firstPlayer.hand.reduce(0, +) < secondPlayer.hand.reduce(0, +) {
            print(secondPlayer.showEmotion(name: secondPlayer.nickname, status: true)!)
            print(firstPlayer.showEmotion(name: firstPlayer.nickname, status: false)!)
            sleep(1)
            print("\(secondPlayer.nickname) win, he has \(secondPlayer.hand.reduce(0, +)) points😎")
            
        } else {
            print("You have same🥶")
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
            return "\(name) won🤑"
        } else {
            return "\(name) lost😭\n"
        }
    }
}

//MARK: - TASK 3
// ● Int - Функція зводить число N ступінь. Спробуйте вирішити задачу без використання стандартної функції pow(), розв'яжіть її з використанням циклів

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

// ● String - Обчислювана властивість isPalindrome. Повертає Bool, залежно від того, чи є рядок паліндромом
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
// ● Функцию, принимающую два параметра и меняющую местами их значения
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

// ● Функцию, принимающую два параметра и возвращающую typle с ними же
func createTuple<T, P>(_ first: T,_ second: P) -> (T, P) {
    var tuple = (first, second)
    return tuple
}

createTuple(true, "Vlad")
createTuple(4.45, "percent")

let container = createTuple(1, "one")
let oneInt = container.0
let oneStrind = container.1

// ● Функцию сложения, которая принимает два параметра и возвращает их сумму
func addition<T: AdditiveArithmetic>(_ first: T,_ second: T) -> T {
    return first + second
}

addition(4.412345432423423, 5.6)
addition(5, 5.6)
addition(14, 39)

// ● Тип, который содержит свойство - Dictionary с данными. Напишите функции, которые добавляют в этот словарь значение по ключу и достают значение по ключу
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
// ●  Виконайте практику другого слайду. Тут ви можете реалізувати або стек або пов'язаний список (stack / linked list)
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



