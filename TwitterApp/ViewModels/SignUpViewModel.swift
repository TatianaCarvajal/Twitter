//
//  SingUpViewModel.swift
//  TwitterApp
//
//  Created by Tatiana Carvajal on 13/10/23.
//

import Foundation
import FirebaseAuth

protocol SignUpDelegate: AnyObject {
    func load()
    func stopLoad()
    func showError(message: String)
}

class SignUpViewModel {
    
    var delegate: SignUpDelegate?
    
    func saveSignUp(name: String, email: String, password: String) {
        self.delegate?.load()
        Task {
            do {
              let result = try await FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password)
                print(result)
            }
            catch {
                self.delegate?.showError(message: error.localizedDescription)
            }
            self.delegate?.stopLoad()
        }
    }
}


