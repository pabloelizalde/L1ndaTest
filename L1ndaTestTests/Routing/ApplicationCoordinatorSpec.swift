//
//  ApplicationCoordinatorSpec.swift
//  L1ndaTest
//
//  Created by Pablo Elizalde Carvajal on 22/08/2017.
//  Copyright © 2017 Pelizcar. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import L1ndaTest

class ApplicationCoordinatorSpec: QuickSpec {
	override func spec() {
		
		let appCoordinator = ApplicationCoordinator(window: UIWindow())
		appCoordinator.start()
		
		describe("Test Application Coordinator") {
			
			it("should open an invalid viewController") {
				
				let invalidVC = appCoordinator.open(routeURI: URL(string: "invalidURI")!, animated: false)
				expect(invalidVC).to(equal(false))
			}
			
			it("should open a valid viewController") {
				let calendarViewController = appCoordinator.open(routeURI: URL(viewURI: Route.calendar.rawValue), animated: false)
				let invalidVC = appCoordinator.open(routeURI: URL(viewURI: "invalidURI"), animated: false)
				
				expect(calendarViewController).to(equal(true))
				expect(invalidVC).to(equal(false))
			}
			
			it("should open a celebrations view controller given a date string") {
				let openedURL = ApplicationCoordinator.open(RouteURI.celebrations(date: "2017-11-11"))
				expect(openedURL).notTo(beNil())
				expect(openedURL?.path).to(equal("/2017-11-11"))
				expect(openedURL?.host).to(equal("celebrations"))
			}
		}
	}
}
