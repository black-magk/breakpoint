//
//  AuthVC.swift
//  breakpoint
//
//  Created by Landon Carr on 5/1/18.
//  Copyright © 2018 Landon Carr. All rights reserved.
//

import UIKit

class AuthVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func signInWithFacebookBtnPressed(_ sender: Any) {
    }
    @IBAction func signInWithGoogleBtnPressed(_ sender: Any) {
    }
    
    @IBAction func signInWithEmailBtnPressed(_ sender: Any) {
        let LoginVC  = storyboard?.instantiateViewController(withIdentifier: "LoginVC")
        present(LoginVC!, animated: true, completion: nil)
        
        
    }
    
}
