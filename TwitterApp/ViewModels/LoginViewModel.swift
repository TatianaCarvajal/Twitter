//
//  LoginViewModel.swift
//  TwitterApp
//
//  Created by Tatiana Carvajal on 6/11/23.
//

import Foundation
import FirebaseAuth

protocol LoginDelegate: AnyObject {
    func load()
    func stopLoad()
    func onFailure(message: String)
}

class LoginViewModel {
    weak var delegate: LoginDelegate?
    
    func loginUser(email: String, password: String) {
        self.delegate?.load()
        Task {
            do {
                try await FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password)
            }
            catch {
                self.delegate?.onFailure(message: error.localizedDescription)
            }
            self.delegate?.stopLoad()
        }
    }
}
