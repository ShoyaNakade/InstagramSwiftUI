//
//  CommentCell.swift
//  InstagramSwiftUI
//
//  Created by 中出翔也 on 2022/03/16.
//

import SwiftUI

struct CommentCell: View {
    var body: some View {
        HStack {
            Image("mapnote")
                .resizable()
                .scaledToFill()
                .frame(width: 36, height: 36)
                .clipShape(Circle())
            
            Text("mapnote").font(.system(size: 14, weight: .semibold)) +
            Text(" some test comment for now")
                .font(.system(size: 14))
            
            Text("2m")
                .foregroundColor(.gray)
                .font(.system(size: 12))
                .padding(.trailing)
        }.padding(.horizontal)
        
    }
}

struct CommentCell_Previews: PreviewProvider {
    static var previews: some View {
        CommentCell()
    }
}
