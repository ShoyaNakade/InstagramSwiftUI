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
    
    init() {
        fetchNotifications()
    }
    
    func fetchNotifications() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        print("Debug: \(uid)")
        let query = COLLECTION_NOTIFICATIOS.document(uid).collection("user-notifications")
            .order(by: "timestamp", descending: true)
        
        print("Debug: \(query)")
        query.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            print("Debug: \(documents.count)")
            self.notifications = documents.compactMap({ try? $0.data(as: Notification.self) })
            
            print("debug: \(self.notifications)")
        }
        
    }
    
    // 毎回initされないようstaticにする
    static func uploadNotification(toUid uid: String, type: NotificationType, post: Post? = nil) {
        guard let user = AuthViewModel.shared.currentUser else { return }
        guard uid != user.id else { return } // 自分自身の投稿
        
        var data: [String: Any] = ["timestamp": Timestamp(date: Date()),
                                   "username": user.username,
                                   "uid": user.id ?? "",
                                   "profileImageUrl": user.profileImageUrl,
                                   "type": type.rawValue, // rawvalueでIntに。firestoreではIntでないとクラッシュする
                                    ]
        if let post = post, let id = post.id {
            data["postId"] = id
        }
        
        COLLECTION_NOTIFICATIOS.document(uid).collection("user-notifications").addDocument(data: data)
        
    }
}
