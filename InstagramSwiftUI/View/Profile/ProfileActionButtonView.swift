//
//  ProfileActionButtonView.swift
//  InstagramSwiftUI
//
//  Created by 中出翔也 on 2022/03/12.
//

import SwiftUI

struct ProfileActionButtonView: View {
    @ObservedObject var viewModel: ProfileViewModel
    var isFollowed: Bool { return viewModel.user.isFollowed ?? false }
    @State var showEditProfile = false
    
    var body: some View {
        if viewModel.user.isCurrentUser {
            Button {
                showEditProfile.toggle()
            } label: {
                Text("Edit Profile")
                    .font(.system(size: 15, weight: .semibold))
                    .frame(width: 360, height: 32)
                    .foregroundColor(.black)
                    .overlay(
                        RoundedRectangle(cornerRadius: 3)
                            .stroke(Color.gray, lineWidth: 1)
                    )
            }.sheet(isPresented:$showEditProfile) {
                EditProfileView(viewModel: EditProfileVIewModel(user: viewModel.user))
            }
        } else {
            HStack {
                Button {
                    // action
                    isFollowed ? viewModel.unfollow() : viewModel.follow()
                } label: {
                    Text(isFollowed ? "フォロー中" : "フォロー")
                        .font(.system(size: 15, weight: .semibold))
                        .frame(width: 172, height: 32)
                        .foregroundColor(isFollowed ? .black : .white)
                        .background(isFollowed ? .white : .blue)
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color.gray, lineWidth: isFollowed ? 1 : 0)
                        )
                }
                .cornerRadius(3)
                
                
                Button {
                   //action
                } label: {
                    Text("メッセージ")
                        .font(.system(size: 15, weight: .semibold))
                        .frame(width: 172, height: 32)
                        .foregroundColor(.black)
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                }
            }
        }
    }
}

//struct ProfileActionButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileActionButtonView()
//    }
//}
