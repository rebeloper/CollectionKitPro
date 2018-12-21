//
//  InstaPostsModels.swift
//  CollectionKitPro
//
//  Created by Alex Nagy on 20/12/2018.
//  Copyright © 2018 Alex Nagy. All rights reserved.
//

import Foundation

// MARK: -
// MARK: Header Model

struct InstaUser {
    let uid: String
    
    var dictionary: [String: Any] {
        return [
            CollectionKitKeys.Base.uid: uid
        ]
    }
}

extension InstaUser: DocumentSerializable {
    init?(documentData: [String : Any]) {
        guard
            let uid = documentData[CollectionKitKeys.Base.uid] as? String
            else { return nil }
        self.init(uid: uid)
    }
}

// MARK: -
// MARK: Cell Model

struct InstaPost {
    let uid: String

    var dictionary: [String: Any] {
        return [
            CollectionKitKeys.Base.uid: uid
        ]
    }
}

extension InstaPost: DocumentSerializable {
    init?(documentData: [String : Any]) {
        guard
            let uid = documentData[CollectionKitKeys.Base.uid] as? String
            else { return nil }
        self.init(uid: uid)
    }
}
