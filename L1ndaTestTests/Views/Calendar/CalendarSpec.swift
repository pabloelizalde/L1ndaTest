//
//  CalendarSpec.swift
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

class CalendarSpec: QuickSpec {
	override func spec() {
		
		describe("Test Calendar Feature and models") {
			
			let viewModel = CalendarViewModel()
			let viewController = CalendarViewController(viewModel: viewModel)
			
			let subviews = viewController.view.subviews
			
			it("should have \(subviews.count) subviews") {
				
				expect(subviews.count).to(equal(2))
				expect(subviews[0]).to(beAKindOf(UICollectionView.self))
				expect(subviews[1]).to(beAKindOf(UIActivityIndicatorView.self))
			}
			
			//TODO: Included this, due to the delay we introduced in the view controller. Improve implementation with ToEventually()
			let timeout = TimeInterval(2)
			sleep(UInt32(timeout))
			
			let loader = subviews[1] as? UIActivityIndicatorView
			it("collectionview should be hidden") {
				expect(loader?.isHidden).toEventually(beTrue())
			}
			
			let collectionView = subviews[0] as? UICollectionView
			it("collectionview should have 1 sections with 61 cells") {
				let sections = collectionView?.numberOfSections
				expect(sections).to(equal(1))
				
				let cells = collectionView?.numberOfItems(inSection: 0)
				expect(cells).to(equal(61))
			}
			
			let cell = DayCollectionViewCell()
			
			it("test collection view cell") {
				let calendarFirstDay = viewModel.calendar.value?.first
				cell.set(date: (calendarFirstDay?.date)!, weekday: (calendarFirstDay?.weekday)!, celebrations: (calendarFirstDay?.celebrations.count)!)
				let cellSubviews = cell.subviews
				
				expect(cellSubviews.count).to(equal(1))
			}
			
			it("view model test") {
				expect(viewModel.calendar.value?.count).to(equal(61))
			}
			
			it("test models") {
				let calendarFirstDay = viewModel.calendar.value?.first
				expect(calendarFirstDay).toNot(beNil())
				
				expect(calendarFirstDay?.date).to(equal("2017-11-01"))
				expect(calendarFirstDay?.season).to(equal("ordinary"))
				expect(calendarFirstDay?.seasonWeek).to(equal(31))
				expect(calendarFirstDay?.weekday).to(equal("wednesday"))
				
				let celebrartions = calendarFirstDay?.celebrations
				expect(celebrartions).toNot(beNil())
				expect(celebrartions?.count).to(equal(1))
				
				let celebration = celebrartions?.first
				expect(celebration?.title).to(equal("All Saints"))
				expect(celebration?.colour).to(equal("white"))
				expect(celebration?.rank).to(equal("solemnity"))
				expect(celebration?.rankNum).to(equal(1.3))
			}
		}
	}
}
