//
//  LoginViewController.swift
//  Instagram
//
//  Created by Omar Valenzuela on 8/20/18.
//  Copyright © 2018 Omar Valenzuela. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSignIn(_ sender: Any) {
        let username = usernameTextField.text! as String
        let passwordEntered = passwordTextField.text! as String
        
        PFUser.logInWithUsername(inBackground: username, password: passwordEntered) {
            (user: PFUser?, error: Error?) -> Void in
            if user != nil {
                print("logged in successfully")
                self.performSegue(withIdentifier: "LoginSucessfulSegue", sender: nil)
            } else {
                print(error!.localizedDescription)
            }
        }

    }
    
    @IBAction func onSignUp(_ sender: Any) {
        
        let newUser = PFUser()
        newUser.username = usernameTextField.text! as String
        newUser.password = passwordTextField.text! as String
        
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            if success{
                print("registered successfully")
            }
            else {
                print(error!.localizedDescription)
            }
        }
    }
    

}
