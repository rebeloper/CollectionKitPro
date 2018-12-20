//
//  InstaPostsManager.swift
//  CollectionKitPro
//
//  Created by Alex Nagy on 20/12/2018.
//  Copyright © 2018 Alex Nagy. All rights reserved.
//

import Foundation

class InstaPostsManager {
    
    // MARK: -
    // MARK: Fetch data for InstaUser
    
    static func fetchInstaUser() -> InstaUser? {
    var fetchedInstaUser: InstaUser? = nil
    return fetchedInstaUser
    }
    
    // MARK: -
    // MARK: Fetch data for InstaPosts
    
    static func fetchInstaPosts() -> [InstaPost]? {
        var fetchedInstaPosts: [InstaPost] = []
        for i in 0...19 {
            if let newInstaPost = InstaPost(documentData: [CollectionKitKeys.Base.uid: "\(i)"]) {
                fetchedInstaPosts.append(newInstaPost)
            }
        }
        return fetchedInstaPosts
    }
    
}
