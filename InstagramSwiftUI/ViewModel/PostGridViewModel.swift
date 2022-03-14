//
//  PostGridViewModel.swift
//  InstagramSwiftUI
//
//  Created by 中出翔也 on 2022/03/15.
//

import SwiftUI

enum PostGridConfigration {
    case explore
    case profile(String)
}

class PostGridViewModel: ObservableObject {
    @Published var posts = [Post]()
    let config: PostGridConfigration
    
    
    init(config: PostGridConfigration) {
        self.config = config
        fetchPosts(forConfig: config)
    }
    func fetchPosts(forConfig config: PostGridConfigration) {
        switch config {
        case .explore: fetchExplorePagePosts()
            
        case .profile(let uid): fetchUserPosts(foruId: uid)
            
        }
    }
    
    func fetchPosts() {
        COLLECTION_POSTS.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.posts = documents.compactMap({ try? $0.data(as: Post.self) })
        }
    }
    
    func fetchExplorePagePosts() {
        
    }
    
    func fetchUserPosts(foruId uid: String) {
        COLLECTION_POSTS.whereField("ownerUid", isEqualTo: uid).getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.posts = documents.compactMap({ try? $0.data(as: Post.self) })
        }
    }
}
