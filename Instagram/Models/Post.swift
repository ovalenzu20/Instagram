//
//  Post.swift
//  Instagram
//
//  Created by Omar Valenzuela on 8/21/18.
//  Copyright © 2018 Omar Valenzuela. All rights reserved.
//

import Foundation
import Parse


class Post: PFObject, PFSubclassing {
    
    // these are already included by default
    //    @NSManaged var objectId: String?
    //    @NSManaged var createdAt: Date?
    //    @NSManaged var updatedAt: Date?
    
    @NSManaged var author : PFUser
    @NSManaged var media : PFFile
    @NSManaged var caption : String
    @NSManaged var commentsCount : Int
    @NSManaged var likesCount : Int

    class func parseClassName() -> String {
        return "Post"
    }
    
    class func postUserImage(image: UIImage?, withCaption caption: String?, withCompletion completion: PFBooleanResultBlock?) {
        let post = Post()
        
        post.media = getPFFileFromImage(image: image)!
        post.author = PFUser.current()! // Pointer column type that points to PFUser
        post.caption = caption!
        post.likesCount = 0
        post.commentsCount = 0
        
        post.saveInBackground(block: completion)
    }
    
    
    // Method to convert UIImage to PFFile
    class func getPFFileFromImage(image: UIImage?) -> PFFile? {
        if let image = image {
            if let imageData = UIImagePNGRepresentation(image) {
                return PFFile(name: "image.png", data: imageData)
            }
        }
        return nil
    }
}

