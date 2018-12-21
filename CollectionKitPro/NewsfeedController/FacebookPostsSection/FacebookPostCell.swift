//
//  FacebookPostCell.swift
//  CollectionKitPro
//
//  Created by Alex Nagy on 21/12/2018.
//  Copyright © 2018 Alex Nagy. All rights reserved.
//

import CollectionKit

// MARK: -
// MARK: Required 'FacebookPostCellDelegate' protocol functions

protocol FacebookPostCellDelegate {
    func didTapFacebookPostCell(view: UIView, data: FacebookPost, index: Int)
}

// MARK: -
// MARK: Make required functions optional within the 'extension' of 'FacebookPostCellDelegate'

extension FacebookPostCellDelegate {
    func didTapFacebookPostCell(view: UIView, data: FacebookPost, index: Int) {}
}

class FacebookPostCell: UIView {
    
    // MARK: -
    // MARK: Delegate
    
    var delegate: FacebookPostCellDelegate?
    
    // MARK: -
    // MARK: Data and Index
    
    var data: FacebookPost?
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
        backgroundColor = #colorLiteral(red: 0.8392156863, green: 0.1882352941, blue: 0.1921568627, alpha: 1)
    }
    
    // MARK: -
    // MARK: Views
    
    // MARK: -
    // MARK: Handlers
    
    @objc func handleFacebookPostCellTapped() {
        guard let delegate = delegate, let data = data, let index = index else { return }
        delegate.didTapFacebookPostCell(view: self, data: data, index: index)
    }
    
    // MARK: -
    // MARK: Populate View with Data
    
    func populate(view: UIView, data: FacebookPost, index: Int) {
        self.data = data
        self.index = index
    }
    
}
