//
//  NewsfeedController.swift
//  CollectionKitPro
//
//  Created by Alex Nagy on 20/12/2018.
//  Copyright © 2018 Alex Nagy. All rights reserved.
//

// MARK: -
// MARK: Notification Names

let notificationNameSetSection0DataSource = Notification.Name(rawValue: "setSection0DataSource")
let notificationNameSetSection1DataSource = Notification.Name(rawValue: "setSection1DataSource")

import CollectionKit

class NewsfeedController: CollectionViewController, InstaPostCellDelegate, InstaPostsHeaderCellDelegate, FacebookPostCellDelegate, FacebookPostsHeaderCellDelegate {
    
    // MARK: -
    // MARK: InstaPostCellDelegate
    
    func didTapInstaPostCell(view: UIView, data: InstaPost, index: Int) {
        
    }
    
    // MARK: InstaPostsHeaderCellDelegate
    
    func didTapInstaPostsHeaderCell(view: UIView, data: InstaUser, index: Int) {
        
    }
    
    // MARK: -
    // MARK: FacebookPostCellDelegate
    
    func didTapFacebookPostCell(view: UIView, data: FacebookPost, index: Int) {
        
    }
    
    // MARK: FacebookPostsHeaderCellDelegate
    
    func didTapFacebookPostsHeaderCell(view: UIView, data: FacebookUser, index: Int) {
        
    }
    
    // MARK: -
    // MARK: Cell Size
    lazy var section0CellWidth: CGFloat = (self.view.frame.width - NewsfeedControllerLayout.ComposedProvider.leftEdgeInset - NewsfeedControllerLayout.ComposedProvider.rigthEdgeInset - NewsfeedControllerLayout.Section0.CellProvider.leftEdgeInset - NewsfeedControllerLayout.Section0.CellProvider.rigthEdgeInset - (NewsfeedControllerLayout.Section0.numberOfCellsPerWidth - 1) * NewsfeedControllerLayout.Section0.CellProvider.spacing) / NewsfeedControllerLayout.Section0.numberOfCellsPerWidth
    lazy var section0CellHeight: CGFloat = section0CellWidth
    
    // MARK: -
    // MARK: Cell Size for Section 1
    lazy var section1CellWidth: CGFloat = (self.view.frame.width - NewsfeedControllerLayout.ComposedProvider.leftEdgeInset - NewsfeedControllerLayout.ComposedProvider.rigthEdgeInset - NewsfeedControllerLayout.Section1.CellProvider.leftEdgeInset - NewsfeedControllerLayout.Section1.CellProvider.rigthEdgeInset - (NewsfeedControllerLayout.Section1.numberOfCellsPerWidth - 1) * NewsfeedControllerLayout.Section1.CellProvider.spacing) / NewsfeedControllerLayout.Section1.numberOfCellsPerWidth
    lazy var section1CellHeight: CGFloat = section1CellWidth
    
    // MARK: -
    // MARK: Animator
    
    // Animator types:
    // -> Animator() // no animation
    // -> SimpleAnimator()
    // -> FadeAnimator()
    // -> ScaleAnimator()
    // -> WobbleAnimator() - you have to include pod 'CollectionKit/WobbleAnimator' subspec to your podfile
    let collectionViewAnimator: Animator = FadeAnimator()
    
    /*
     // you can assign an animator to the collectionView, providers, cells
    
     // apply to the entire CollectionView
     collectionView.animator = ScaleAnimator()
    
     // apply to a single section, will override CollectionView's animator
     provider.animator = FadeAnimator()
    
     // apply to a single view, will take priority over all other animators
     view.collectionAnimator = WobbleAnimator()
    */
    
    // MARK: -
    // MARK: Composed Provider Layout
    
    lazy var composedProviderInset = UIEdgeInsets(top: NewsfeedControllerLayout.ComposedProvider.topEdgeInset, left: NewsfeedControllerLayout.ComposedProvider.leftEdgeInset, bottom: NewsfeedControllerLayout.ComposedProvider.bottomEdgeInset, right: NewsfeedControllerLayout.ComposedProvider.rigthEdgeInset)
    lazy var composedProviderLayout = FlowLayout(spacing: NewsfeedControllerLayout.ComposedProvider.spacing, justifyContent: .start).inset(by: composedProviderInset)//.transposed()
    
    // MARK: -
    // MARK: Section 0 Provider Layout
    
    lazy var section0ProviderInset = UIEdgeInsets(top: NewsfeedControllerLayout.Section0.CellProvider.topEdgeInset, left: NewsfeedControllerLayout.Section0.CellProvider.leftEdgeInset, bottom: NewsfeedControllerLayout.Section0.CellProvider.bottomEdgeInset, right: NewsfeedControllerLayout.Section0.CellProvider.rigthEdgeInset)
    lazy var section0ProviderLayout = FlowLayout(spacing: NewsfeedControllerLayout.Section0.CellProvider.spacing, justifyContent: .start).inset(by: section0ProviderInset)//.transposed()
    
    // MARK: -
    // MARK: Section 1 Provider Layout
    
    lazy var section1ProviderInset = UIEdgeInsets(top: NewsfeedControllerLayout.Section1.CellProvider.topEdgeInset, left: NewsfeedControllerLayout.Section1.CellProvider.leftEdgeInset, bottom: NewsfeedControllerLayout.Section1.CellProvider.bottomEdgeInset, right: NewsfeedControllerLayout.Section1.CellProvider.rigthEdgeInset)
    lazy var section1ProviderLayout = FlowLayout(spacing: NewsfeedControllerLayout.Section1.CellProvider.spacing, justifyContent: .start).inset(by: section1ProviderInset)//.transposed()
    
    /*
     // you can assign a layout to any provider
     
     // Layout types:
     // -> FlowLayout()
     // -> OverlayLayout()
     // -> RowLayout()
     // -> SimpleLayout()
     // -> StickyLayout()
     // -> TransposeLayout()
     // -> WaterfallLayout()
     */
    
    // MARK: -
    // MARK: Header Composer Provider
    
    var headerComposer: ComposedHeaderProvider<InstaPostsHeaderCell>!
    
    // MARK: -
    // MARK: Section 0 Provider Elements
    
    lazy var section0DataSource = ArrayDataSource(data: InstaPostsManager.fetchInstaPosts() ?? []) // may be [] upon initialization because purchases may not be ready; see `setupNotificationCenterObservers` below
    lazy var section0ViewSource = ClosureViewSource(viewUpdater: { (view: InstaPostCell, data: InstaPost, index: Int) in
        view.delegate = self
        view.populate(view: view, data: data, index: index)
    })
    lazy var section0SizeSource = { (index: Int, data: InstaPost, collectionSize: CGSize) -> CGSize in
        return CGSize(width: self.section0CellWidth, height: self.section0CellHeight)
    }
    
    // MARK: -
    // MARK: Section 1 Provider Elements
    
    lazy var section1DataSource = ArrayDataSource(data: FacebookPostsManager.fetchFacebookPosts() ?? []) // may be [] upon initialization because purchases may not be ready; see `setupNotificationCenterObservers` below
    lazy var section1ViewSource = ClosureViewSource(viewUpdater: { (view: FacebookPostCell, data: FacebookPost, index: Int) in
        view.delegate = self
        view.populate(view: view, data: data, index: index)
    })
    lazy var section1SizeSource = { (index: Int, data: FacebookPost, collectionSize: CGSize) -> CGSize in
        return CGSize(width: self.section1CellWidth, height: self.section1CellHeight)
    }
    
    // MARK: -
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupController()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: -
    // MARK: Setup Controller
    
    fileprivate func setupController() {
        setupNotificationCenterObservers()
        setupViews()
        setupAnimator()
        setupProvider()
        setupNavigationItems()
    }
    
    fileprivate func setupNotificationCenterObservers() {
        NotificationCenter.default.addObserver(forName: notificationNameSetSection0DataSource, object: nil, queue: OperationQueue.main) { (notification) in
            self.section0DataSource.data = InstaPostsManager.fetchInstaPosts() ?? []
        }
        
        NotificationCenter.default.addObserver(forName: notificationNameSetSection1DataSource, object: nil, queue: OperationQueue.main) { (notification) in
            self.section1DataSource.data = FacebookPostsManager.fetchFacebookPosts() ?? []
        }
    }
    
    fileprivate func setupViews() {
        navigationItem.title = "Newsfeed"
    }
    
    fileprivate func setupAnimator() {
        collectionView.animator = collectionViewAnimator
    }
    
    fileprivate func setupProvider() {
        
        // create a provider for the section 0
        let section0Provider = BasicProvider(
            dataSource: section0DataSource,
            viewSource: section0ViewSource,
            sizeSource: section0SizeSource
        )
        
        // adding a layout
        section0Provider.layout = section0ProviderLayout
        
        // create a provider for the section 1
        let section1Provider = BasicProvider(
            dataSource: section1DataSource,
            viewSource: section1ViewSource,
            sizeSource: section1SizeSource
        )
        
        // adding a layout
        section1Provider.layout = section1ProviderLayout
        
        // create a sections provider with all the setcions
        let sectionsProvider = ComposedProvider(sections: [section0Provider, section1Provider])
        
        // create a composed header provider so we may add the `headerViewSource` and `headerSizeSource` and `sections`
        let composedProvider = ComposedHeaderProvider(
            headerViewSource: ClosureViewSource(
                viewUpdater: { (view: InstaPostsHeaderCell, viewData, index) in
                    view.delegate = self
                    guard let data = InstaPostsManager.fetchInstaUser() else { return }
                    view.populate(view: view, viewData: viewData, data: data, index: index)
            }),
            headerSizeSource: { (index, data, maxSize) -> CGSize in
                return CGSize(width: maxSize.width, height: NewsfeedControllerLayout.headerCellHeight)
        },
            sections: sectionsProvider.sections
        )
        
        // adding a layout
        composedProvider.layout = composedProviderLayout
        
        // so we may access the headerComposer outside of this scope if we need to; for example accessing its `isSticky` property
        headerComposer = composedProvider
        // set the `provider` to be newly created `composedProvider`
        provider = composedProvider
        
        // set the header to be sticky
        setHeaderSticky(false)
        
    }
    
    // MARK: -
    // MARK: Navigation
    
    lazy var barButtonItem1 = UIBarButtonItem(title: "Button", style: .done, target: self, action: #selector(barButtonItem1Tapped))
//    lazy var barButtinItem2 = UIBarButtonItem(image: UIImage(named: "changeImageNameHere"), style: .plain, target: self, action: #selector(barButtonItem2Tapped))
    
    fileprivate func setupNavigationItems() {
//        navigationItem.setLeftBarButton(barButtonItem1, animated: false)
        navigationItem.setRightBarButton(barButtonItem1, animated: false)
        
//        navigationItem.setLeftBarButtonItems([barButtonItem1, barButtonItem2], animated: false)
//        navigationItem.setRightBarButtonItems([barButtonItem1, barButtonItem2], animated: false)
        
//        navigationItem.hidesBackButton = true
        
//        self.navigationController?.navigationBar.topItem?.backBarButtonItem = barButtonItem1
    }
    
    // MARK: -
    // MARK: Handlers
    
    @objc fileprivate func barButtonItem1Tapped() {
        
    }
    
//    @objc fileprivate func barButtonItem2Tapped() {
//
//    }
    
    // MARK: -
    // MARK: Misc
    
    fileprivate func setHeaderSticky(_ value: Bool) {
        headerComposer.isSticky = value
    }
    
}
