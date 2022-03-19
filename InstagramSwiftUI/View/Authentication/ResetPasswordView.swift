//
//  ResetPasswordView.swift
//  InstagramSwiftUI
//
//  Created by 中出翔也 on 2022/03/12.
//

import SwiftUI

struct ResetPasswordView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @Environment(\.presentationMode) var mode
    @Binding var email: String
    
    init(email: Binding<String>) {
        self._email = email
        
    }
    
    
    
    var body: some View {
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
                }
                
                
                //signin
                Button {
                    viewModel.resetPassword(withEmail: email)
                } label: {
                    Text("Send Reset Password link")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 360, height: 50)
                        .background(Color(.purple))
                        .clipShape(Capsule())
                        .padding()
                }
                
                Spacer()

                Button {
                    mode.wrappedValue.dismiss()
                } label: {
                    HStack {
                        Text("既にアカウントがありますか？")
                            .font(.system(size: 14))
                        
                        Text("サインイン")
                            .font(.system(size: 14, weight: .semibold))
                    }
                    .foregroundColor(.white)
                }
            }
            .padding(.top, -44)
        }
        .onReceive(viewModel.$didSendRestPassswordLink) { _ in
            self.mode.wrappedValue.dismiss()
        }
    }
}

//struct ReserPasswordView_Previews: PreviewProvider {
//    static var previews: some View {
//        ResetPasswordView()
//    }
//}
