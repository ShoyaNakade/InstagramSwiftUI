//
//  UserService.swift
//  InstagramSwiftUI
//
//  Created by 中出翔也 on 2022/03/14.
//

import Foundation

struct UserService {
    
    static func follow(uid: String, completion: ((Error?) -> Void)?) {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        
        COLLECTION_FOLLOWING.document(currentUid).collection("user-following").document(uid).setData([:]) { _ in
            COLLECTION_FOLLOWERS.document(uid).collection("user-followers")
                .document(currentUid).setData([:], completion: completion)
        }
    }
    static func unfollow(uid: String, completion: ((Error?) -> Void)?) {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        
        COLLECTION_FOLLOWING.document(currentUid).collection("user-following").document(uid).delete { _ in
            COLLECTION_FOLLOWERS.document(uid).collection("user-flowers").document(currentUid).delete(completion: completion)
        }
        
    }
    
    static func checkIfUserIsFollowed() {
        
    }
    
}


