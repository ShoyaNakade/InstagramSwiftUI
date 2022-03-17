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
    @Published var currentUser: User?
    
    static let shared = AuthViewModel()
    
    init() {
        userSession = Auth.auth().currentUser //firebaseからuserがあるか探す
        fetchUser()
    }
    
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Login failed \(error.localizedDescription)")
                return
            }
            guard let user = result?.user else { return }
            self.userSession = user
            self.fetchUser()
            
        }
    }
    
    func register(withEmail email: String, password: String, image: UIImage?, fullname: String, username: String) {
        guard let image = image else { return }
        
        ImageUploader.uploadImage(image: image, type: .profile) { imageUrl in
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
                COLLECTION_USERS.document(user.uid).setData(data) { _ in
                    print("successfully upload user data")
                    self.userSession = user
                    self.fetchUser()
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
        guard let uid = userSession?.uid else { return }
        COLLECTION_USERS.document(uid).getDocument { snapshot, _ in
            
            //--------- ここからはあまり良くない読み込み方法 -----------------
            //            guard let dictionary = snapshot?.data() else { return }
            //            guard let username = dictionary["username"] as? String else { return } //この読み込みはコードが多くなるため、プロトコルを使う
            //            let user = User(username: username, email: <#T##String#>, profileImageUrl: <#T##String#>, fullname: <#T##String#>, uid: <#T##String#>)
            //            print("\(username)")
            //-------------- ここまで -----------------------------------
            
            guard let user = try? snapshot?.data(as: User.self) else { return }
            self.currentUser = user
        }
    }
}
