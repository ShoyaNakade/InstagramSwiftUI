//
//  AuthVIewModel.swift
//  InstagramSwiftUI
//
//  Created by 中出翔也 on 2022/03/13.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User? // firsvieの切り分けのためオプショナル型
    
    static let shared = AuthViewModel()
    
    init() {
        userSession = Auth.auth().currentUser //firebaseからuserがあるか探す
    }
    
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Login failed \(error.localizedDescription)")
                return
            }
            guard let user = result?.user else { return }
            self.userSession = user
        }
    }
    
    func register(withEmail email: String, password: String, image: UIImage?, fullname: String, username: String) {
        guard let image = image else { return }
        
        ImageUploader.uploadImage(image: image) { imageUrl in
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                
                guard let user = result?.user else { return }
                print("sucsess register")
                
                let data = ["email": email,
                            "username": username,
                            "fullname": fullname,
                            "profileImageUrl": imageUrl,
                            "uid": user.uid]
                Firestore.firestore().collection("users").document(user.uid).setData(data) { _ in
                    print("successfully upload user data")
                    self.userSession = user
                }
            }
            
        }
        
    }
    
    func signout() {
        self.userSession = nil // クライアントサイドログアウト
        try? Auth.auth().signOut() // firebase(サーバー側)のログアウト
    }
    
    func resetPassword(){
        
    }
    
    func fetchUser() {
        
    }
}
