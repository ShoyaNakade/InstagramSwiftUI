//
//  FeedCell.swift
//  InstagramSwiftUI
//
//  Created by 中出翔也 on 2022/03/08.
//

import SwiftUI
import Kingfisher

struct FeedCell: View {
    @ObservedObject var viewModel: FeedCellViewModel
    
    var didLike: Bool { return viewModel.post.didLike ?? false }
    
    init(viewModel: FeedCellViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            //MARK: - user info
            HStack {
                KFImage(URL(string: viewModel.post.ownerImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 36, height: 36)
                    .clipped()
                    .cornerRadius(18)
                    
                
                Text("Shoya")
                    .font(.system(size: 14, weight: .semibold))
            }
            .padding([.leading, .bottom], 8)
            
            
            //MARK: - post name
            HStack {
                KFImage(URL(string: viewModel.post.imageUrl))
                    .resizable()
                    .scaledToFit()
                    .frame(height: 440)
                    .clipped()
                    .background(.primary)
            }
            
            //MARK: - action button
            HStack {
                Button {
                    self.didLike ? viewModel.unlike() : viewModel.like()
                } label: {
                    Image(systemName: didLike ? "heart.fill" : "heart")
                        .resizable()
                        .scaledToFill()
                        .foregroundColor(didLike ? .red : .black)
                        .frame(width: 20, height: 20)
                        .font(.system(size:20))
                        .clipped()
                        .padding(4)
                }
                
                NavigationLink {
                    CommentsView(post: viewModel.post)
                } label: {
                    Image(systemName: "bubble.right")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                        .font(.system(size:20))
                        .clipped()
                        .padding(4)
                }
                
                Button {
                    //
                } label: {
                    Image(systemName: "paperplane")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                        .font(.system(size:20))
                        .clipped()
                        .padding(4)
                }
            }
            .padding(.leading, 4)
            .foregroundColor(.black)
            
            
            //MARK: - caption
            Text(viewModel.likeString)
                .font(.system(size: 14 , weight: .semibold))
                .padding(.leading, 8)
                .padding(.bottom, 2)
            
            HStack {
                Text("\(viewModel.post.ownerUsername)").font(.system(size: 14, weight: .semibold)) +
                Text(" \(viewModel.post.caption)")
                    .font(.system(size: 15))
            }
            .padding(.horizontal, 8)
            
            Text("2d")
                .font(.system(size: 14))
                .foregroundColor(.gray)
//                .padding([.leading, .top], 8)
                .padding(.leading, 8)
                .padding(.top,2)
        }
    }
}

//struct FeedCell_Previews: PreviewProvider {
//    static var previews: some View {
//        FeedCell()
//    }
//}
