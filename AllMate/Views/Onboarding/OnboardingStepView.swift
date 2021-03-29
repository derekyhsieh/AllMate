//
//  OnboardingStepView.swift
//  Onboarding
//
//  Created by Augustinas Malinauskas on 06/07/2020.
//  Copyright © 2020 Augustinas Malinauskas. All rights reserved.
//

import SwiftUI

struct OnboardingStepView: View {
    @Binding var username: String
    
    var body: some View {
        VStack {
            Image("onboarding-username")
                .resizable()
                .scaledToFit()
                .padding(.bottom, 50)
            
            Text("What Should We Call You?")
                .font(.system(size: 25, design: .rounded))
                .fontWeight(.bold)
                .padding(.bottom, 20)
            
            UnderlineTextFieldView(text: $username, color: Color.black, textFieldView: TextField("Username", text: $username) .multilineTextAlignment(.center).foregroundColor(.black
            ), placeholder: "Username")
        }
    .padding()
    }
}

struct OnboardingStepView2: View {
    @ObservedObject var classDataModel: ClassDataModel
        
    var body: some View {
        VStack {
            Image("onboarding-class")
                .resizable()
                .scaledToFit()
                .padding(.bottom, 50)
            
            Text("Choose the Classes You Are Taking")
                .font(.system(size: 25, design: .rounded))
                .fontWeight(.bold)
                .padding(.bottom, 20)
                
            
//            Text(data.text)
//                .font(.system(size: 17, design: .rounded))
//                .fontWeight(.medium)
//                .multilineTextAlignment(.center)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    
                    if classDataModel.userPickedClasses.isEmpty {
                        Text("AP Human Geography")
                            .foregroundColor(.clear)
                            .fontWeight(.semibold)
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                            .background(Capsule().stroke(Color.clear, lineWidth: 1))
                            .lineLimit(1)
                    } else {
                        ForEach(classDataModel.userPickedClasses, id: \.self) { userPickedClass in
                            
                            Text(userPickedClass)
                                .fontWeight(.semibold)
                                .padding(.vertical, 10)
                                .padding(.horizontal)
                                .background(Capsule().stroke(Color.black, lineWidth: 1))
                                .lineLimit(1)
                        }
                    }
                 
                }
                .padding()
            }
            

         
            
            ScrollView(showsIndicators: false) {
                
                VStack(spacing: 10) {
                    ForEach(classDataModel.classes, id: \.self) { className in
                        ClassWidget(className: className, classDataModel: classDataModel)
                    }
                }
                
         
            }
            .frame(height: 300)
        }
    .padding()
    }
}

struct OnboardingStepView_Previews: PreviewProvider {
    
    static var previews: some View {
        OnboardingStepView2(classDataModel: ClassDataModel())
    }
}


