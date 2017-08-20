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
