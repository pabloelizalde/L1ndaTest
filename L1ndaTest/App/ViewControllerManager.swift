//
//  ViewControllerManager.swift
//  L1ndaTest
//
//  Created by Pablo Elizalde Carvajal on 20/08/2017.
//  Copyright © 2017 Pelizcar. All rights reserved.
//

import Foundation
import UIKit

struct ViewControllerManager {
	
	static func getViewController(viewURI: URL) -> UIViewController? {
		if let host = viewURI.host, let route = Route(rawValue: host) {
			return route.getViewController()
		}
		return nil
	}
}
