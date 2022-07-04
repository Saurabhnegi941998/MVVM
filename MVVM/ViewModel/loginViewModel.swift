//
//  loginViewModel.swift
//  MVVM
//
//  Created by Saurabhnegi on 23/06/22.
//

import Foundation

protocol loginViewModelDelegate{
    func recieveResponse(loginResponse : LoginResponse)
    
}
struct loginViewModel{
    var delegate : loginViewModelDelegate?
    func loginUser(loginRequest: LoginRequest){
        
        let validationResult = loginValidation().validate(loginRequest: loginRequest)
        if(validationResult.success)
        {
            let loginResource = loginResource()
            loginResource.loginUser(loginRequest: loginRequest){ (loginApiResponse) in
                
                
                DispatchQueue.main.async{
                    self.delegate?.recieveResponse(
                        loginResponse : loginApiResponse!)
                }
            }
        }
        self.delegate?.recieveResponse(loginResponse: LoginResponse(errorMessage: validationResult.error, data: nil))
        
    }
}
