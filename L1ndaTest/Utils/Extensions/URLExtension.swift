//
//  URLExtension.swift
//  L1ndaTest
//
//  Created by Pablo Elizalde Carvajal on 20/08/2017.
//  Copyright © 2017 Pelizcar. All rights reserved.
//

import Foundation

/// MARK: - Basic Contructors for URL
extension URL {
	init(viewURI: String) {
		// swiftlint:disable force_unwrapping
		self.init(string: "l1ndatest://" + viewURI)!
		// swiftlint:enable force_unwrapping
	}
	
	init(string: String) {
		// swiftlint:disable force_unwrapping
		self.init(string: string)!
		// swiftlint:enable force_unwrapping
	}
}

/// MARK: - URLComponents custom Init
extension URLComponents {
	
	init(path: String) {
		self.init()
		
		self.path = path
	}
}

/// MARK: - URL Builder extensions based on
/// https://github.com/anjlab/SafeURL/blob/master/Pod/Classes/SwiftURL.swift#L121
extension URL {
	
	func build(_ components: URLComponents) -> URL? {
		return components.url(relativeTo: self)?.absoluteURL
	}
}
