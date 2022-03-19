//
//  EditProfileViewModel.swift
//  InstagramSwiftUI
//
//  Created by 中出翔也 on 2022/03/19.
//

import SwiftUI

class EditProfileVIewModel: ObservableObject {
    private let user: User
    @Published var uploadComplete = false
    
    init(user: User) {
        self.user = user
    }
    
    func saveUserBio(_ bio: String) {
        guard let uid = user.id else { return }
        COLLECTION_USERS.document(uid).updateData(["bio": bio]) { _ in
            self.uploadComplete = true
        }
    }
}
