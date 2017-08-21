//
//  Route.swift
//  L1ndaTest
//
//  Created by Pablo Elizalde Carvajal on 20/08/2017.
//  Copyright © 2017 Pelizcar. All rights reserved.
//

import UIKit

/// Return
enum RouteURI {
	case celebrations(date: String)
}

enum Route: String {
	case calendar
	case celebrations
	
	func getViewController(pathComponents: [String]) -> UIViewController {
		switch self {
		case .calendar:
			return CalendarViewController(viewModel: CalendarViewModel())
		case .celebrations:
			return CelebrationsViewController(viewModel: CelebrationsViewModel(date: pathComponents[1]))
		}
	}
}
