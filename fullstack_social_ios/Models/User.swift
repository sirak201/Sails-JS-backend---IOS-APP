//
//  User.swift
//  fullstack_social_ios
//
//  Created by Sirak on 12/9/19.
//  Copyright © 2019 Sirak Zeray. All rights reserved.
//

import Foundation
import Alamofire



class User {

    
    func signIn(email : String , password : String , completionHandler: @escaping (Result<DataResponse<Data>>) -> Void) {
        let prams = [ "emailAddress" : email, "password": password ]
          guard let url = URL(string: "http://localhost:1337/api/v1/entrance/login") else {return}
          
          Alamofire.request(url, method: .put, parameters: prams, encoding: URLEncoding()).responseData { (dataResponse) in
        
                  if let err = dataResponse.error {
                        completionHandler(.failure(err))
                         return
                  } else {
                    completionHandler(.success(dataResponse))
                    return
                 }
          }
    }
    
    func registerNewUser(email : String , password : String , fullName : String  , completionHandler: @escaping (Result<DataResponse<Data>>) -> Void) {
        let url = "http://localhost:1337/api/v1/entrance/signup"
        let params = ["fullName": fullName, "emailAddress": email, "password": password]
        
        Alamofire.request(url, method: .post, parameters: params)
                 .validate(statusCode: 200..<300)
                 .responseData { (dataResponse) in
                    
                    if let err = dataResponse.error {
                            completionHandler(.failure(err))
                             return
                        } else {
                            completionHandler(.success(dataResponse))
                            return
                    }

        }
    }
}
