//
//  Main.swift
//  Best Lifter
//
//  Created by 피수영 on 2021/04/08.
//

import SwiftUI

struct Main: View {
    @State private var selection = 0
    @State private var addButtonIsTapped: Bool = false
    
    var body: some View {
        ZStack() {
            VStack() {
                TabView(selection: $selection) {
                    Home().tag(0)
                    Profile().tag(1)
                    Workout().tag(2)
                    Diet().tag(3)
                    Rank().tag(4)
                }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                Divider()
                TabBar(selection: $selection)
                    .frame(height: 30, alignment: .center)
            }
            VStack() {
                Spacer()
                HStack() {
                    Spacer()
                    VStack(alignment: .center) {
                        Button(action: {
                            
                        }, label: {
                            Image("addWorkout")
                                .renderingMode(.template)
                                .resizable()
                                .frame(width: 40, height: 40, alignment: .center)
                                .foregroundColor(Color.white)
                        })
                        .frame(width: 50, height: 50, alignment: .center)
                        .background(Color(red: 0 / 255, green: 122 / 255, blue: 255 / 255))
                        .cornerRadius(40.0)
                        .padding(.bottom, 5)
                        .scaleEffect(addButtonIsTapped ? 1 : 0)
                        .animation(.easeOut(duration: 0.1))
                        
                        Button(action: {
                            
                        }, label: {
                            Image("foodRecord")
                                .renderingMode(.template)
                                .resizable()
                                .frame(width: 40, height: 40, alignment: .center)
                                .foregroundColor(Color.white)
                        })
                        .frame(width: 50, height: 50, alignment: .center)
                        .background(Color(red: 0 / 255, green: 122 / 255, blue: 255 / 255))
                        .cornerRadius(40.0)
                        .padding(.bottom, 20)
                        .scaleEffect(addButtonIsTapped ? 1 : 0)
                        .animation(.easeOut(duration: 0.1))
                        
                        Button(action: {
                            self.addButtonIsTapped.toggle()
                            showAddButtons()
                        }, label: {
                            Image("plus")
                                .renderingMode(.template)
                                .resizable()
                                .frame(width: 50, height: 50, alignment: .center)
                                .foregroundColor(Color(red: 0 / 255, green: 122 / 255, blue: 255 / 255))
                        })
                        .rotationEffect(Angle.degrees(addButtonIsTapped ? 45 : 0))
                        .scaleEffect(addButtonIsTapped ? 1.2 : 1)
                        .animation(.easeOut(duration: 0.1))
                        .padding(.bottom, 60)
                    }
                    .padding(.trailing, 20)
                }
            }
        }
    }
}

extension Main {
    // MARK: - Methods
    func showAddButtons() {
        
    }
}

struct TabBar: View {
    @Binding var selection: Int
    @Namespace private var currentTab
    
    var body: some View {
        HStack(alignment: .bottom) {
            ForEach(tabs.indices) { index in
                // 실선을 표시하기 위한 GeometryReader
                GeometryReader { geometry in
                    VStack(spacing: 4) {
                        if selection == index {
                            // 현재 선택된 탭 바 메뉴 색상 설정
                            Color(red: 0 / 255, green: 122 / 255, blue: 255 / 255)
                                .frame(height: 2)
                                .offset(y: -8)
                                .matchedGeometryEffect(id: "currentTab", in: currentTab)
                        }
                        // 이미지 설정
                        Image(tabs[index].image)
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: 25, height: 25)
                        //                            .aspectRatio(contentMode: .fit)
                    }
                    .frame(width: geometry.size.width / 2,
                           height: 30,
                           alignment: .bottom)
                    .padding(.horizontal)
                    .foregroundColor(selection == index ? Color(red: 0 / 255, green: 122 / 255, blue: 255 / 255) : Color(red: 211 / 255, green: 211 / 255, blue: 211 / 255))
                    // 해당 이미지가 선택됐을 때, 어떤 동작을 할 것인지 구현할 수 있다.
                    .onTapGesture {
                        // selection 변수의 값을 업데이트한다.
                        withAnimation(.easeOut(duration: 0.2)) {
                            selection = index
                        }
                    }
                }
                .frame(height: 30, alignment: .bottom)
            }
        }
    }
}

struct Tab {
    let image: String
    let label: String
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}

let tabs: [Tab] = [
    Tab(image: "home", label: "home"),
    Tab(image: "profile", label: "profile"),
    Tab(image: "workoutRecord", label: "workoutRecord"),
    Tab(image: "foodRecord", label: "foodRecord"),
    Tab(image: "rank", label: "rank")
]
