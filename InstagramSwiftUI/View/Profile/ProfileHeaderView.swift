//
//  ProfileHeaderView.swift
//  InstagramSwiftUI
//
//  Created by 中出翔也 on 2022/03/12.
//

import SwiftUI
import Kingfisher

struct ProfileHeaderView: View {
    @ObservedObject var viewModel: ProfileViewModel
    
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                KFImage(URL(string: viewModel.user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width:80, height: 80)
                    .clipShape(Circle())
                    .padding(.leading)
                Spacer()
                
                HStack(spacing: 16) {
//                    if let stats = viewModel.user.stats {
//                        UserStatView(value: stats.posts, title: "投稿")
//                        UserStatView(value: stats.followers, title: "フォロワー")
//                        UserStatView(value: stats.following, title: "フォロー中")
//                    } // この書き方だとfetchで読み込まれるまで表示されない。
                    UserStatView(value: viewModel.user.stats?.posts ?? 0, title: "投稿")
                    UserStatView(value: viewModel.user.stats?.followers ?? 0, title: "フォロワー")
                    UserStatView(value: viewModel.user.stats?.following ?? 0, title: "フォロー中")
                    
                }
                .padding(.trailing, 32)
            }
            
            Text(viewModel.user.fullname)
                .font(.system(size: 15, weight: .semibold))
                .padding([.leading, .top])
            if let bio = viewModel.user.bio {
                Text(bio)
                    .font(.system(size: 15))
                    .padding(.leading)
                    .padding(.top, 1)
            }
            
            HStack {
                Spacer()
                ProfileActionButtonView(viewModel: viewModel)
                Spacer()
            }
            .padding(.top)

        }
    }
}

//struct ProfileHeaderView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileHeaderView()
//    }
//}
