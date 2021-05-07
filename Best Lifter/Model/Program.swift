//
//  program.swift
//  Best Lifter
//
//  Created by 피수영 on 2021/04/30.
//

import Foundation
import CoreData

// 운동
// 프로그램

enum WorkoutID: String {
    case BenchPress = "Bench Press"
    case Deadlift = "Deadlift"
    case Squat = "Squat"
    
    func toString() -> String {
        return self.rawValue
    }
    
    func toInt() -> Int {
        switch self {
        case .Squat:
            return 0
        case .BenchPress:
            return 1;
        case .Deadlift:
            return 2
        }
    }
}

struct Set {
    var setNum: Int
    var reps: Int
    var weight: Double
}

struct Excercise {
    var id: Int
    var name: String
    var sets: [Set]
}

struct Routine {
    var name: String
    var date: String
    var excercises: [Excercise]
    
    init(name: String, date: String) {
        self.name = name
        self.date = date
        self.excercises = [Excercise]()
    }
}

@objc(Program)
class Program: NSManagedObject {
    
}
