//
//  loginResource.swift
//  MVVM
//
//  Created by Saurabhnegi on 23/06/22.
//

import Foundation
struct loginResource{
    func loginUser(loginRequest:LoginRequest , completion :@escaping(_ result : LoginResponse?)->Void )
    {
        let loginUrl = URL(string : api.login)!
        let httpUtility = HttpUtility()
        
        do {
            let loginPostBody = try JSONEncoder().encode(loginRequest)
            httpUtility.postApiData(requestUrl: loginUrl, requestBody: loginPostBody, resultType: LoginResponse.self){(loginApiResponse) in
                _ = completion(loginApiResponse)
            }
        }
        catch let error{
            debugPrint(error)
        }
        
    }
}
