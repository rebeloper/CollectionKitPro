//
//  FacebookPostsManager.swift
//  CollectionKitPro
//
//  Created by Alex Nagy on 21/12/2018.
//  Copyright © 2018 Alex Nagy. All rights reserved.
//

import Foundation

class FacebookPostsManager {
    
    // MARK: -
    // MARK: Fetch data for FacebookUser
    
    static func fetchFacebookUser() -> FacebookUser? {
    var fetchedFacebookUser: FacebookUser? = nil
    return fetchedFacebookUser
    }
    
    // MARK: -
    // MARK: Fetch data for FacebookPosts
    
    static func fetchFacebookPosts() -> [FacebookPost]? {
        var fetchedFacebookPosts: [FacebookPost] = []
        for i in 0...2 {
            if let newFacebookPost = FacebookPost(documentData: [CollectionKitKeys.Base.uid: "\(i)"]) {
                fetchedFacebookPosts.append(newFacebookPost)
            }
        }
        return fetchedFacebookPosts
    }
    
}
