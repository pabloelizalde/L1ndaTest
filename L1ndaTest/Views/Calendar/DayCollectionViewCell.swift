//
//  DayCollectionViewCell.swift
//  L1ndaTest
//
//  Created by Pablo Elizalde Carvajal on 20/08/2017.
//  Copyright © 2017 Pelizcar. All rights reserved.
//

import UIKit
import Reusable

class DayCollectionViewCell: UICollectionViewCell, Reusable {
	
	private let dateLabel: UILabel
	private let views: [UIView]
	
	// MARK: - Lifecycle Methods
	override init(frame: CGRect) {
		self.dateLabel = UILabel()
		self.views = [dateLabel]
		super.init(frame: frame)
		
		setupViews()
		styleViews()
		setupConstraints()
	}
	
	@available(*, unavailable) required init?(coder aDecoder: NSCoder) {
		fatalError("this is a xibless class utilizing for autolayout, use init() instead")
	}
	
	// MARK: - Private Methods
	private func setupConstraints() {
		for view in views { view.translatesAutoresizingMaskIntoConstraints = false }
		
		NSLayoutConstraint.activate([
			dateLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
			dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Margins.lateral),
			dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Margins.lateral)
		])
	}
	
	func setupViews() {
		for view in views { contentView.addSubview(view) }
	}
	
	func styleViews() {
		backgroundColor = .white	
	}
	
	// MARK: - Public Methods
	func set(date: String, weekday: String, celebrations: Int) {
		//TODO: set attributed text with style from local file
		dateLabel.text = "\(weekday.capitalizedFirstLetter().substring(number: 3)), \(date.getDayFromDateString()) " +
			"\(date.getMontFromDateString().substring(number: 3)) Celebrations: \(celebrations)"
	}

}
