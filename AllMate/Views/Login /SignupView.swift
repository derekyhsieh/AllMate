//
//  SignupView.swift
//  AllMate
//
//  Created by Derek Hsieh on 3/25/21.
//

import SwiftUI
import iPhoneNumberField
import FirebaseAuth

struct SignupView: View {
    
    @AppStorage("isLoggedIn") var isUserLoggedIn = false
    @State private var userPassword = ""
    @State private var userEmail = ""
    @State private var reenterPassword = ""
    @State private var createUserIsComplete = false
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.7).edgesIgnoringSafeArea(.all)
            WavesAnimation()
                .rotationEffect(.degrees(180))
                .rotation3DEffect(
                .degrees(180),
                axis: (x: 0.0, y: 1.0, z: 0.0)
                )
            
            VStack {
                HStack {
                    Text("Create \nAccount")
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
                
                UnderlineTextFieldView(
                                    text: $userPassword,
                                    textFieldView: SecureField("Reenter Password", text: $reenterPassword),
                                    placeholder: "Reenter Password",
                                    imageName: "lock.fill")
                    .padding()
                
                
                
                
                Button(action: {createUser(email: userEmail, pass: userPassword)}) {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.white)
                        .frame(width: UIScreen.main.bounds.width - 60, height: 50)
                        .overlay(
                            Text("Sign Up")
                                .foregroundColor(.black)
                                .padding(.vertical)
                                .font(.system(size: 17, weight: .semibold, design: .default))
                              )
                }
                
               
                
                CustomDivider(color: Color.white.opacity(0.7))
                .padding()
                .padding(.horizontal)
                    
                
                NavigationLink(destination: LoginView()) {
    
                    RoundedRectangle(cornerRadius: 15)
                      .stroke(Color.white, lineWidth: 2)
                        .frame(width: UIScreen.main.bounds.width - 60, height: 50)
                        .overlay(
                            Text("Log In")
                                .foregroundColor(.white)
                                .padding(.vertical)
                                .font(.system(size: 17, weight: .semibold, design: .default))
                              )
                    
                }
                
            }
            .padding(.bottom)
            
        }
    }
    
    private func createUser(email: String, pass: String) {
        
        if email.isValidEmail() && userPassword == reenterPassword {
         
            Auth.auth().createUser(withEmail: email, password: pass) { (authResult, err) in
                
                // Error handeling
                if let err = err {
                    print(err.localizedDescription)
                    return
                } else {
                    createUserIsComplete = true
                    print("success")
                    isUserLoggedIn = true
                }
            }
        } else if !email.isValidEmail() {
            print("email invalid")
        } else if userPassword != reenterPassword {
            print("user pass doesnt match reenter")
        }
    }

}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
