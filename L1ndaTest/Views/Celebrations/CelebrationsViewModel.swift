//
//  CelebrationsViewModel.swift
//  L1ndaTest
//
//  Created by Pablo Elizalde Carvajal on 21/08/2017.
//  Copyright © 2017 Pelizcar. All rights reserved.
//

import Foundation
import RxSwift

struct CelebrationsViewModel {

	let celebrations = Variable<[CelebrationModel]?>(nil)
	
	init(date: String) {
		getCelebrationsFrom(date: date)
	}
	
	private func getCelebrationsFrom(date: String) {
		celebrations.value = DataManager.shared.getCelebrationsFrom(date: date)
	}
}
