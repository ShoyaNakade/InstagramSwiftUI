//
//  CommentsView.swift
//  InstagramSwiftUI
//
//  Created by 中出翔也 on 2022/03/16.
//

import SwiftUI

struct CommentsView: View {
    @State var commentText = ""
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 24) {
                    ForEach(0 ..< 10) { _ in
                        CommentCell()
                    }
                }
            }.padding(.top)
            
            
            CustomeInputView(inputText: $commentText, action: uploadComment)
        }
    }
    
    func uploadComment() {
        
    }
}

struct CommentsView_Previews: PreviewProvider {
    static var previews: some View {
        CommentsView()
    }
}
