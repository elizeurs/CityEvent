//
//  Service.swift
//  CityEvent
//
//  Created by Elizeu RS on 24/07/22.
//

import Foundation

class Service {
  
  static let shared = Service()
  
  func fetchEvents(completion: @escaping ([Event], Error?) -> ()) {
    print("Fetching city events from service layer")
    
    let urlString = "http://5f5a8f24d44d640016169133.mockapi.io/api/events"
    guard let url = URL(string: urlString) else { return }

    // fetch data  from internet
    URLSession.shared.dataTask(with: url) { (data, resp, err) in

      if let err = err {
        print("Failed to fetch events:", err)
        completion([], nil)
        return
      }

       // success
//        print(data)
//        print(String(data: data!, encoding: .utf8))

      guard let data = data else { return }
      do {
        let event = try JSONDecoder().decode([Event].self, from: data)
        
        completion(event, nil)
//        print(event)
//        self.events = event
//
//        DispatchQueue.main.async {
//          self.collectionView.reloadData()
//
//        }
        
      } catch let jsonErr {
        print("Failed to decode json:", jsonErr)
        completion([], jsonErr)
      }
    }.resume() // fires off the request
  }
}
