//
//  InstaPostCell.swift
//  CollectionKitPro
//
//  Created by Alex Nagy on 20/12/2018.
//  Copyright © 2018 Alex Nagy. All rights reserved.
//

import CollectionKit

// MARK: -
// MARK: Required 'InstaPostCellDelegate' protocol functions

protocol InstaPostCellDelegate {
    func didTapInstaPostCell(view: UIView, data: InstaPost, index: Int)
}

// MARK: -
// MARK: Make required functions optional within the 'extension' of 'InstaPostCellDelegate'

extension InstaPostCellDelegate {
    func didTapInstaPostCell(view: UIView, data: InstaPost, index: Int) {}
}

class InstaPostCell: UIView {
    
    // MARK: -
    // MARK: Delegate
    
    var delegate: InstaPostCellDelegate?
    
    // MARK: -
    // MARK: Data and Index
    
    var data: InstaPost?
    var index: Int?
    
    // MARK: -
    // MARK: Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -
    // MARK: Common Init
    
    fileprivate func commonInit() {
        setupViews()
    }

    // MARK: -
    // MARK: Setup Views
    
    fileprivate func setupViews() {
        backgroundColor = UIColor(red: 34/255, green: 112/255, blue: 147/255, alpha: 1.0)
    }
    
    // MARK: -
    // MARK: Views
    
    // MARK: -
    // MARK: Handlers
    
    @objc func handleInstaPostCellTapped() {
        guard let delegate = delegate, let data = data, let index = index else { return }
        delegate.didTapInstaPostCell(view: self, data: data, index: index)
    }
    
    // MARK: -
    // MARK: Populate View with Data
    
    func populate(view: UIView, data: InstaPost, index: Int) {
        self.data = data
        self.index = index
    }
    
}
