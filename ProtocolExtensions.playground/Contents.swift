//: Playground - noun: a place where people can play

import Cocoa

protocol Exercise : CustomStringConvertible{
    var name: String { get }
    var caloriesBurned: Double { get }
    var minutes: Double { get }
    var title: String { get }
    
    
}

extension Exercise {
    var description: String {
        return "Exercise \(name), burned \(caloriesBurned) calories in \(minutes) minutes."
    }
}

struct EllipticalWorkout: Exercise {
    let name = "Elliptical Workout"
    let title = "Workout using Go Fast Trainer 3000"
    let caloriesBurned: Double
    let minutes: Double
}

struct TreadmillWorkout: Exercise {
    let name = "Treadmill Workout"
    let title = "Used Tread On for this workout"
    let caloriesBurned: Double
    let minutes: Double
    let laps: Double
}

extension TreadmillWorkout {
    var description: String {
        return "Treadmill Workout \(caloriesBurned) calories and \(laps) laps in \(minutes) minutes."
    }
}





let ellipticalWorkout = EllipticalWorkout(caloriesBurned: 335, minutes: 30)
let runningWorkout = TreadmillWorkout(caloriesBurned: 350, minutes: 25, laps: 10.5)

extension Exercise {
    var caloriesBurnedPerMinute: Double {
        return caloriesBurned / minutes
    }
}

print(ellipticalWorkout.caloriesBurnedPerMinute)

extension Sequence where Iterator.Element == Exercise {
    func totalCaloriesBurened() -> Double {
        var total: Double = 0
        for exercise in self {
            total += exercise.caloriesBurned
        }
        return total
    }
}

let mondayWorkout: [Exercise] = [ellipticalWorkout, runningWorkout]
print(mondayWorkout.totalCaloriesBurened())
print(runningWorkout)
for excercise in mondayWorkout {
    print(excercise.title)
}
print(ellipticalWorkout.title)


