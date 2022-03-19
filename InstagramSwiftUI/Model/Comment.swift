//
//  Comment.swift
//  InstagramSwiftUI
//  for fetch comment
//  Created by 中出翔也 on 2022/03/16.
//

import FirebaseFirestoreSwift
import Firebase // for timestamp

struct Comment: Identifiable,Decodable {
    @DocumentID var id: String?
    let username: String
    let postOwnerUid: String
    let profileImageUrl: String
    let commentText: String
    let timestamp: Timestamp
    let uid: String
    
    
    var  timestampString: String? {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: timestamp.dateValue(), to: Date()) ?? ""
    }
    
    
}


