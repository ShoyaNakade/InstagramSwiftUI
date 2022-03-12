//
//  LoginView.swift
//  InstagramSwiftUI
//
//  Created by 中出翔也 on 2022/03/12.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient:
                               Gradient(
                               colors: [Color.purple, Color.blue]),
                               startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                VStack {
                    Image("mapnote_logo_title")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 220, height: 100)
                    
                    // email field
                    VStack(spacing: 20) {
                        CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                            .padding()
                            .background(Color(.init(white:1, alpha: 0.15)))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .padding(.horizontal, 32)
                        
                        // password field
                        CustomSecureField(text: $password, placeholder: Text("Password"))
                            .padding()
                            .background(Color(.init(white:1, alpha: 0.15)))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .padding(.horizontal, 32)
                    }
                    
                    // forget password
                    
                    HStack {
                        Spacer()
                        
                        Button {
                            // action
                        } label: {
                            Text("Forget Password")
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundColor(.white)
                                .padding(.top)
                                .padding(.trailing, 28)
                        }

                    }
                    
                    //signin
                    Button {
                        // action
                    } label: {
                        Text("Sign In")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 360, height: 50)
                            .background(Color(.purple))
                            .clipShape(Capsule())
                            .padding()
                    }
                    
                    Spacer()
                    NavigationLink(destination: RegistrationView()
                                    .navigationBarHidden(true)) {
                            HStack {
                                Text("アカウントを持っていませんか？")
                                    .font(.system(size: 14))
                                
                                Text("Sign Up")
                                    .font(.system(size: 14, weight: .semibold))
                            }
                            .foregroundColor(.white)
                    }
                    .padding(.bottom, 16)
                }
                .padding(.top, -44)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
