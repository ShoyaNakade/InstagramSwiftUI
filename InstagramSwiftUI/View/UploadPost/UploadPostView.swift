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
    @Binding var tabIndex: Int
    @ObservedObject var viewModel = UploadPostViewModel()
    
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
                    
//                    TextField("キャプションを入力してください",text: $captionText)
                    TextArea(text: $captionText, placeholder: "キャプションを入力してください")
                        .frame(height: 200)
                        
                }
                .padding()
                HStack {
                    Button {
                        captionText = ""
                        postImage = nil
                    } label: {
                        Text("キャンセル")
                            .font(.system(size: 16,
                                    weight: .semibold))
                            .frame(width: 172, height:50)
                            .background(Color.red)
                            .cornerRadius(5)
                            .foregroundColor(.white)
                    }
                    
                    Button {
                        if let image = selectedImage {
                            viewModel.uploadPost(caption: captionText, image: image) { _ in
                                captionText = ""
                                postImage = nil
                                tabIndex = 0
                            }
                        }
                    } label: {
                        Text("シェア")
                            .font(.system(size: 16,
                                    weight: .semibold))
                            .frame(width: 172, height:50)
                            .background(Color.blue)
                            .cornerRadius(5)
                            .foregroundColor(.white)
                    }
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

//struct UploadPostView_Previews: PreviewProvider {
//    static var previews: some View {
//        UploadPostView()
//    }
//}
