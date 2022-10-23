//
//  GameList+Formatter.swift
//  TemperatureConverter
//
//  Created by Cihat Salik on 23.10.2022.
//

import Foundation

struct Formatters {
  static let dollarFormatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.currencySymbol = "$"
    formatter.currencyCode = "USD"
    formatter.minimumFractionDigits = 0
    formatter.maximumFractionDigits = 2
    
    return formatter
  }()
}
