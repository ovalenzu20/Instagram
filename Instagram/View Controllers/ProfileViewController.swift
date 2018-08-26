//
//  ProfileViewController.swift
//  Instagram
//
//  Created by Omar Valenzuela on 8/21/18.
//  Copyright © 2018 Omar Valenzuela. All rights reserved.
//

import UIKit
import Parse


class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    func setupViews(){
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        let instagramTitle = UILabel()
        instagramTitle.text = "Instagram"
        instagramTitle.font = UIFont(name: "Billabong", size: 30)
        self.navigationItem.titleView = instagramTitle
        let logoutBarButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(onLogout(_:)))
        let newFont = UIFont(name: "Roboto", size: 17)
        logoutBarButton.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), NSAttributedStringKey.font: newFont], for: .normal)
        self.navigationItem.rightBarButtonItem = logoutBarButton
    }
    
    @IBAction func onLogout(_ sender: Any) {
        PFUser.logOutInBackground { (error: Error?) in
        }
        self.performSegue(withIdentifier: "logoutSegue", sender: nil)
    }
    

}
