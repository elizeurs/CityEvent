//
//  EventController.swift
//  CityEvent
//
//  Created by Elizeu RS on 23/07/22.
//

import UIKit
import SDWebImage

private let reuseIdentifier = "EventCell"

class EventController: UICollectionViewController {
  
  // MARK: - Properties
  
  // MARK: - Init
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureViewComponents()
    fetchCityEvents()
    
  }
  
  // MARK: - Selectors
  
  // MARK: - API
  var events = [Event]()

  
    func fetchCityEvents() {
      Service.shared.fetchEvents { (events, err) in
        
        if let err = err {
          print("Failed to fetch apps:", err)
          return
        }
        
        self.events = events
        DispatchQueue.main.async {
          self.collectionView.reloadData()
        }
      }
    }

  // MARK: - Helper Functions
  
  func configureViewComponents() {
    collectionView.backgroundColor = .white
    navigationController?.navigationBar.prefersLargeTitles = false
    
    navigationController?.navigationBar.backgroundColor = .white
    navigationController?.navigationBar.barStyle = .default
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationItem.title = "CityEvents"
    
    collectionView.register(EventCell.self, forCellWithReuseIdentifier: reuseIdentifier)

  }
}

// MARK: - UICollectionViewDataSource/Delegate

extension EventController {
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return events.count
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! EventCell
//    cell.backgroundColor = .blue
    
    cell.event = self.events[indexPath.item]
    
//    let event = events[indexPath.item]
//    cell.nameLabel.text = event.title ?? ""
//    cell.imageView.sd_setImage(with: URL(string: event.image ?? ""), placeholderImage: UIImage(named: "event.png"))
        
    return cell
  }
  
  override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    let controller = EventInfoController()
    controller.event = events[indexPath.row]
    navigationController?.pushViewController(controller, animated: true)
  }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension EventController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = (view.frame.width - 16)
    return CGSize(width: width, height: width)
  }
}

