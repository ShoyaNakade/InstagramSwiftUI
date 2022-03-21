//
//  EditProfileView.swift
//  InstagramSwiftUI
//
//  Created by 中出翔也 on 2022/03/19.
//

import SwiftUI

struct EditProfileView: View {
    @State private var bioText: String
    @ObservedObject private var viewModel: EditProfileViewModel
    @Binding var user: User
    @Environment(\.presentationMode) var mode
    init(user: Binding<User>) {
        self._user = user
        self.viewModel = EditProfileViewModel(user: self._user.wrappedValue) // Bindingをinitで使える。
        self._bioText = State(initialValue: _user.wrappedValue.bio ?? "" ) // BIndingの値をStateプロパティに入れる例
    }
    
    var body: some View {
        VStack() {
            HStack {
                Button {
                    mode.wrappedValue.dismiss()
                } label: {
                    Text("キャンセル")
                }

                Spacer()
                
                Button {
                    viewModel.saveUserBio(bioText)
                } label: {
                    Text("決定").bold()
                }
            }
            .padding()
            TextArea(text: $bioText, placeholder: "Add your bio...")
                .frame(width: 350, height: 200)
                .padding()
            Spacer()
        }
        .onReceive(viewModel.$uploadComplete) { completed in
            if completed { //急に消えるバグを防ぐ
                self.mode.wrappedValue.dismiss()
                self.user.bio = viewModel.user.bio
            }
        }
    }
}

//struct EditProfileVIew_Previews: PreviewProvider {
//    static var previews: some View {
//        EditProfileView()
//    }
//}
