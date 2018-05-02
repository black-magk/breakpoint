//
//  LoginVC.swift
//  breakpoint
//
//  Created by Landon Carr on 5/1/18.
//  Copyright © 2018 Landon Carr. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var emailField: InsetTextField!
    @IBOutlet weak var passwordField: InsetTextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        emailField.delegate = self
        passwordField.delegate = self
        // Do any additional setup after loading the view.
    }

 
    
    @IBAction func signInBtnPressed(_ sender: Any) {
        
        if emailField.text != nil &&
            passwordField.text != nil {
            
            AuthService.instance.loginUser(withEmail: emailField.text!, andPassword: passwordField.text!, loginComplete: { (success, loginError) in
                if success {
                    
                    self.dismiss(animated: true, completion: nil)
                } else {
                    print(String(describing: loginError?.localizedDescription))
                }
                
                AuthService.instance.registerUser(withEmail: self.emailField.text!, andPassword: self.passwordField.text!, userCreationComplete: { (success, registrationError) in
                
                    if success {
                        
                        AuthService.instance.loginUser(withEmail: self.emailField.text!, andPassword: self.passwordField.text!, loginComplete: { (success, nil) in
                            self.dismiss(animated: true, completion: nil)
                            
                            print("Successfully Logged In User")
                            
                            
                        })
                    } else {
                        print(String(describing: registrationError?.localizedDescription))
                    }
            
            
                })
        
            })
            
        }
        
    }
    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}


extension LoginVC: UITextFieldDelegate {
    
}
