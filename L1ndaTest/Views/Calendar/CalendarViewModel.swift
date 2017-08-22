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
	
	// MARK: - Public methods
	func getCalendarData() {
		let data = Data.fromResource("data", ofType: "json")
		do {
			let calendarData: [DayModel] = try unbox(data: data)
			self.calendar.value = calendarData
			DataManager.shared.saveCalendarInfo(calendar: calendarData)
		} catch {
			dump("Unbox error")
		}
	}
}
