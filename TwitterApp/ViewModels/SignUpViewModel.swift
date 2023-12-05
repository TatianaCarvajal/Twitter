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
    func onSuccess()
}

class SignUpViewModel {
    weak var delegate: SignUpDelegate?
    
    func saveSignUp(name: String, email: String, password: String) {
        self.delegate?.load()
        Task {
            do {
                try await FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password)
                let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                changeRequest?.displayName = name
                try await changeRequest?.commitChanges()
                self.delegate?.onSuccess()
            }
            catch {
                self.delegate?.showError(message: error.localizedDescription)
            }
            self.delegate?.stopLoad()
        }
    }
}
