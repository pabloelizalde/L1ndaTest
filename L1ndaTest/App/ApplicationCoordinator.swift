//
//  ApplicationCoordinator.swift
//  L1ndaTest
//
//  Created by Pablo Elizalde Carvajal on 20/08/2017.
//  Copyright © 2017 Pelizcar. All rights reserved.
//

import Foundation
import UIKit

final class ApplicationCoordinator {
	
	private let window: UIWindow
	private let rootViewController: UINavigationController

	// MARK: - Lifecycle methods
	init(window: UIWindow) {
		self.window = window
		self.rootViewController = UINavigationController()
		self.rootViewController.navigationBar.isHidden = true
	}
	
	// MARK: - Public methods
	func start() {
		window.rootViewController = rootViewController
		window.makeKeyAndVisible()
		
		UIApplication.shared.open(URL(viewURI: Route.calendar.rawValue))
	}
	
	@discardableResult func open(routeURI: URL, animated: Bool) -> Bool {
		guard let viewController = getViewController(routeURI) else {
			return false
		}
		prepareAndPush(viewController: viewController, animated: animated)
		return true
	}
	
	// MARK: - Private methods
	private func getViewController(_ routeURI: URL) -> UIViewController? {
		if let viewController = ViewControllerManager.getViewController(viewURI: routeURI) {
			return viewController
		} else {
			return nil
		}
	}
	
	private func prepareAndPush(viewController: UIViewController, animated: Bool) {
		rootViewController.pushViewController(viewController, animated: animated)
	}
}
