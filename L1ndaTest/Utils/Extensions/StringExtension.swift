//
//  StringExtension.swift
//  L1ndaTest
//
//  Created by Pablo Elizalde Carvajal on 21/08/2017.
//  Copyright © 2017 Pelizcar. All rights reserved.
//

import Foundation
import UIKit

extension String {

	func capitalizedFirstLetter() -> String {
		guard let firstLetter = self.characters.first else {
			return self
		}
		return String(describing: firstLetter).capitalized + String(self.characters.dropFirst())
	}
	
	func substring(number: Int) -> String {
		let index = self.index(self.startIndex, offsetBy: number)
		return self.substring(to: index)
	}
	
	func getDateFromString() -> Date? {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy-MM-dd"

		return dateFormatter.date(from: self)
	}
	
	func getDayFromDateString() -> String {
		guard let date = getDateFromString() else {
			return ""
		}
		return String(Calendar.current.component(.day, from: date))
	}
	
	func getMonthFromDateString() -> String {
		guard let date = getDateFromString() else {
			return ""
		}
		let monthNumber = Calendar.current.component(.month, from: date) - 1
		return String(Calendar.current.monthSymbols[monthNumber])
	}
	
	func getColorFromString() -> UIColor {
		switch self {
		case "green":
			return UIColor.green
		case "white":
			return UIColor.white
		case "red":
			return UIColor.red
		default:
			return UIColor.purple
		}
	}
	
	var utf8Encoded: Data {
		// swiftlint:disable force_unwrapping
		return self.data(using: .utf8)!
		// swiftlint:enable force_unwrapping
	}
}
