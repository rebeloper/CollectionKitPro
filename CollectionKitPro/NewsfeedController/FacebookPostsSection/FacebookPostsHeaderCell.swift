//
//  FacebookPostsHeaderCell.swift
//  CollectionKitPro
//
//  Created by Alex Nagy on 21/12/2018.
//  Copyright © 2018 Alex Nagy. All rights reserved.
//

import CollectionKit

// MARK: -
// MARK: Required 'FacebookPostsHeaderCellDelegate' protocol functions

protocol FacebookPostsHeaderCellDelegate {
    func didTapFacebookPostsHeaderCell(view: UIView, data: FacebookUser, index: Int)
}

// MARK: -
// MARK: Make required functions optional within the 'extension' of 'FacebookPostHeaderCellDelegate'

extension FacebookPostsHeaderCellDelegate {
    func didTapFacebookPostsHeaderCell(view: UIView, data: FacebookUser, index: Int) {}
}

class FacebookPostsHeaderCell: UIView {
    
    // MARK: -
    // MARK: Delegate
    
    var delegate: FacebookPostsHeaderCellDelegate?
    
    // MARK: -
    // MARK: Data and Index
    var viewData: ComposedHeaderProvider<FacebookPostsHeaderCell>.HeaderData?
    var data: FacebookUser?
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
        backgroundColor = #colorLiteral(red: 0.4156862745, green: 0.6901960784, blue: 0.2980392157, alpha: 1)
    }
    
    // MARK: -
    // MARK: Views
    
    // MARK: -
    // MARK: Handlers
    
    @objc func handleFacebookPostsHeaderCellTapped() {
        guard let delegate = delegate, let data = data, let index = index else { return }
        delegate.didTapFacebookPostsHeaderCell(view: self, data: data, index: index)
    }
    
    // MARK: -
    // MARK: Populate View with Data
    
    func populate(view: UIView, viewData: ComposedHeaderProvider<FacebookPostsHeaderCell>.HeaderData, data: FacebookUser, index: Int) {
        self.viewData = viewData
        self.data = data
        self.index = index
    }
    
}
