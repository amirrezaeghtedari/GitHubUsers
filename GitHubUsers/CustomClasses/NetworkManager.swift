//
//  NetwrokManager.swift
//  MyGHFollowers
//
//  Created by Amirreza Eghtedari on 06.06.20.
//  Copyright © 2020 Amirreza Eghtedari. All rights reserved.
//

import Foundation

class NetworkManager {
	
	static let baseUrl = "https://api.github.com/users/"
	static let followersNumberPerPage = 100
	
	let session: URLSession
	
	private init() {
		let config = URLSessionConfiguration.default
		session = URLSession(configuration: config)
	}
	
	static let shared = NetworkManager()
}
 
