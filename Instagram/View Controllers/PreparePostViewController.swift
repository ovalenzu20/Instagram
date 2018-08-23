//
//  PreparePostViewController.swift
//  Instagram
//
//  Created by Omar Valenzuela on 8/22/18.
//  Copyright © 2018 Omar Valenzuela. All rights reserved.
//

import UIKit

class PreparePostViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {

    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var caption: UITextField!
    var postImage : UIImage?
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        caption.borderStyle = UITextBorderStyle.roundedRect

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postImageView.image = postImage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func onShare(_ sender: Any) {
        
    }
    
    @IBAction func onUploadDifferentPicture(_ sender: Any) {
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerControllerSourceType.photoLibrary
        self.present(vc, animated: true, completion: nil)
        
        
    }
    
    @IBAction func onCancel(_ sender: Any) {
        self.performSegue(withIdentifier: "cancelSegue", sender: nil)

    }
    
    @objc func imagePickerController(_ picker: UIImagePickerController,
                                     didFinishPickingMediaWithInfo info: [String : Any]) {
        let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
        
        if editedImage != originalImage{
            self.postImage = editedImage
            postImageView.image = postImage
        } else{
            self.postImage = originalImage
            postImageView.image = postImage
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    

}
