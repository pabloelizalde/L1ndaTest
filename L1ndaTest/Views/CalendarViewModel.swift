//
//  CalendarViewModel.swift
//  L1ndaTest
//
//  Created by Pablo Elizalde Carvajal on 18/08/2017.
//  Copyright © 2017 Pelizcar. All rights reserved.
//

import Foundation
import Unbox
import RxSwift

struct CalendarViewModel {

	// MARK: - public properties
	let calendar = Variable<[DayModel]?>(nil)
	
	init() {
	}

	// MARK: - Public methods
	func getCalendarData() {
		if let path = Bundle.main.path(forResource: "data", ofType: "json") {
			do {
				let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
				do {
					let calenddr: [DayModel] = try unbox(data: data)
					self.calendar.value = calenddr
				} catch {
					dump("Unbox error")
				}
			} catch let error {
				dump(error.localizedDescription)
			}
		}
	}

}
