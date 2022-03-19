//
//  UserListView.swift
//  InstagramSwiftUI
//
//  Created by 中出翔也 on 2022/03/12.
//

import SwiftUI

struct UserListView: View {
    @ObservedObject var viewModel: SearchViewModel
    @Binding var searchText: String
    
    var users: [User] {
        return searchText.isEmpty ? viewModel.users : viewModel.filteredUsers(searchText)
    }
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing:10) {
                ForEach(users) { user in
                    // LazyViewで、navigation遷移が起きた時のみviewを作る。
                    NavigationLink(destination: LazyView(ProfileView(user: user))) {
                        UserCell(user: user)
                            .padding(.leading)
                    }
                   
                }
            }
        }
    }
}

//struct UserListView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserListView()
//    }
//}
