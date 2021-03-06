//
//  FollowersInteractorDelegate.swift
//  MyGHFollowers
//
//  Created by Amirreza Eghtedari on 13.05.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

protocol FollowersInteractorDelegate: class {
	
	func interactorDidGet(_: FollowersInteractorInput, result: Result<[Follower], FollowerNetworkError>)
	
	func interactorDidGetNext(_: FollowersInteractorInput, result: Result<[Follower], FollowerNetworkError>)
	
	func interactorDidGetAvatar(_: FollowersInteractorInput, follower: Follower, avatar: Data)
	
	func interactoreDidAddUserToFavories(_: FollowersInteractorInput, username: String, error: Error?)
}

