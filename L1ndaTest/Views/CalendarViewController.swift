//
//  ViewController.swift
//  L1ndaTest
//
//  Created by Pablo Elizalde Carvajal on 18/08/2017.
//  Copyright © 2017 Pelizcar. All rights reserved.
//

import UIKit
import Unbox
import RxSwift

class CalendarViewController: UIViewController, UICollectionViewDataSource {

	private let loader: UIActivityIndicatorView!
	private let collectionView: UICollectionView!
	private let views: [UIView]
	
	private let disposeBag = DisposeBag()
	
	fileprivate let viewModel: CalendarViewModel

	// MARK: - Lifecycle methods
	init(viewModel: CalendarViewModel) {
		self.viewModel = viewModel
		self.loader = UIActivityIndicatorView()
		self.collectionView = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: UICollectionViewFlowLayout())
		self.views = [loader, collectionView]
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

		collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
		viewModel.getCalendarData()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	func setupViews() {
		for view in views { self.view.addSubview(view) }
		
		collectionView.dataSource = self
		loader.startAnimating()
	}
	
	func setupContstraints() {
		
	}
	
	func setupBindings() {
		
		viewModel.calendar
			.asObservable()
			.subscribe { [weak self] _ in
				self?.collectionView.reloadData()
			}
			.disposed(by: disposeBag)
	}
	
	// MARK: - UICollectionView
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return viewModel.calendar.value?.count ?? 0
	}
	
	public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
		cell.backgroundColor = .red
		
		return cell
	}
}
