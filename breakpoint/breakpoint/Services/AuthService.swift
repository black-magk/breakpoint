//
//  AuthService.swift
//  breakpoint
//
//  Created by Landon Carr on 5/1/18.
//  Copyright © 2018 Landon Carr. All rights reserved.
//

import Foundation
import Firebase


class AuthService {
    
    
    static let instance = AuthService()
    
    
    
    func registerUser(withEmail email: String, andPassword password: String, userCreationComplete: @escaping (_ status:Bool,_ error: Error?)-> ()) {
        
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            guard let user = user else {
                userCreationComplete(false, error)
                return
            }
            
            let userData = ["provider": user.providerID, "email": user.email]
            
            DataService.instance.createDBUSER(uid: user.uid, userData: userData)
               userCreationComplete(true, nil)
        }
        
    }
    
    func loginUser(withEmail email: String, andPassword password: String, loginComplete: @escaping (_ status:Bool,_ error: Error?)-> ()) {
        
        
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if error !=  nil {
                loginComplete(false, error)
                return
            }
          
            }
                loginComplete(true, nil)
        }
        
    }
    
    

