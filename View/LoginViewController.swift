//
//  LoginViewController.swift
//  MVVM
//
//  Created by Saurabhnegi on 23/06/22.
//

import UIKit

class LoginViewController: UIViewController, loginViewModelDelegate{
  private var LoginViewModel = loginViewModel()
    

    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LoginViewModel.delegate = self
     
    }
    
    @IBAction func submitBtn(_ sender: Any) {
        let request = LoginRequest(email: email.text, password: password.text)
              LoginViewModel.loginUser(loginRequest: request)
        
    }
    
    func recieveResponse(loginResponse: LoginResponse) {
        if(loginResponse.errorMessage == nil && loginResponse.data    != nil){
            debugPrint("asdasd")
        }  else if (loginResponse.errorMessage != nil)
        {
            let alert = UIAlertController(title: Constants.ErrorAlertTitle, message: loginResponse.errorMessage, preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: Constants.OkAlertTitle, style: .default, handler: nil))

            self.present(alert, animated: true)
        }
    }


}
