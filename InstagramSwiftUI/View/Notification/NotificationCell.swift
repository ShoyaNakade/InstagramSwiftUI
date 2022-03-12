//
//  NotificationCell.swift
//  InstagramSwiftUI
//
//  Created by 中出翔也 on 2022/03/12.
//

import SwiftUI

struct NotificationCell: View {
    @State private var showPostImage = false
    var body: some View {
        HStack {
            Image("mapnote")
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
//                .cornerRadius(24)
            
            Text("MapNote").font(.system(size: 14, weight: .semibold)) +
            Text(" あなたの投稿にいいねをしました。")
                .font(.system(size: 15))
            
            Spacer()
            if showPostImage {
                Image("mapnote")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
    //                .cornerRadius(24)
            } else {
                Button {
                    //
                } label: {
                    Text("Follow")
                        .padding(.horizontal, 20)
                        .padding(.vertical,8)
                        .background(Color(.systemBlue))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                        .font(.system(size: 14, weight: .semibold))
                }

            }
        }
        .padding(.horizontal)
    }
}

struct NotificationCell_Previews: PreviewProvider {
    static var previews: some View {
        NotificationCell()
    }
}
