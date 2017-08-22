//
//  DataManager.swift
//  L1ndaTest
//
//  Created by Pablo Elizalde Carvajal on 21/08/2017.
//  Copyright © 2017 Pelizcar. All rights reserved.
//

import Foundation

final class DataManager {
	
	//This prevents others from using the default '()' initializer for this class.
	private init() { }
	
	// MARK: - Shared Instance
	static let shared = DataManager()
	
	private var calendar: [DayModel]?
	
	// MARK: - Public methods
	func saveCalendarInfo(calendar: [DayModel]) {
		self.calendar = calendar
	}
	
	func getCelebrationsFrom(date: String) -> [CelebrationModel]? {
		return calendar?
			.filter { dayModel in
				return dayModel.date == date
			}
			.first
			.map { $0.celebrations }
	}
	
}
