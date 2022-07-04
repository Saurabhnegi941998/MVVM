//
//  loginValidation.swift
//  MVVM
//
//  Created by Saurabhnegi on 23/06/22.
//

import Foundation
struct loginValidation{
    func validate(loginRequest : LoginRequest)-> ValidationResult
    {
        if(loginRequest.email!.isEmpty)
        {
            return ValidationResult(success: false, error: "user Email is Empty")
        }
        if(loginRequest.password!.isEmpty)
        {
            return ValidationResult(success: false, error: "user Password is Empty")
        }
        return ValidationResult(success: true, error: nil )
    }
}
