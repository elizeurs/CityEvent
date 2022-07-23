//
//  Event.swift
//  CityEvent
//
//  Created by Elizeu RS on 23/07/22.
//

import Foundation

struct Event: Codable {
  
  var people: [String]?
  var date: Int?
  var description: String?
  var image: String?
  var longitude: Double?
  var latitude: Double?
  var price: Float?
  var title: String?
  var id: String?
}
