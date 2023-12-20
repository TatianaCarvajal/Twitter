//
//  LoginViewController.swift
//  TwitterApp
//
//  Created by Tatiana Carvajal on 6/11/23.
//

import FirebaseAuth
import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var spinnerView: SpinnerView!
    
    private let viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
    }
    
    @IBAction func loginAction() {
        guard let email = self.emailTextField.text, !email.isEmpty,
              let password =  self.passwordTextField.text, !password.isEmpty
        else {
            self.onFailure(message: "Empty Field")
            return
        }
        self.viewModel.loginUser(email: email, password: password)
    }
}

extension LoginViewController: LoginDelegate {
    func onSuccess() {
        DispatchQueue.main.async {
            let storyboard = UIStoryboard(name: "HomeViewController", bundle: nil)
            guard let homeViewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController else{
                return
            }
            
           // self.navigationController?.pushViewController(homeViewController, animated: true)
            self.present(homeViewController, animated: true)
        }
    }
    
    func load() {
        spinnerView.showAnimation()
    }
    
    func stopLoad() {
        DispatchQueue.main.async {
            self.spinnerView.stopAnimation()
        }
    }
    
    func onFailure(message: String) {
        DispatchQueue.main.async {
            let alert: UIAlertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            let cancel: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel)
            alert.addAction(cancel)
            self.present(alert, animated: true, completion: nil)
        }
    }
}
