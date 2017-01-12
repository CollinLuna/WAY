//
//  ViewController.swift
//  WAY
//
//  Created by Collin Luna on 1/10/17.
//  Copyright © 2017 Collin Luna. All rights reserved.
//

import UIKit
import Firebase

class SignInVC: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var pwdField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func firebaseAuth(_ credential: FIRAuthCredential) {
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in if error != nil {
            print("COLLIN: Unable to authenticate with Firebase - \(error)")
        } else {
            print("COLLIN: Successfully authenticated with Firebase")
            }
        })
    }
    @IBAction func SignInTapped(_ sender: Any) {
        if let email = emailField.text, let pwd = pwdField.text {
            FIRAuth.auth()?.signIn(withEmail: email, password: pwd, completion: { (user, error) in if error == nil {
                print("COLLIN: Email User authenticated with Firebase")
            } else {
                FIRAuth.auth()?.createUser(withEmail: email, password: pwd, completion: { (user, error) in if error != nil {
                    print("COLLIN: Unable to authenticate with Firebase with email")
                }   else {
                    print ("COLLIN: Successfully authenticated with Firebase")
                    }
                })
                }
        })
        
        }
    }
}
