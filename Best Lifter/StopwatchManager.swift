//
//  StopwatchManager.swift
//  Best Lifter
//
//  Created by 피수영 on 2021/04/20.
//

import Foundation

class StopwatchManager: ObservableObject {
    private var timer = Timer()
    var (hours, minutes, seconds) = (0, 0, 0)
    var timeString = "00:00:00"
    
    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            self.seconds += 1
            
            if self.seconds > 60 {
                self.minutes += 1
                self.seconds = 0
            }
            
            if self.minutes > 60 {
                self.hours += 1
                self.minutes = 0
            }
            let secondsString = self.seconds > 9 ? "\(self.seconds)" : "0\(self.seconds)"
            let minutesString = self.minutes > 9 ? "\(self.minutes)" : "0\(self.minutes)"
            let hoursString = self.hours > 9 ? "\(self.hours)" : "0\(self.hours)"
            
            self.timeString = "\(hoursString):\(minutesString):\(secondsString)"
        }
    }
}
