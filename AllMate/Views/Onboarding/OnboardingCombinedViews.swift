//
//  OnboardingCombinedViews.swift
//  AllMate
//
//  Created by Derek Hsieh on 3/28/21.
//

import SwiftUI
import Firebase

struct OnboardingCombinedViews: View {
    let db = Firestore.firestore()
    @StateObject var classDataModel = ClassDataModel()
    @State var username: String = ""
    @State var showingView = 1
    @State var isShowingLoadingScreen = false
    let screen = UIScreen.main.bounds
    
    var body: some View {
        ZStack(alignment: .center) {
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
                            // push to firebase
                            saveUserInfoToFirebase(username: username, userClasses: classDataModel.userPickedClasses)
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
            
            if isShowingLoadingScreen {
                LoadingPopup()
            }
           
        }
        .preferredColorScheme(.light)
    }
    
    func saveUserInfoToFirebase(username: String, userClasses: [String]) {
        self.isShowingLoadingScreen = true
        
        let user = Auth.auth().currentUser
           if let user = user {
            let changeRequest = user.createProfileChangeRequest()

            changeRequest.displayName = username
            
            // set userClasses in users colleciton with document named as user's user id
            let userClassArray: [String: Any] = [ "UserClasses": userClasses ]
            
            db.collection("users").document(Auth.auth().currentUser!.uid).setData(userClassArray) {error in
                // error handling and code completition
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    // success
                    print("classes saved successfully")
                }
            }
              
            changeRequest.commitChanges { error in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                  print("profile created")
                    self.isShowingLoadingScreen = false
                    
                }
              }
            }
    }
}

struct OnboardingCombiendViewsPreview: PreviewProvider {
    
    static var previews: some View {
        OnboardingCombinedViews()
    }
}

