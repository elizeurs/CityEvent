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
  
  
  
  
  
//  func fetchEvent(completionHandler: @escaping ([Event]) -> Void) {
//    let urlString = "http://5f5a8f24d44d640016169133.mockapi.io/api/events"
//    guard let url = URL(string: urlString) else { return }
//
//    // fetch data  from internet
//    URLSession.shared.dataTask(with: url) { (data, resp, err) in
//
//      if let err = err {
//        print("Failed to fetch events:", err)
//        return
//      }
//
//      // success
////      print(data)
////      print(String(data: data!, encoding: .utf8))
//
//      guard let data = data else { return }
//
//      do {
//        let event = try JSONDecoder().decode([Event].self, from: data)
//
//        completionHandler(event)
//
//      } catch let jsonErr {
//        print("Failed to decode json:", jsonErr)
//      }
//    }.resume() // fires off the request
//  }
  

  
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
    return events.count
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! EventCell
//    cell.backgroundColor = .blue
    
    let event = events[indexPath.item]
    cell.nameLabel.text = event.title ?? ""
    cell.imageView.sd_setImage(with: URL(string: event.image ?? ""), placeholderImage: UIImage(named: "event.png"))
        
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

