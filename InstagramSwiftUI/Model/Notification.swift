//
//  Notification.swift
//  InstagramSwiftUI
//
//  Created by 中出翔也 on 2022/03/17.
//

import FirebaseFirestoreSwift
import Firebase


struct Notification: Identifiable, Decodable {
    @DocumentID var id: String?
    let postId: String?
    let username: String
    let profileImageUrl: String
    let timestamp: Timestamp
    let type: NotificationType
    let uid: String
    
    var isFollowed: Bool? = false
    var post: Post?
    var user: User? // notificationからuserに飛ぶため
}


enum NotificationType: Int, Decodable {
    // ロバストな設計。追加などが容易にできる。
    case like
    case comment
    case follow
    // case 追加したい内容
    
    var notificationMessage: String {
        switch self{
        case .like: return " あなたの投稿がいいねされました"
        case .comment: return " あなたの投稿にコメントがありました。"
        case .follow: return " フォローされました"
        // case .追加したい内容: return hogehoge
        }
    }
    
}
