//
//  Constants.swift
//  InstagramSwiftUI
//
//  Created by 中出翔也 on 2022/03/13.
//

import Firebase

let COLLECTION_USERS = Firestore.firestore().collection("users") // defineのような使い方。
let COLLECTION_FOLLOWERS = Firestore.firestore().collection("followers")
let COLLECTION_FOLLOWING = Firestore.firestore().collection("following")
let COLLECTION_POSTS = Firestore.firestore().collection("posts")
