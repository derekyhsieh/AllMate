//
//  LoginView.swift
//  AllMate
//
//  Created by Derek Hsieh on 3/25/21.
//

import SwiftUI
import iPhoneNumberField
import FirebaseAuth

struct LoginView: View {
     
    @State private var userPassword = ""
    @State private var userEmail = ""
    @State private var isLoggedIn = false
    @State private var showsLoadingScreen = true
    @AppStorage("isLoggedIn") var isUserLoggedIn = false
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.7).edgesIgnoringSafeArea(.all)
            WavesAnimation().rotationEffect(.degrees(180))
            
            VStack {
                HStack {
                    Text("Welcome \nBack")
                        .foregroundColor(.white)
                        .font(.system(size: 45, weight: .bold, design: .default))
                        .padding(.top, 25)
                        .padding(.leading, 50)
                    Spacer()
                }
                Spacer()
                
                UnderlineTextFieldView(
                                    text: $userEmail,
                    textFieldView: TextField("Email", text: $userEmail).foregroundColor(Color.white),
                                    placeholder: "Email",
                                    imageName: "envelope.fill")
                    .padding()
                
                UnderlineTextFieldView(
                                    text: $userPassword,
                                    textFieldView: SecureField("Password", text: $userPassword),
                                    placeholder: "Password",
                                    imageName: "lock.fill")
                    .padding()
                
                
                HStack {
                    Spacer()
                    Button(action: {}) {
                        Text("Forgot Password?")
                            .bold()
                            .padding(.horizontal)
                            .padding(.horizontal)
                    }
                }
                
                
                Button(action: { signinCreate(email: userEmail, password: userPassword) }) {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.white)
                        .frame(width: UIScreen.main.bounds.width - 60, height: 50)
                        .overlay(
                            Text("Log In")
                                .foregroundColor(.black)
                                .padding(.vertical)
                                .font(.system(size: 17, weight: .semibold, design: .default))
                              )
                }
                
               
                
                CustomDivider(color: Color.white.opacity(0.7))
                .padding()
                .padding(.horizontal)

                
                NavigationLink(destination: SignupView()) {
    
                    RoundedRectangle(cornerRadius: 15)
                      .stroke(Color.white, lineWidth: 2)
                        .frame(width: UIScreen.main.bounds.width - 60, height: 50)
                        .overlay(
                            Text("Sign Up")
                                .foregroundColor(.white)
                                .padding(.vertical)
                                .font(.system(size: 17, weight: .semibold, design: .default))
                              )
              
                }
            }
            
            if isLoggedIn {
                LoadingPopup()
            }
            
        }
    }
    
    private func signinCreate(email: String, password: String) {
        
        
        if email.isValidEmail() {
            
            showsLoadingScreen = true
            print("loading screen true")
            
            Auth.auth().signIn(withEmail: email, password: password) { (authDataResult, error) in
                
                    // error handling
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                
                showsLoadingScreen = false
                print("loading screen false")
                isLoggedIn = true
                print("islogged in ")
                isUserLoggedIn = true
                
            }
        }
        else {
            print("email is not valid")
        }
        

    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .preferredColorScheme(.dark)
    }
}
