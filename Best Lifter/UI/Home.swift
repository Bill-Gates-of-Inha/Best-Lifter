//
//  Home.swift
//  Best Lifter
//
//  Created by 피수영 on 2021/04/19.
//

import SwiftUI

struct Home: View {
    var body: some View {
        Text("Home")
    }
    
    func addWorkout() {
        print("addWorkout Button tapped!")
    }
    
    func addDiet() {
        print("addDiet Button tapped!")
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
