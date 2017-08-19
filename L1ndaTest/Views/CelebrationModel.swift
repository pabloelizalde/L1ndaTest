//
//  CelebrationModel.swift
//  L1ndaTest
//
//  Created by Pablo Elizalde Carvajal on 18/08/2017.
//  Copyright © 2017 Pelizcar. All rights reserved.
//

import Foundation
import Unbox

struct CelebrationModel: Unboxable {
	
	let title: String
	let colour: String
	let rank: String
	let rank_num: Double
	
	init(unboxer: Unboxer) throws {
		title = try unboxer.unbox(key: "title")
		colour = try unboxer.unbox(key: "colour")
		rank = try unboxer.unbox(key: "rank")
		rank_num = try unboxer.unbox(key: "rank_num")
	}
}
