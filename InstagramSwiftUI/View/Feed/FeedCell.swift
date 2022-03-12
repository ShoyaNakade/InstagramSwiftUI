//
//  FeedCell.swift
//  InstagramSwiftUI
//
//  Created by 中出翔也 on 2022/03/08.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
        VStack(alignment: .leading) {
            //MARK: - user info
            HStack {
                Image("mapnote")
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
                Image("mapnote")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 440)
                    .clipped()
                    .background(.primary)
            }
            
            //MARK: - action button
            HStack {
                Button {
                    //
                } label: {
                    Image(systemName: "heart")
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
            Text("3 likes")
                .font(.system(size: 14 , weight: .semibold))
                .padding(.leading, 8)
                .padding(.bottom, 2)
            
            HStack {
                Text("MapNote").font(.system(size: 14, weight: .semibold)) +
                Text(" This App is a note which hav your awesome memory. It's consist of map and note. ")
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

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell()
    }
}
