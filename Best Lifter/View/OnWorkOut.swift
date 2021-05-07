//
//  OnWorkOut.swift
//  Best Lifter
//
//  Created by 피수영 on 2021/04/20.
//

import SwiftUI

struct OnWorkOut: View {
    @State private var isCancelModal: Bool = false
    @State fileprivate var isCancelView: Bool = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject var onWorkoutViewModel = OnWorkoutViewModel()
    
    var body: some View {
        GeometryReader { (geometry) in
            ZStack {
                VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            self.isCancelView.toggle()
                            
                        }, label: {
                            Text("Cancel")
                                .foregroundColor(Color.black)
                                .font(.system(size: 20, weight: .regular, design: .default))
                        })
                        .frame(width: 80, height: 30, alignment: .center)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10.0)
                                .stroke(lineWidth: 2)
                        )
                        .padding(.trailing, 20)
                        .disabled(self.isCancelView ? true : false)
                    }
                    Text("Workout")
                        .padding(.top, 20)
                        .padding(.leading, 20)
                        .frame(width: geometry.size.width, alignment: .leading)
                        .font(.largeTitle)
                    Text(onWorkoutViewModel.timerString)
                    .padding(.top, 20)
                    .padding(.leading, 20)
                    .frame(width: geometry.size.width, alignment: .leading)
                    
                    Divider()
                        .background(Color.black)
                        .padding()
                    
                    WorkoutList(onWorkoutViewModel: self.onWorkoutViewModel)
                    
                    Button(action: {
                        // 운동 추가 액션
                        self.onWorkoutViewModel.addWorkout(name: "Bench Press")
                        print(self.onWorkoutViewModel.program.excercises[0].name)
                        print(self.onWorkoutViewModel.program.excercises.count)
                    }, label: {
                        Text("운동 추가")
                            .foregroundColor(Color.black)
                    })
                    .frame(width: geometry.size.width - 40, height: 30)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10.0)
                            .stroke(lineWidth: 2)
                    )
                    .padding(20)
                    Spacer()
                }
            }
            .blur(radius: self.isCancelView ? 10 : 0)
            .onAppear {
                onWorkoutViewModel.program.excercises.append(Excercise(id: 1, name: "Bench Press", sets: [Set]()))
                onWorkoutViewModel.timerStart()
            }
            
            withAnimation {
                alertView
                    .padding()
                    .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
            }.scaleEffect(self.isCancelView ? 1 : 0)
            .animation(.easeOut(duration: 0.05))
        }
    }
    
    var alertView: some View {
        ZStack {
            VStack() {
                Text("운동을 취소하시겠습니까?")
                    .padding(.bottom, 30)
                HStack(spacing: 30) {
                    Button(action: {
                        self.isCancelView.toggle()
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("YES")
                            .foregroundColor(Color.red)
                    })
                    .frame(width: 60, height: 40)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10.0)
                            .stroke(lineWidth: 2)
                    )
                    
                    Button(action: {
                        self.isCancelView.toggle()
                    }, label: {
                        Text("NO")
                            .foregroundColor(Color.black)
                    })
                    .frame(width: 60, height: 40)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10.0)
                            .stroke(lineWidth: 2)
                    )
                }
            }
            .frame(width: 300, height: 200, alignment: .center)
            .overlay(
                RoundedRectangle(cornerRadius: 10.0)
                    .stroke(lineWidth: 2)
            )
        }
    }
}

struct WorkoutList: View {
    @ObservedObject var onWorkoutViewModel: OnWorkoutViewModel

    var body: some View {
        ScrollView(.vertical, showsIndicators: true, content: {
            VStack(spacing: 10) {
                // 운동 이력 리스트
                WorkoutSet(onWorkoutViewModel: self.onWorkoutViewModel)
            }
        })
    }
}

let wowo = ["Wow", "Ho!"]

struct WorkoutSet: View {
    @ObservedObject var onWorkoutViewModel: OnWorkoutViewModel
    
//    self.onWorkoutViewModel.program.excercises
    var body: some View {
        List(onWorkoutViewModel.program.excercises, id: \.id) { excercise in
            Text(excercise.name)
        }
    }
}

struct OnWorkOut_Previews: PreviewProvider {
    static var previews: some View {
        OnWorkOut()
//        WarnView()
    }
}
