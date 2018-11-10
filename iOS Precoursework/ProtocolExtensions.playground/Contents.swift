import UIKit

//var str = "Hello, playground"

protocol Exercise: CustomStringConvertible {
    var name: String { get }
    var title: String { get }
    var caloriesBurned: Double { get }
    var minutes: Double { get }
}

extension Exercise {
    var description: String {
        return "Exercise(\(name), burned \(caloriesBurned) calories in \(minutes) minutes)"
    }
}

struct EllipticalWorkout: Exercise {
    let name = "Elliptical Workout"
    let title = "Workout using the Go Fast Elliptical Trainer 3000"
    let caloriesBurned: Double
    let minutes: Double
}

struct TreadmillWorkout: Exercise {
    let name = "Treadmill Workout"
    let caloriesBurned: Double
    let minutes: Double
    let laps: Double
}

extension TreadmillWorkout {
    var description: String {
        return "TreadmillWorkout(\(caloriesBurned) calories and \(laps) laps in \(minutes) minutes)"
    }
}

extension Exercise {
    var title: String {
        return "\(name) - \(minutes) minutes"
    }
}

func caloriesBurnedPerMinute<E: Exercise>(for exercise: E) -> Double {
    return exercise.caloriesBurned / exercise.minutes
}

let ellipticalWorkout = EllipticalWorkout(caloriesBurned: 335, minutes: 30)

let runningWorkout = TreadmillWorkout(caloriesBurned: 350, minutes: 25, laps: 10.5)

print(caloriesBurnedPerMinute(for: ellipticalWorkout))
print(caloriesBurnedPerMinute(for: runningWorkout))


extension Exercise {
    var caloriesBurnedPerMinute: Double {
        return caloriesBurned / minutes
    }
}

print(ellipticalWorkout.caloriesBurnedPerMinute)
print(runningWorkout.caloriesBurnedPerMinute)

extension Sequence where Iterator.Element == Exercise {
    func totalCaloriesBurned() -> Double {
        var total: Double = 0
        for exercise in self {
            total += exercise.caloriesBurned
        }
        return total
    }
}

let mondayWorkout: [Exercise] = [ellipticalWorkout, runningWorkout]
print(mondayWorkout.totalCaloriesBurned())

print(ellipticalWorkout.description)
print(runningWorkout.description)

for exercise in mondayWorkout {
    print(exercise)
}

print(ellipticalWorkout.title)
