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
    
    @NSManaged var media : PFFile
    @NSManaged var author: PFUser
    @NSManaged var caption: String
    @NSManaged var likesCount: Int
    @NSManaged var commentsCount: Int
    @NSManaged var timestamp: String

    class func parseClassName() -> String {
        return "Post"
    }
    
    class func postUserImage(image: UIImage?, withCaption caption: String?, withCompletion completion: PFBooleanResultBlock?) {
        let post = Post()
        
        post.media = getPFFileFromImage(image: image)!
        post.author = PFUser.current()!
        post.caption = caption!
        post.likesCount = 0
        post.commentsCount = 0
        
        let time = Date()
        let formatter = DateFormatter()
        
        formatter.timeZone = TimeZone.current
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        let dateString = formatter.string(from: time)
        post.timestamp = dateString
        
        post.saveInBackground(block: completion)
    }
    
    class func getPFFileFromImage(image: UIImage?) -> PFFile? {
        if let image = image {
            if let imageData = UIImagePNGRepresentation(image) {
                return PFFile(name: "image.png", data: imageData)
            }
        }
        return nil
    }
    
//    class func fetchPosts(offset: Int = 0, limit: Int = 20, authorConstraint: PFUser? = nil, completion: PFQueryArrayResultBlock) -> [Post]? {
//        let query = PFQuery(className: "Post");
//        query.limit = limit;
//        query.skip = offset;
//        query.order(byDescending: "createdAt");
//        query.includeKey("author");
//
//        if (authorConstraint != nil) {
//            query.whereKey("author", equalTo: authorConstraint!);
//        }
//
//        var results: [PFObject]
//
//        do {
//            results = try query.findObjects();
//        } catch(_) {
//
//        }
//
//        completion(results, nil);
//
//        return results as! [Post]?;
//    }
}

