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
    
    @NSManaged var author : String?
    @NSManaged var image : UIImage
    @NSManaged var caption : String
    @NSManaged var commmentsCount : Int
    @NSManaged var likesCount : Int

    
    
    
    
    // returns the Parse name that should be used
    class func parseClassName() -> String {
        return "Post"
    }
}

