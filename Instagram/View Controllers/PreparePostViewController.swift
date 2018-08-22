//
//  PreparePostViewController.swift
//  Instagram
//
//  Created by Omar Valenzuela on 8/22/18.
//  Copyright © 2018 Omar Valenzuela. All rights reserved.
//

import UIKit

class PreparePostViewController: UIViewController {

    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var caption: UITextField!
    
    var postImage : UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()
        print("POST IMAGE", postImage)
        postImageView.image = postImage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onPost(_ sender: Any) {
    }
    
    

}
