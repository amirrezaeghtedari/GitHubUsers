//
//  FollowersComposer.swift
//  MyGHFollowers
//
//  Created by Amirreza Eghtedari on 13.05.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

class FollowersViewControllerComposer {

	static func makeModule() -> FollowersViewController {
		
		let stringAnalyzer = StringAnalyzer()
		let followersProvider = FollowerNetworkProvider(session: NetworkManager.shared.session, stringAnalyzer: stringAnalyzer)
		let interactor = FollowersInteractor(followersProvider: followersProvider)
		let presenter = FollowersPresenter()
		let loadingViewProvider = LoadingViewProvider()
		
		let viewController = FollowersViewController(followersInteractor: interactor,
													 loadingViewProvider: loadingViewProvider)
		interactor.delegate = presenter
		presenter.delegate = viewController
		
		return viewController
	}
}

