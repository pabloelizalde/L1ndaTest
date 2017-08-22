//
//  CelebrationsViewController.swift
//  L1ndaTest
//
//  Created by Pablo Elizalde Carvajal on 21/08/2017.
//  Copyright © 2017 Pelizcar. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

final class CelebrationsViewController: UIViewController, Viewable {
	
	static let labelHeight: CGFloat = 64
	
	private let stackView: UIStackView
	private let views: [UIView]
	
	private let disposeBag = DisposeBag()
	
	private let viewModel: CelebrationsViewModel
	
	// MARK: - Lifecycle methods
	init(viewModel: CelebrationsViewModel) {
		self.viewModel = viewModel
		self.stackView = UIStackView()
		self.views = [stackView]
		super.init(nibName: nil, bundle: nil)
		
		setupViews()
		setupContstraints()
		setupBindings()
	}

	@available(*, unavailable) required init?(coder aDecoder: NSCoder) {
		fatalError("this is a xibless class utilizing for autolayout, use init() instead")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	func setupViews() {
		for view in views { self.view.addSubview(view) }
		
		stackView.axis = .vertical
		stackView.layoutMargins = UIEdgeInsets(top: Margins.top, left: Margins.lateral, bottom: 0, right: Margins.lateral)
		stackView.isLayoutMarginsRelativeArrangement = true
		stackView.spacing = Margins.spacing
		self.view.backgroundColor = .lightGray
		
		guard let celebrations = viewModel.celebrations.value else {
			return
		}
		for celebration in celebrations {
			let label = UILabel()
			label.text = celebration.title != "" ? "\(celebration.title), \(celebration.rank)" : celebration.rank
			label.backgroundColor = celebration.colour.getColorFromString()
			stackView.addArrangedSubview(label)
		}
	}
	
	func setupContstraints() {
		for view in views { view.translatesAutoresizingMaskIntoConstraints = false }
		
		NSLayoutConstraint.activate([
			stackView.widthAnchor.constraint(equalTo: view.widthAnchor)
		])
		
		for subview in stackView.subviews {
			NSLayoutConstraint.activate([
				subview.heightAnchor.constraint(equalToConstant: CelebrationsViewController.labelHeight)
			])
		}
	}
	
	func setupBindings() {
	}
}
