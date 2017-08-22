//
//  DataExtension.swift
//  L1ndaTest
//
//  Created by Pablo Elizalde Carvajal on 22/08/2017.
//  Copyright © 2017 Pelizcar. All rights reserved.
//

import Foundation

/// MARK: - Data Extension for file opening
extension Data {
	
	static func fromResource(_ resource: String, ofType type: String) -> Data {
		let pathToContent = Bundle.main.path(forResource: resource, ofType: type)
		do {
			guard let path = pathToContent else {
				return Data()
			}
			let content = try String(contentsOfFile: path)
			return content.utf8Encoded
		} catch {
			return Data()
		}
	}
}
