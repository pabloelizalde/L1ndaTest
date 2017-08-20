//
//  Route.swift
//  L1ndaTest
//
//  Created by Pablo Elizalde Carvajal on 20/08/2017.
//  Copyright © 2017 Pelizcar. All rights reserved.
//

import UIKit

enum Route: String {
	case calendar
	
	func getViewController() -> UIViewController {
		switch self {
		case .calendar:
			return CalendarViewController(viewModel: CalendarViewModel())
		}
	}
}
