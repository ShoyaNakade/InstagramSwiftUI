//
//  User.swift
//  InstagramSwiftUI
//
//  Created by 中出翔也 on 2022/03/13.
//

import FirebaseFirestoreSwift

struct User:Identifiable, Decodable {
    let username: String
    let email: String
    let profileImageUrl: String
    let fullname: String
//    let uid: String
    @DocumentID var id: String? // firestoreのIDも取得可能。そのためuidは必要ない
    var isCurrentUser: Bool { return AuthViewModel.shared.userSession?.uid == id }
    
}
