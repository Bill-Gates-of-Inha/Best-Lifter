//
//  OnWorkoutViewModel.swift
//  Best Lifter
//
//  Created by 피수영 on 2021/05/03.
//

import Foundation
import Combine

class OnWorkoutViewModel: ObservableObject {
    // 로컬 디비 구축 필요
    @Published var program: Routine
    
    // Timer Variables
    @Published var timerString: String = "00:00"
    private var cancellable: AnyCancellable!
    private var onWorkoutTimerModel = OnworkoutTimerModel(timeInterval: 1)
    
    init() {
        self.program = Routine(name: "운동", date: "")
        cancellable = onWorkoutTimerModel.$timeString
            .map({$0.description})
            .assign(to: \OnWorkoutViewModel.timerString, on: self)
    }
}


// MARK: Get/Set Workout Methods
extension OnWorkoutViewModel {
    func getWorkouts() -> [Excercise] {
        return program.excercises
    }
    
    func getWorkoutSet(name: String) -> [Set] {
        var set: [Set] = []
        for i in self.program.excercises {
            if i.name.elementsEqual(name) {
                set = i.sets
                break
            }
        }
        
        return set
    }
    
    func addWorkout(name: String) {
        let id = WorkoutID.init(rawValue: name)?.toInt() ?? 0
        let newExcercise = Excercise(id: id, name: name, sets: [Set]())
        
        self.program.excercises.append(newExcercise)
    }
    
    func addSet(name: String) {
        var set = getWorkoutSet(name: name)
        let newSetNum = set.count + 1
        let newSet = Set(setNum: newSetNum, reps: 0, weight: 0)
        
        set.append(newSet)
    }
}


// MARK: Timer Methods
extension OnWorkoutViewModel {
    func timerStart() {
        onWorkoutTimerModel.start()
    }
}
