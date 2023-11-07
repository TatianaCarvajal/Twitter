//
//  ViewController.swift
//  TwitterApp
//
//  Created by Tatiana Carvajal on 10/10/23.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var createPasswordTextField: UITextField!
    @IBOutlet var spinnerView: SpinnerView!
    
    private let viewModel = SignUpViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
    }
    
    @IBAction func signUpAction() {
        guard let name = self.nameTextField.text, !name.isEmpty,
              let email = self.emailTextField.text, !email.isEmpty,
              let password =  self.createPasswordTextField.text, !password.isEmpty
        else {
            self.showError(message: "Empty Field")
            return
        }
        self.viewModel.saveSignUp(name: name, email: email, password: password)
    }
}

extension SignUpViewController: SignUpDelegate {
    
    func load() {
        spinnerView.showAnimation()
    }
    
    func stopLoad() {
        DispatchQueue.main.async {
            self.spinnerView.stopAnimation()
        }
    }
    
    func showError(message: String) {
        DispatchQueue.main.async {
            let alert: UIAlertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            let cancel: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel)
            alert.addAction(cancel)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func onSuccess() {
        DispatchQueue.main.async {
            self.dismiss(animated: true)
        }
    }
}

