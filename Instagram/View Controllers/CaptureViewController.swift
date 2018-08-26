//
//  CaptureViewController.swift
//  Instagram
//
//  Created by Omar Valenzuela on 8/21/18.
//  Copyright © 2018 Omar Valenzuela. All rights reserved.
//

import UIKit
import Toucan
import Parse
import ParseUI

class CaptureViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var selectedImage : UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerControllerSourceType.photoLibrary
        self.present(vc, animated: true, completion: nil)
        
        DispatchQueue.main.async(){
            self.performSegue(withIdentifier: "transitionToPreparePost", sender: self)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupViews(){
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        let instagramTitle = UILabel()
        instagramTitle.text = "Instagram"
        instagramTitle.font = UIFont(name: "Billabong", size: 30)
        self.navigationItem.titleView = instagramTitle
    }
    
    @objc func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
        
        // Do something with the images (based on your use case)
        if editedImage != originalImage{
            let resizedImage = Toucan.Resize.resizeImage(editedImage, size: CGSize(width: 414, height: 414))
            self.selectedImage = resizedImage
        } else{
            let resizedImage = Toucan.Resize.resizeImage(originalImage, size: CGSize(width: 414, height: 414))
            self.selectedImage = resizedImage
        }
        
        DispatchQueue.main.async(){
            self.performSegue(withIdentifier: "transitionToPreparePost", sender: self)
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
        self.performSegue(withIdentifier: "HomeSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier != "HomeSegue"{
            let preparePostViewController = segue.destination as! PreparePostViewController
            preparePostViewController.postImage = selectedImage
        }
        
        
    }
}
