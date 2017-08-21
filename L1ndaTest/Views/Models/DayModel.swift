//
//  DayModel.swift
//  L1ndaTest
//
//  Created by Pablo Elizalde Carvajal on 18/08/2017.
//  Copyright © 2017 Pelizcar. All rights reserved.
//

import Foundation
import Unbox

struct DayModel: Unboxable {

	let date: String
	let season: String
	let seasonWeek: Int
	let celebrations: [CelebrationModel]
	let weekday: String

	init(unboxer: Unboxer) throws {
		date = try unboxer.unbox(key: "date")
		season = try unboxer.unbox(key: "season")
		seasonWeek = try unboxer.unbox(key: "season_week")
		celebrations = try unboxer.unbox(key: "celebrations")
		weekday = try unboxer.unbox(key: "weekday")
	}
}
