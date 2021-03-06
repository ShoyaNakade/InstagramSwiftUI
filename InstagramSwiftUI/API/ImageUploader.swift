//
//  ImageUploader.swift
//  InstagramSwiftUI
//
//  Created by 中出翔也 on 2022/03/13.
//

import UIKit
import Firebase

enum UploadType {
    case profile
    case post
    
    var filePath: StorageReference {
        let filename = NSUUID().uuidString
        
        switch self {
        case .profile:
            return Storage.storage().reference(withPath: "/profile_image/\(filename)")
        case .post:
            return Storage.storage().reference(withPath: "/post_image/\(filename)")
        }
    }
}

struct ImageUploader {
    static func uploadImage(image: UIImage, type: UploadType, completion: @escaping(String)  -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        let ref = type.filePath
        
        ref.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                print("Debug failed to upload image: \(error.localizedDescription)")
                return
            }
            
            print("Succes upload image...")
            
            ref.downloadURL { url, _ in
                guard let imageUrl = url?.absoluteString else { return }
                completion(imageUrl)
            }
            
        }
    
    }
}


