//
//  EditProfileView.swift
//  InstagramSwiftUI
//
//  Created by 中出翔也 on 2022/03/19.
//

import SwiftUI

struct EditProfileView: View {
    @ObservedObject private var viewModel: EditProfileVIewModel
    @Environment(\.presentationMode) var mode
    init(viewModel: EditProfileVIewModel) {
        self.viewModel = viewModel
    }
    
    @State private var bioText = ""
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
//        .onReceive(viewModel.$uploadComplete) { _ in
//            self.mode.wrappedValue.dismiss()
//        }
    }
}

//struct EditProfileVIew_Previews: PreviewProvider {
//    static var previews: some View {
//        EditProfileView()
//    }
//}
