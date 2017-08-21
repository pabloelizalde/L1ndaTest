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

struct CalendarViewModel: L1ndaViewModel {

	// MARK: - public properties
	let calendar = Variable<[DayModel]?>(nil)
	
	// MARK: - Public methods
	func getCalendarData() {
		if let path = Bundle.main.path(forResource: "data", ofType: "json") {
			do {
				let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
				do {
					let calendarData: [DayModel] = try unbox(data: data)
					self.calendar.value = calendarData
					DataManager.shared.saveCalendarInfo(calendar: calendarData)
				} catch {
					dump("Unbox error")
				}
			} catch let error {
				dump(error.localizedDescription)
			}
		}
	}

}
