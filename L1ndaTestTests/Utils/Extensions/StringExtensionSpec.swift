//
//  StringExtensionSpec.swift
//  L1ndaTest
//
//  Created by Pablo Elizalde Carvajal on 22/08/2017.
//  Copyright © 2017 Pelizcar. All rights reserved.
//

import Quick
import Nimble
@testable import L1ndaTest

class StringExtensionSpec: QuickSpec {
	override func spec() {
		
		let dayString = "monday"
		let dateString = "2017-11-11"
		let wrondDateString = "not a date"
		let red = "red"
		let green = "green"
		let white = "white"
		let purple = "purple"
		
		describe("Test StringExtensions") {
			
			it("capitalized string method") {
				let capitalizedDay = dayString.capitalizedFirstLetter()
				expect(capitalizedDay).to(equal("Monday"))
				
				let wrongCapilizedDay = "".capitalizedFirstLetter()
				expect(wrongCapilizedDay).to(equal(""))
			}
			
			it("substring method") {
				let substring = dayString.substring(number: 3)
				expect(substring).to(equal("mon"))
			}
			
			it("get date from string") {
				let date = dateString.getDateFromString()
				expect(date).toNot(beNil())
				
				let wrongDate = wrondDateString.getDateFromString()
				expect(wrongDate).to(beNil())
			}
			
			it("substring method") {
				let substring = dayString.substring(number: 3)
				expect(substring).to(equal("mon"))
			}
			
			it("get day from date string") {
				let day = dateString.getDayFromDateString()
				expect(day).to(equal("11"))
				
				let wrongDay = wrondDateString.getDayFromDateString()
				expect(wrongDay).to(equal(""))
			}
			
			it("get month from date string") {
				let month = dateString.getMonthFromDateString()
				expect(month).to(equal("November"))
				
				let wrongMonth = wrondDateString.getMonthFromDateString()
				expect(wrongMonth).to(equal(""))
			}
			
			it("get color from string") {
				let redColor = red.getColorFromString()
				expect(redColor).to(equal(UIColor.red))
				
				let greenColor = green.getColorFromString()
				expect(greenColor).to(equal(UIColor.green))
				
				let whiteColor = white.getColorFromString()
				expect(whiteColor).to(equal(UIColor.white))
				
				let purpleColor = purple.getColorFromString()
				expect(purpleColor).to(equal(UIColor.purple))
			}
		}
	}
}
