//
//  DocumentSerializable.swift
//  CollectionKitPro
//
//  Created by Alex Nagy on 20/12/2018.
//  Copyright © 2018 Alex Nagy. All rights reserved.
//

import Foundation

protocol DocumentSerializable {
    init?(documentData: [String: Any])
}
