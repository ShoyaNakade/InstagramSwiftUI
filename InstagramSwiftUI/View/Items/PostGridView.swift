//
//  PostGridView.swift
//  InstagramSwiftUI
//
//  Created by 中出翔也 on 2022/03/12.
//

import SwiftUI
import Kingfisher

struct PostGridView: View {
    private let items = [GridItem(), GridItem(), GridItem()]
    private let width = UIScreen.main.bounds.width / 3
    let config: PostGridConfigration
    @ObservedObject var viewModel: PostGridViewModel
    
    init(config: PostGridConfigration) {
        self.config = config
        self.viewModel = PostGridViewModel(config: config)
    }
    
    var body: some View {
        LazyVGrid(columns: items, content: {
            ForEach(viewModel.posts) { post in
                NavigationLink(destination: FeedView()) {
                    KFImage(URL(string: post.imageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: width, height: width)
                        .clipped() // はみ出した部分を切り取る
                }
            }
        })
    }
}
//
//struct PostGridView_Previews: PreviewProvider {
//    static var previews: some View {
//        PostGridView()
//    }
//}
