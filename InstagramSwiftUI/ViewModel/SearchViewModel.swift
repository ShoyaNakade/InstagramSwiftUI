//
//  SearchViewModel.swift
//  InstagramSwiftUI
//
//  Created by 中出翔也 on 2022/03/13.
//

import SwiftUI

class SearchViewModel: ObservableObject {
    @Published var users = [User]()

    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        COLLECTION_USERS.getDocuments { snapshot, _ in
            // https://peterfriese.dev/posts/swiftui-firebase-codable/ 参照
            guard let documents = snapshot?.documents else { return }
            
//            documents.forEach{ snapshot in
//                guard let user = try? snapshot.data(as: User.self) else { return }
//                self.users.append(user)
//            }
            
            //上記のforeachコードをcompactmapで1行にしたのが以下のコード
            self.users = documents.compactMap({ try? $0.data(as: User.self) }) // fetch all user
        }
    }
    
    func filteredUsers(_ query: String) -> [User] {
        let lowercasedQuery = query.lowercased() //小文字のクエリに変換
        return users.filter({ $0.fullname.lowercased().contains(lowercasedQuery) ||
            $0.username.contains(lowercasedQuery)
        })
    }
    
}
