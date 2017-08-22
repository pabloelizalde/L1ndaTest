//
//  ViewController.swift
//  L1ndaTest
//
//  Created by Pablo Elizalde Carvajal on 18/08/2017.
//  Copyright © 2017 Pelizcar. All rights reserved.
//

import UIKit
import RxSwift
import Reusable

final class CalendarViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, Viewable {

	private let loader: UIActivityIndicatorView!
	private let collectionView: UICollectionView!
	private let views: [UIView]
	
	private let disposeBag = DisposeBag()
	
	private let viewModel: CalendarViewModel

	// MARK: - Lifecycle methods
	init(viewModel: CalendarViewModel) {
		self.viewModel = viewModel
		self.loader = UIActivityIndicatorView()
		let layout = UICollectionViewFlowLayout()
		layout.sectionInset = UIEdgeInsets(top: 0, left: Margins.lateral, bottom: 0, right: Margins.lateral)
		layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 2 * Margins.lateral, height: 80)
		self.collectionView = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: layout)
		self.views = [collectionView, loader]
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

		loader.startAnimating()
		DispatchQueue.background(delay: 1.0, completion: {
			self.viewModel.getCalendarData()
		})
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	func setupViews() {
		for view in views { self.view.addSubview(view) }
		
		view.backgroundColor = .lightGray
		
		collectionView.dataSource = self
		collectionView.delegate = self
		collectionView.register(cellType: DayCollectionViewCell.self)
		collectionView.backgroundColor = .lightGray
		loader.startAnimating()
	}
	
	func setupContstraints() {
		for view in views { view.translatesAutoresizingMaskIntoConstraints = false }
		
		NSLayoutConstraint.activate([
			collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: Margins.top),
			collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			collectionView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor),
			
			loader.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			loader.centerYAnchor.constraint(equalTo: view.centerYAnchor)
		])
	}
	
	func setupBindings() {
		
		viewModel.calendar
			.asObservable()
			.subscribe { [weak self] _ in
				self?.collectionView.reloadData()
			}
			.disposed(by: disposeBag)
		
		//TODO: Bind directly the property of the loader
		viewModel.calendar
			.asObservable()
			.subscribe(onNext: { [weak self] calendar in
				self?.loader.isHidden = (calendar != nil) ? true : false
			})
			.disposed(by: disposeBag)
	}
	
	// MARK: - UICollectionView
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let dayModel = viewModel.calendar.value?[indexPath.row]
		if let dayString = dayModel?.date {
			ApplicationCoordinator.open(.celebrations(date: dayString))
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return viewModel.calendar.value?.count ?? 0
	}
	
	public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(for: indexPath) as DayCollectionViewCell
		let dayModel = viewModel.calendar.value?[indexPath.row]
		if let dayString = dayModel?.date, let weekdayString = dayModel?.weekday, let celebrations = dayModel?.celebrations {
			cell.set(date: dayString, weekday: weekdayString, celebrations: celebrations.count)
		}
		
		return cell
	}
}
