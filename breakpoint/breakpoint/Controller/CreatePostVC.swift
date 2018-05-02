//
//  CreatePostVC.swift
//  breakpoint
//
//  Created by Landon Carr on 5/2/18.
//  Copyright © 2018 Landon Carr. All rights reserved.
//

import UIKit
import Firebase

class CreatePostVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var sendBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.delegate = self
        // Do any additional setup after loading the view.
    }


    @IBAction func sendBtnPressed(_ sender: Any) {
        
        if textView.text != nil && textView.text != "Say something here..." {
            
            sendBtn.isEnabled = false
            
            DataService.instance.uploadPost(withMessage: textView.text, forUid: (Auth.auth().currentUser?.uid)!, withGroupKey: nil, sendComplete: { (isComplete) in
                if isComplete {
                    self.sendBtn.isEnabled = true
                    self.dismiss(animated: true, completion: nil)
                } else {
                    
                    
                    self.sendBtn.isEnabled = true
                    print("There was an Error ")
                }
            })
            
            
        }
        
    }
    @IBAction func closeBtnPressed(_ sender: Any) {
    
    
   dismiss(animated: true, completion: nil)
   
}
}
    



extension CreatePostVC: UITextViewDelegate {
    private func textFieldDidBeginEditing(_ textView: UITextView) {
        
        textView.text = ""
    }
}

