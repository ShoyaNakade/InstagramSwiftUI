//
//  NotificationsViewModel.swift
//  InstagramSwiftUI
//
//  Created by 中出翔也 on 2022/03/17.
//

import SwiftUI
import Firebase

class NotificationsViewModel: ObservableObject {
    @Published var notifications = [Notification]()
    
    func fetchNotification() {
        
    }
    
    // 毎回initされないようstaticにする
    static func uploadNotification(toUid uid: String, type: NotificationType, post: Post? = nil) {
        guard let user = AuthViewModel.shared.currentUser else { return }
        
        var data: [String: Any] = ["timestamp": Timestamp(date: Date()),
                                   "username": user.id ?? "",
                                   "profileImageUrl": user.profileImageUrl,
                                   "type": type.rawValue, // rawvalueでIntに。firestoreではIntでないとクラッシュする
                                    ]
        if let post = post, let id = post.id {
            data["postId"] = id
        }
        
        COLLECTION_NOTIFICATIOS.document(uid).collection("user-notifications").addDocument(data: data)
        
    }
}
