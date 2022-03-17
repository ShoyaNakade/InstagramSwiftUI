//
//  ProfileViewModel.swift
//  InstagramSwiftUI
//
//  Created by 中出翔也 on 2022/03/14.
//

import SwiftUI

class ProfileViewModel: ObservableObject {
    @Published var user: User
    
    init(user: User) {
        self.user = user
    }
    
    func follow() {
        guard let uid = user.id else { return }
        UserService.follow(uid: uid) { _ in
            NotificationsViewModel.uploadNotification(toUid: uid, type: .follow)
            self.user.isFollowed = true
        }
    }
    
    func unfollow() {
        guard let uid = user.id else { return }
        UserService.unfollow(uid: uid) { _ in
            self.user.isFollowed = false
        }
    }
    
    func checkIfuserIsFollowed() {
        guard let uid = user.id else { return }
        guard !user.isCurrentUser else { return }
        
        UserService.checkIfUserIsFollowed(uid: uid) { isFollowed in
            self.user.isFollowed = isFollowed
        }
    }
    
}
