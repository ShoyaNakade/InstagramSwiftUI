//
//  ProfileHeaderView.swift
//  InstagramSwiftUI
//
//  Created by 中出翔也 on 2022/03/12.
//

import SwiftUI

struct ProfileHeaderView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("mapnote")
                    .resizable()
                    .scaledToFill()
                    .frame(width:80, height: 80)
                    .clipShape(Circle())
                    .padding(.leading)
                Spacer()
                
                HStack(spacing: 16) {
                    UserStatView(value: 1, title: "投稿")
                    UserStatView(value: 2, title: "フォロワー")
                    UserStatView(value: 2, title: "フォロー中")
                }
                .padding(.trailing, 32)
            }
            
            Text("MapNote")
                .font(.system(size: 15, weight: .semibold))
                .padding([.leading, .top])
            Text("思い出をマップ上に残す。\nいきたい場所を思い出の場所へ。")
                .font(.system(size: 15))
                .padding(.leading)
                .padding(.top, 1)
            
            HStack {
                Spacer()
                ProfileActionButtonView()
                Spacer()
            }
            .padding(.top)

        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView()
    }
}