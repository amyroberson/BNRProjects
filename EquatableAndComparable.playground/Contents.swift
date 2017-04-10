//: Playground - noun: a place where people can play

import Cocoa

struct Point: Comparable {
    let x: Int
    let y: Int
    
    var distance: Double {
        let dx: Double = Double(x) - 0.0
        let dy: Double = Double(y) - 0.0
        return sqrt(dx * dx + dy * dy)
    }
    
    static func ==(lhs: Point, rhs: Point) -> Bool {
        return (lhs.x == rhs.x && rhs.y == lhs.y)
    }
    
    static func <(lhs: Point, rhs: Point) -> Bool {
        return(lhs.distance < rhs.distance)
    }
    
    static func +(lhs: Point, rhs: Point) -> Point {
        return Point(x: (lhs.x + rhs.x), y: (lhs.y + rhs.y))
    }
}

let a = Point(x: 3, y: 4)
let b = Point(x: 3, y: 4)
let abEqual = (a == b)
let abNotEqual = (a != b)
let c = Point(x: 2, y: 6)
let d = Point(x: 3, y: 7)


let cLessThanD = (c < d)
let aLessb = (a < b)
let new = c + d
print(new)
