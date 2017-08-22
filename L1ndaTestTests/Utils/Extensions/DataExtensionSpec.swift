//
//  DataExtensionSpec.swift
//  L1ndaTest
//
//  Created by Pablo Elizalde Carvajal on 22/08/2017.
//  Copyright © 2017 Pelizcar. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import L1ndaTest

class DataExtensionSpec: QuickSpec {
	override func spec() {
		
		let fileName = "data"
		let invalidFileName = "invalid"
		let fileType = "json"
		
		describe("Test DataExtensions") {
			
			it("Get data from local file") {
				let dataFromValidResource = Data.fromResource(fileName, ofType: fileType)
				expect(dataFromValidResource).toNot(beNil())
				expect(dataFromValidResource.count).to(beGreaterThan(0))
				
				let dataFromInvalidResource = Data.fromResource(invalidFileName, ofType: fileType)
				expect(dataFromInvalidResource).toNot(beNil())
				expect(dataFromInvalidResource.count).to(equal(0))
			}
		}
	}
}
