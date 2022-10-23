//
//  Photos.swift
//  FlickrClientApp
//
//  Created by Cihat Salik on 21.10.2022.
//

import Foundation

struct Photos: Codable {
  
  let page: Int?
  let pages: Int?
  let perpage: Int?
  let total: Int?
  let photo: [Photo]?
}
