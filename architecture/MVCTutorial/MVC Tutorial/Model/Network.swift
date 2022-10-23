/// Copyright (c) 2019 Razeware LLC
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import Foundation

//
// MARK: - Network
//
class Network {
  //
  // MARK: - Class Methods
  //
  static func loadJSONFile<T: Decodable>(named filename: String,
                                         type: T.Type,
                                         queue: DispatchQueue? = DispatchQueue.main,
                                         simulateLoadDelay: Bool? = true,
                                         delaySeconds: TimeInterval = 0.2,
                                         completionHandler: @escaping (T?, NetworkError?) -> Void) {
    guard let url = Bundle.main.url(forResource: filename, withExtension: "json") else {
      if let dispatchQueue = queue {
        dispatchQueue.asyncAfter(deadline: DispatchTime.now() + delaySeconds) {
          completionHandler(nil, .invalidPath)
        }
      } else {
        completionHandler(nil, .invalidPath)
      }
    
      return
    }
    
    let request = URLRequest(url: url)
    
    let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
      let statusCode = (response as? HTTPURLResponse)?.statusCode ?? 200
      
      if statusCode != 200 {
        if let dispatchQueue = queue {
          dispatchQueue.asyncAfter(deadline: DispatchTime.now() + delaySeconds) {
            completionHandler(nil, .requestError)
          }
        } else {
          completionHandler(nil, .requestError)
        }
        
        return
      }
      
      do {
        if let jsonData = data {
          let decoder = JSONDecoder()
          decoder.dateDecodingStrategy = .custom { (decoder) -> Date in
            let value = try decoder.singleValueContainer().decode(String.self)
            
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            
            if let date = formatter.date(from: value) {
              return date
            }
            
            throw NetworkError.dateParseError
          }
          
          let typedObject: T? = try decoder.decode(T.self, from: jsonData)
          
          if let dispatchQueue = queue {
            dispatchQueue.asyncAfter(deadline: DispatchTime.now() + delaySeconds) {
              completionHandler(typedObject, nil)
            }
          } else {
            completionHandler(typedObject, nil)
          }
        }
      } catch {
        print(error)
        
        if let dispatchQueue = queue {
          dispatchQueue.asyncAfter(deadline: DispatchTime.now() + delaySeconds) {
            completionHandler(nil, .parseError)
          }
        } else {
          completionHandler(nil, .parseError)
        }
      }
    }
    
    dataTask.resume()
  }
}
