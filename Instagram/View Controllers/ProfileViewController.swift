//
//  ProfileViewController.swift
//  Instagram
//
//  Created by Omar Valenzuela on 8/21/18.
//  Copyright © 2018 Omar Valenzuela. All rights reserved.
//

import UIKit
import Parse
import ParseUI


class ProfileViewController: UIViewController, UICollectionViewDataSource {

    @IBOutlet weak var profilePictureImageView: PFImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        
        setupNavBar()
        setupViews()
        setupCollectionViewLayout()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfilePostCell", for: indexPath) as! ProfilePostCell

        return cell
    }
    
    func setupCollectionViewLayout(){
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let cellsPerLine : CGFloat = 3
        let interItemTotalSpacing = layout.minimumInteritemSpacing * (cellsPerLine - 1)
        let width = collectionView.frame.width / cellsPerLine - interItemTotalSpacing / cellsPerLine
        let height = width
        
        layout.itemSize = CGSize(width: width, height: height)
        
    }
    
    func setupNavBar(){
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
    
    func setupViews(){
        profilePictureImageView.layer.borderWidth = 1.0
        profilePictureImageView.layer.masksToBounds = false
        profilePictureImageView.layer.borderColor = UIColor.white.cgColor
        profilePictureImageView.layer.cornerRadius = profilePictureImageView.frame.size.height/2
        profilePictureImageView.clipsToBounds = true
        
        
    }
    
    @IBAction func onLogout(_ sender: Any) {
        PFUser.logOutInBackground { (error: Error?) in
        }
        self.performSegue(withIdentifier: "logoutSegue", sender: nil)
    }
    

}
