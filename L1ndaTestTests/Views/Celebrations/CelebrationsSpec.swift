//
//  CelebrationsSpec.swift
//  L1ndaTest
//
//  Created by Pablo Elizalde Carvajal on 22/08/2017.
//  Copyright © 2017 Pelizcar. All rights reserved.
//

import Foundation
import Quick
import Nimble
import RxSwift
@testable import L1ndaTest

class CelebrationsSpec: QuickSpec {
	override func spec() {
		
		describe("Test Calendar Feature and models") {
			
			let viewModel = CelebrationsViewModel(date: "2017-11-11")
			let viewController = CelebrationsViewController(viewModel: viewModel)
			
			let subviews = viewController.view.subviews
			
			it("should have \(subviews.count) subviews") {
				
				expect(subviews.count).to(equal(1))
				expect(subviews[0]).to(beAKindOf(UIStackView.self))
			}
			
			//TODO: Included this, due to the delay we introduced in the view controller. Improve implementation with ToEventually()
//			let timeout = TimeInterval(2)
//			sleep(UInt32(timeout))
//			
//			let loader = subviews[1] as? UIActivityIndicatorView
//			it("collectionview should be hidden") {
//				expect(loader?.isHidden).toEventually(beTrue())
//			}
//			
//			let collectionView = subviews[0] as? UICollectionView
//			it("collectionview should have 1 sections with 61 cells") {
//				let sections = collectionView?.numberOfSections
//				expect(sections).to(equal(1))
//				
//				let cells = collectionView?.numberOfItems(inSection: 0)
//				expect(cells).to(equal(61))
//			}
		}
	}
}
