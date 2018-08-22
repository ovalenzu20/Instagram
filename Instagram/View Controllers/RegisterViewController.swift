//
//  RegisterViewController.swift
//  Instagram
//
//  Created by Omar Valenzuela on 8/21/18.
//  Copyright © 2018 Omar Valenzuela. All rights reserved.
//

import UIKit
import Parse


class RegisterViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onSignUp(_ sender: Any) {
        
        let newUser = PFUser()
        newUser.username = usernameTextField.text! as String
        newUser.password = passwordTextField.text! as String
        newUser.email = emailTextField.text! as String
        
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            if success{
                print("registered successfully")
                 self.performSegue(withIdentifier: "RegisterSucessfulSegue", sender: nil)
            }
            else {
                print(error!.localizedDescription)
                let errorMessage = error?.localizedDescription

                let alertController = UIAlertController(title: "Error Signing Up. Try again", message: errorMessage, preferredStyle: .alert)
                
                let okAction = UIAlertAction(title: "OK", style: .cancel, handler: { (action) in })
                
                alertController.addAction(okAction)
                self.present(alertController, animated: true)
            }
        }
    }

}
