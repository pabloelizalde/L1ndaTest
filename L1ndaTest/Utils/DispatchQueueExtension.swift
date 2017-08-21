//
//  DispatchQueueExtension.swift
//  L1ndaTest
//
//  Created by Pablo Elizalde Carvajal on 21/08/2017.
//  Copyright © 2017 Pelizcar. All rights reserved.
//

import Foundation

extension DispatchQueue {
	
	static func background(delay: Double = 0.0, background: (() -> Void)? = nil, completion: (() -> Void)? = nil) {
		DispatchQueue.global(qos: .background).async {
			background?()
			if let completion = completion {
				DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: {
					completion()
				})
			}
		}
	}	
}
