//
//  Post.swift
//  InstagramSwiftUI
//
//  Created by 中出翔也 on 2022/03/15.
//

import FirebaseFirestoreSwift
import Firebase

struct Post: Identifiable, Decodable {
    @DocumentID var id: String?
    let ownerUId: String
    let ownerUsername: String
    let caption: String
    let like: Int
    let imageUrl: String
    //    let uid: String
    let timestamp: Timestamp
    let ownerImageUrl: String
}

