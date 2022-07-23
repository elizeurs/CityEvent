//
//  EventController.swift
//  CityEvent
//
//  Created by Elizeu RS on 23/07/22.
//

import UIKit

private let reuseIdentifier = "EventCell"

class EventController: UICollectionViewController {
  
  // MARK: - Properties
  
  // MARK: - Init
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureViewComponents()
    
  }
  
  // MARK: - Selectors
  
  // MARK: - Helper Functions
  
  func configureViewComponents() {
    collectionView.backgroundColor = .systemGray6
    
    navigationController?.navigationBar.backgroundColor = .systemGray6
    navigationController?.navigationBar.barStyle = .default
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationItem.title = "CityEvents"
    
    collectionView.register(EventCell.self, forCellWithReuseIdentifier: reuseIdentifier)

  }
}

extension EventController {
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 6
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! EventCell
    cell.backgroundColor = .blue
    return cell
  }
}

extension EventController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 32, left: 16, bottom: 32, right: 16)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = (view.frame.width - 16)
    return CGSize(width: width, height: width)
  }
}

