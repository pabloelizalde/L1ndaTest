//
//  ViewController.swift
//  L1ndaTest
//
//  Created by Pablo Elizalde Carvajal on 18/08/2017.
//  Copyright © 2017 Pelizcar. All rights reserved.
//

import UIKit
import Unbox

class ViewController: UIViewController {

	private let viewModel = CalendarViewModel()

	override func viewDidLoad() {
		super.viewDidLoad()

		viewModel.getCalendarData()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
}
