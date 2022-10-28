//
//  Photos.swift
//  Flickr Client App
//
//  Created by Burak AÇIK on 16.08.2022.
//

import Foundation

struct Photos: Codable {
  let page: Int?
  let pages: Int?
  let perpage: Int?
  let total: Int?
  let photo: [Photo]?
}
