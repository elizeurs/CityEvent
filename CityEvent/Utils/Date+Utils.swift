//
//  Date+Utils.swift
//  CityEvent
//
//  Created by Elizeu RS on 25/07/22.
//

import Foundation

extension Date {
  
  var formattedDate: String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd-MM-yyyy hh:mm"
    return dateFormatter.string(from: self)
  }
      }



