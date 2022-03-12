//
//  PostGridView.swift
//  InstagramSwiftUI
//
//  Created by 中出翔也 on 2022/03/12.
//

import SwiftUI

struct PostGridView: View {
    private let items = [GridItem(), GridItem(), GridItem()]
    private let width = UIScreen.main.bounds.width / 3
    
    
    var body: some View {
        LazyVGrid(columns: items, content: {
            ForEach(0 ..< 10) { _ in
                NavigationLink(destination: FeedView()) {
                    Image("mapnote")
                        .resizable()
                        .scaledToFill()
                        .frame(width: width, height: width)
                        .clipped() // はみ出した部分を切り取る
                }
            }
        })
    }
}

struct PostGridView_Previews: PreviewProvider {
    static var previews: some View {
        PostGridView()
    }
}
