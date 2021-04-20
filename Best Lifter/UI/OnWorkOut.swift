//
//  OnWorkOut.swift
//  Best Lifter
//
//  Created by 피수영 on 2021/04/20.
//

import SwiftUI

struct OnWorkOut: View {
    
    @ObservedObject private var stopwatchManager = StopwatchManager()
    @State private var timerString: String = "00:00"
    @State private var seconds = 0
    @State private var minutes = 0
    @State private var hours = 0
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack() {
            GeometryReader { (geometry) in
                VStack() {
                    Text("Workout")
                        .padding(.top, 20)
                        .padding(.leading, 20)
                        .frame(width: geometry.size.width, alignment: .leading)
                        .font(.largeTitle)
                    
                    Text("\(timerString)").onReceive(timer, perform: { (_) in
                        countTime()
                    })
                    .padding(.top, 20)
                    .padding(.leading, 20)
                    .frame(width: geometry.size.width, alignment: .leading)
                    .font(.system(size: 20))
                }
            }
        }.onAppear {
            print("Appear!")
            self.stopwatchManager.start()
        }
    }
}

extension OnWorkOut {
    // MARK: -Methods
    func countTime() {
        seconds += 1
        
        if seconds >= 60 {
            minutes += 1
            seconds = 0
        }
        
        if minutes >= 60 {
            hours += 1
            minutes = 0
        }
        
        let secondsString = seconds > 9 ? "\(seconds)" : "0\(seconds)"
        let minutesString = minutes > 9 ? "\(minutes)" : "0\(minutes)"
        let hoursString = hours > 9 ? "\(hours)" : hours > 0 ? "0\(hours)" : ""
        
        timerString = hoursString == "" ? "\(minutesString):\(secondsString)" : "\(hoursString):\(minutesString):\(secondsString)"
    }
}

struct WorkoutList: View {
    var body: some View {
        Text("Hello, World!")
    }
}

struct OnWorkOut_Previews: PreviewProvider {
    static var previews: some View {
        OnWorkOut()
    }
}
