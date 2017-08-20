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

class ViewController: UIViewController, UICollectionViewDataSource {

	@IBOutlet private weak var loader: UIActivityIndicatorView!
	@IBOutlet private weak var collectionView: UICollectionView!
	
	private let disposeBag = DisposeBag()
	
	private let viewModel = CalendarViewModel()

	override func viewDidLoad() {
		super.viewDidLoad()

		collectionView.dataSource = self
		loader.startAnimating()
		
		setBindings()
		viewModel.getCalendarData()

	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	func setBindings() {
		
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
