//
//  OnboardingStepView.swift
//  Onboarding
//
//  Created by Derek Hsieh on 3/28/21.
//

import SwiftUI
import FirebaseFirestore

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
    let backgroundColor: Color
        
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
                                .background(Capsule().stroke(backgroundColor == Color.black ? Color.white : Color.black, lineWidth: 1))
                                .lineLimit(1)
                        }
                    }
                 
                }
                .padding()
            }
            

         
            
            ScrollView(showsIndicators: false) {
                
                VStack(spacing: 10) {
                    ForEach(classDataModel.classes, id: \.self) { className in
                        ClassWidget(className: className, background: Color.black, classDataModel: classDataModel)
                    }
                }
                
         
            }
            .frame(height: 300)
        }
        
    .padding()
    }
}

struct UserClassPickerView: View {
    @ObservedObject var userViewModel: UserViewModel
    @Binding var show: Bool
    let db = Firestore.firestore()
    
    var backgroundColor: Color
        
    var body: some View {
        
            
        VStack {
            HStack {
                Text("Choose the Classes You Are Taking")
                    .font(.system(size: 25, design: .rounded))
                    .fontWeight(.bold)
                    .padding()
                    
                Spacer(minLength: 0)
                Button(action: {
                    show = false
                    
                    saveClassesToFirebase()
                }) {
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                        .font(.title2)
                        .padding()
                }
            }
            .padding(.top, 50)
        
                
        
            
//            Text(data.text)
//                .font(.system(size: 17, design: .rounded))
//                .fontWeight(.medium)
//                .multilineTextAlignment(.center)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    
                    if userViewModel.classes.isEmpty {
                        Text("AP Human Geography")
                            .foregroundColor(.clear)
                            .fontWeight(.semibold)
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                            .background(Capsule().stroke(Color.clear, lineWidth: 1))
                            .lineLimit(1)
                    } else {
                        ForEach(userViewModel.classes, id: \.self) { userPickedClass in
                            
                            Text(userPickedClass)
                                .fontWeight(.semibold)
                                .padding(.vertical, 10)
                                .padding(.horizontal)
                                .background(Capsule().stroke(backgroundColor == Color.black ? Color.white : Color.black, lineWidth: 1))
                                .lineLimit(1)
                        }
                    }
                 
                }
                .padding()
            }
            
            Spacer()
         
            
            ScrollView(showsIndicators: false) {
                
                VStack(spacing: 10) {
                    ForEach(ClassDataModel().classes, id: \.self) { className in
                        if userViewModel.classes.contains(className) {
                            ClassWidgetPicker(className: className, background: Color.black, isSelected: true, userViewModel: userViewModel)
                        } else {
                            ClassWidgetPicker(className: className, background: Color.black, userViewModel: userViewModel)
                        }
                  
                    }
                }
                
         
            }
            .frame(maxHeight: UIScreen.main.bounds.height)
        }
        
    .padding()
    }
    
    private func saveClassesToFirebase() {
        
        // updating user following class document on firebase
        self.db.collection("users").document(userViewModel.userData.userUID).updateData(["UserClasses" : userViewModel.classes]) { (error) in
            // error hadling
            if let error = error {
                print(error.localizedDescription)
                return
            } else {
                print("successfully updated user's followed classes to firebase")
            }
        }
    }
}

