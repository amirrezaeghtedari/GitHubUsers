//
//  FollowersListViewController.swift
//  MyGHFollowers
//
//  Created by Amirreza Eghtedari on 29/12/1398AP.
//  Copyright © 1398 AP Amirreza Eghtedari. All rights reserved.
//

import UIKit

class FollowersViewController: UIViewController {
    
	var interactor: FolloweresInteractorInput!
	var collectionView: UICollectionView!
	
    var username: String! {
        didSet {
            title = username
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
		configCollectionView()
        configViewConroller()
		interactor.fetchFollowers(of: username, pageNumber: 1)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
//        navigationController?.isNavigationBarHidden = false
//        navigationController?.navigationBar.isHidden = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
	
	func configCollectionView() {
		collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: makeThreeColumnFlowLayout())
		view.addSubview(collectionView)
		collectionView.backgroundColor = UIColor.systemPink
		collectionView.register(FollowerCollectionViewCell.self, forCellWithReuseIdentifier: FollowerCollectionViewCell.reuseIdentifier)
	}
	
	func makeThreeColumnFlowLayout() -> UICollectionViewFlowLayout {
		
		let width 							= view.bounds.width
		let padding: CGFloat 				= 12
		let minimumItemSpacing: CGFloat 	= 10
		let availableWidth 					= width - (2 * padding + 2 * minimumItemSpacing)
		let itemWidth 						= availableWidth / 3
		
		let flowLayout 						= UICollectionViewFlowLayout()
		flowLayout.sectionInset 			= UIEdgeInsets(top: padding,
														   left: padding,
														   bottom: padding,
														   right: padding)
		flowLayout.itemSize 				= CGSize(width: itemWidth,
													 height: itemWidth + 40)
		
		return flowLayout
	}
	
	func configViewConroller() {
		view.backgroundColor = UIColor.secondarySystemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
	}
}

extension FollowersViewController: FollowersPresenterDelegate {
	
	func presenterDidGet(result: Result<[FollowerViewModel], FollowerError>) {
		switch result {
		case .failure(let follwerError):
			switch follwerError {
			case .invalidUsername:
				self.presentAEAlert(title: "Error", message: "Invalid user name. Try again.", buttonTitle: "OK")
			case .unableToComplete:
				self.presentAEAlert(title: "Error", message: "Unable to complete. Try again.", buttonTitle: "OK")
			}
		case .success(let followers):
			print(followers)
		}
	}
}
