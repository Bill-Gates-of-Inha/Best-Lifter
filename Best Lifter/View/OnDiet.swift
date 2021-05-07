//
//  OnDiet.swift
//  Best Lifter
//
//  Created by 피수영 on 2021/04/21.
//

import SwiftUI

struct OnDiet: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        GeometryReader{ (geometry) in
            ZStack(alignment: .trailing) {
                VStack() {
                    HStack() {
                        Spacer()
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
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
                    }
                    
                    Text("Diet")
                        .padding(.top, 20)
                        .padding(.leading, 20)
                        .frame(width: geometry.size.width, alignment: .leading)
                        .font(.largeTitle)
                    
                    Divider()
                        .background(Color.black)
                        .padding()
                }
            }
        }
    }
}

struct OnDiet_Previews: PreviewProvider {
    static var previews: some View {
        OnDiet()
    }
}
