//
//  InstaPostsHeaderCell.swift
//  CollectionKitPro
//
//  Created by Alex Nagy on 20/12/2018.
//  Copyright © 2018 Alex Nagy. All rights reserved.
//

import CollectionKit

// MARK: -
// MARK: Required 'InstaPostsHeaderCellDelegate' protocol functions

protocol InstaPostsHeaderCellDelegate {
    func didTapInstaPostsHeaderCell(view: UIView, data: InstaUser, index: Int)
}

// MARK: -
// MARK: Make required functions optional within the 'extension' of 'InstaPostHeaderCellDelegate'

extension InstaPostsHeaderCellDelegate {
    func didTapInstaPostsHeaderCell(view: UIView, data: InstaUser, index: Int) {}
}

class InstaPostsHeaderCell: UIView {
    
    // MARK: -
    // MARK: Delegate
    
    var delegate: InstaPostsHeaderCellDelegate?
    
    // MARK: -
    // MARK: Data and Index
    var viewData: ComposedHeaderProvider<InstaPostsHeaderCell>.HeaderData?
    var data: InstaUser?
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
        backgroundColor = UIColor(red: 255/255, green: 177/255, blue: 66/255, alpha: 1.0)
    }
    
    // MARK: -
    // MARK: Views
    
    // MARK: -
    // MARK: Handlers
    
    @objc func handleInstaPostsHeaderCellTapped() {
        guard let delegate = delegate, let data = data, let index = index else { return }
        delegate.didTapInstaPostsHeaderCell(view: self, data: data, index: index)
    }
    
    // MARK: -
    // MARK: Populate View with Data
    
    func populate(view: UIView, viewData: ComposedHeaderProvider<InstaPostsHeaderCell>.HeaderData, data: InstaUser, index: Int) {
        self.viewData = viewData
        self.data = data
        self.index = index
    }
    
}
