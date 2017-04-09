//: Playground - noun: a place where people can play

import Cocoa

struct StackIterator<T>: IteratorProtocol {
    
    var stack: Stack<T>
    mutating func next() -> T? {
        return stack.pop()
    }
}

struct Stack<Element>: Sequence {
    var items = [Element] ()
    mutating func push(_ newItem: Element) {
        items.append(newItem)
    }
    
    mutating func pop() -> Element? {
        guard !items.isEmpty else {
            return nil
        }
        return items.removeLast()
    }
    
    func map<U>(_ f: (Element) -> U) -> Stack<U> {
        var mappedItems = [U]()
        for item in items {
            mappedItems.append(f(item))
        }
        return Stack<U>(items: mappedItems)
    }
    
    func makeIterator() -> StackIterator<Element> {
        return StackIterator(stack: self)
    }
    
    mutating func pushAll<S: Sequence>(_ sequence: S)
            where S.Iterator.Element == Element {
        for i in sequence{
            self.push(i)
        }
        
    }
}

var intStack = Stack<Int>()
intStack.push(1)
intStack.push(2)
var doubleStack = intStack.map { 2 * $0 }

intStack.pop()
intStack.pop()
intStack.pop()

print(doubleStack.pop() ?? "d")

var stringStack = Stack<String>()
stringStack.push("First")
stringStack.pop()

func myMap<T,U>(_ items: [T], _ f:(T) -> (U)) -> [U] {
    var result = [U]()
    for item in items{
        result.append(f(item))
    }
    return result
}
let strings = ["one", "two", "three"]
let stringsLength = myMap(strings) {$0.characters.count }
print(stringsLength)


func checkIfDescriptionsMatch<T: CustomStringConvertible, U: CustomStringConvertible>(_ first: T, _ second: U) -> Bool {
    return first.description == second.description
}

print(checkIfDescriptionsMatch(Double(1.0), Float(1.0)))

var myStack = Stack<Int>()

myStack.push(1)
myStack.push(3)
myStack.push(5)
var myStackIterator = StackIterator(stack: myStack)

while let value = myStackIterator.next(){
    print("My value is \(value)")
}

for value in myStack {
  print("for in loop: \(value)")
}

var otherStack = Stack<Int>()
otherStack.pushAll([1,2,3,4,5])
for value in otherStack {
    print(value)
}

