//
//  NewsfeedControllerLayout.swift
//  CollectionKitPro
//
//  Created by Alex Nagy on 20/12/2018.
//  Copyright © 2018 Alex Nagy. All rights reserved.
//

import Foundation
import UIKit

// MARK: -
// MARK: Cell Layout

struct NewsfeedControllerLayout {
    
    // MARK: -
    // MARK: Header heigth; set to '0' to hide
    
    static let headerCellHeight: CGFloat = 150
    
    // MARK: -
    // MARK: Composed Provider Layout Constants
    
    struct ComposedProvider {
        static let spacing: CGFloat = 10
        static let topEdgeInset: CGFloat = 5
        static let leftEdgeInset: CGFloat = 4
        static let bottomEdgeInset: CGFloat = 5
        static let rigthEdgeInset: CGFloat = 5
    }
    
    // MARK: -
    // MARK: Section 0 Provider Layout Constants
    
    struct Section0 {
        static let numberOfCellsPerWidth: CGFloat = 3
        
        struct CellProvider {
            static let spacing: CGFloat = 10
            static let topEdgeInset: CGFloat = 5
            static let leftEdgeInset: CGFloat = 5
            static let bottomEdgeInset: CGFloat = 5
            static let rigthEdgeInset: CGFloat = 5
        }
        
    }
    
    // MARK: -
    // MARK: Section 1 Provider Layout Constants
    
    struct Section1 {
        static let numberOfCellsPerWidth: CGFloat = 2
        
        struct CellProvider {
            static let spacing: CGFloat = 1
            static let topEdgeInset: CGFloat = 0
            static let leftEdgeInset: CGFloat = 0
            static let bottomEdgeInset: CGFloat = 0
            static let rigthEdgeInset: CGFloat = 0
        }
        
    }
    
}
