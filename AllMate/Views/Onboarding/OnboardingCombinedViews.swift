//
//  OnboardingCombinedViews.swift
//  AllMate
//
//  Created by Derek Hsieh on 3/28/21.
//

import SwiftUI

struct OnboardingCombinedViews: View {
    @StateObject var classDataModel = ClassDataModel()
    @State var username: String = ""
    @State var showingView = 1
    let screen = UIScreen.main.bounds
    
    var body: some View {
        VStack {
            ZStack(alignment: .center) {
                
                OnboardingStepView2(classDataModel: classDataModel)
                    .offset(x: showingView == 2 ? 0 : screen.width)
                    .animation(.spring())
                    
                    
                
                OnboardingStepView(username: $username)
                    .offset(x: showingView == 1 ? 0 : -screen.width)
                    .animation(.spring())
                    
                    
                
              
            }
            
            VStack {
                
                Spacer()
                
                HStack {
                    
                    HStack {
                        Circle()
                            .fill(Color.black.opacity(0.9))
                            .frame(width: 12, height: 12)
                            
                        Circle()
                            .fill(Color.black.opacity(showingView == 1 ? 0.4 : 0.9))
                            .frame(width: 12, height: 12)
                    }
                    .padding()
                    .padding()
                    
                    Spacer()
                    
                    Button(action: {
                        
                        if self.username != "" && !self.classDataModel.userPickedClasses.isEmpty {
                            UserDefaults.standard.setValue(true, forKey: "isLoggedIn")
                        }
                        else if  username != "" {
                            showingView = 2
                        }
                        
                    }) {
                        
                        if showingView == 2 {
                            Text("Start")
                                .bold()
                                .foregroundColor(.white)
                                .padding(.vertical, 10)
                                .padding(.horizontal, 50)
                                .background(
                                    Capsule()
                                        .fill(Color.black.opacity(classDataModel.userPickedClasses.isEmpty ? 0.4 : 1.0))
                                )
                                .padding()
                        } else {
                            Image(systemName: "arrow.right.circle.fill")
                                .resizable()
                                .foregroundColor(Color(.label).opacity(username == "" ? 0.4 : 1.0))
                                .scaledToFit()
                                .frame(width: 50)
                                .padding()
                        }
                       
                    }
                }
            }
            .frame(height: 75)
        }
        .preferredColorScheme(.light)
    }
}

struct OnboardingCombiendViewsPreview: PreviewProvider {
    
    static var previews: some View {
        OnboardingCombinedViews()
    }
}

