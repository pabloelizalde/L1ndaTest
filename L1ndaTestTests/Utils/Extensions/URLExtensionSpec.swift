//
//  URLExtensionSpec.swift
//  L1ndaTest
//
//  Created by Pablo Elizalde Carvajal on 22/08/2017.
//  Copyright © 2017 Pelizcar. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import L1ndaTest

class URLExtensionSpec: QuickSpec {
	override func spec() {
		
		describe("Test URLExtensions") {
			
			it("should return the correct base url per environment") {
				let url = URL(viewURI: Route.calendar.rawValue)
				expect(url.scheme).to(equal("l1ndatest"))
			}
			
			it("should build an url given components") {
				let url = URL(viewURI: Route.celebrations.rawValue)
				let pathAddedUrl = url.build(URLComponents(path: "2017-11-11"))
				expect(pathAddedUrl?.absoluteString).to(contain(["celebrations","2017-11-11"]))
			}
		}
	}
}
