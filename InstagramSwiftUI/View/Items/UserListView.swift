//
//  UserListView.swift
//  InstagramSwiftUI
//
//  Created by 中出翔也 on 2022/03/12.
//

import SwiftUI

struct UserListView: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing:10) {
                ForEach(0 ..< 20) { _ in
                    NavigationLink(destination:ProfileView()) {
                        UserCell()
                            .padding(.leading)
                    }
                   
                }
            }
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
