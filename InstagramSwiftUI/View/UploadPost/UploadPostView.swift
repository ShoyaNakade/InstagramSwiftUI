//
//  UploadPostView.swift
//  InstagramSwiftUI
//
//  Created by 中出翔也 on 2022/03/08.
//

import SwiftUI

struct UploadPostView: View {
    @State private var selectedImage: UIImage?
    @State var postImage: Image?
    @State var captionText =  ""
    @State var imagePickerPresented = false
    
    var body: some View {
        VStack {
            if postImage == nil {
                Button {
                    imagePickerPresented.toggle()
                    
                } label: {
                    Image("plus_photo")
                        .resizable()
                        .renderingMode(.template)
                        .scaledToFill()
                        .frame(width: 180, height: 180)
                        .clipped()
                        .padding(.top, 56)
                        .foregroundColor(.black)
                }
                .sheet(isPresented: $imagePickerPresented) {
                    loadImage() //ondismiss action sheetが消える時にload
                } content: {
                    ImagePicker(image: $selectedImage)
                }

            } else if let image = postImage {
                HStack(alignment: .top) {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 96, height: 96)
                        .clipped()
                    
                    TextField("キャプションを入力してください",text: $captionText)
                }
                .padding()
                
                
                Button {
                    // action
                } label: {
                    Text("シェア")
                        .font(.system(size: 16,
                                weight: .semibold))
                        .frame(width: 360, height:50)
                        .background(Color.blue)
                        .cornerRadius(5)
                        .foregroundColor(.white)
                }
                .padding()
            }
            Spacer()
            
        }
        
    }
}


extension UploadPostView {
    // コードの可読性のため、extensionでfuncを別記
    func loadImage() {
        guard let selectedImage = selectedImage else {return}
        postImage = Image(uiImage:selectedImage )
    }
}

struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPostView()
    }
}
