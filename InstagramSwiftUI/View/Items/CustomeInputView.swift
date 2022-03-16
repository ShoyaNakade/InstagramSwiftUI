//
//  CustomeInputView.swift
//  InstagramSwiftUI
//
//  Created by 中出翔也 on 2022/03/16.
//

import SwiftUI

struct CustomeInputView: View {
    @Binding var inputText: String
    
    var action: () -> Void
    
    private let wide = UIScreen.main.bounds.width
    
    var body: some View {
        VStack {
//            Divider()
            Rectangle()
                .foregroundColor(Color(.separator))
                .frame(width: wide, height: 0.75)
                .padding(.bottom,8)
            
            HStack {
                TextField("COmment... ", text: $inputText)
                    .textFieldStyle(PlainTextFieldStyle())
                    .frame(minHeight: 30)
                
                Button {
                    self.action()
                } label: {
                    Text("送信")
                        .bold()
                        .foregroundColor(.black)
                }
            }
            .padding(.bottom, 8)
            .padding(.horizontal)
        }
    }
}

//struct CustomeInputView_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomeInputView(inputText: .constant(""))
//    }
//}
