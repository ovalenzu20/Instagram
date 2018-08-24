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
        postImageView.contentMode = .scaleAspectFill
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func onShare(_ sender: Any) {
        Post.postUserImage(image: postImage, withCaption: caption.text){ (success, error) in
            if success {
                print("post successful")
                self.performSegue(withIdentifier: "backToHomeSegue", sender: nil)
                
            }
            else if let error = error as NSError? {
                let errorString = error.localizedDescription
                let alertController = UIAlertController(title: "Can't share post", message: errorString, preferredStyle: .alert)
                
                let okAction = UIAlertAction(title: "OK", style: .cancel, handler: {
                    (action) in
                })
                
                alertController.addAction(okAction)
                
                self.present(alertController, animated: true)
            }
        }
    }
    
    @IBAction func onUploadDifferentPicture(_ sender: Any) {
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerControllerSourceType.photoLibrary
        self.present(vc, animated: true, completion: nil)
        
        
    }
    
    @IBAction func onCancel(_ sender: Any) {
        self.performSegue(withIdentifier: "backToHomeSegue", sender: nil)

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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let homeVC = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        homeVC.tableView.reloadData()
        
    }
    
    

}
