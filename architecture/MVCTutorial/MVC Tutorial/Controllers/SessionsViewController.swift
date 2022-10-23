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

import UIKit

//
// MARK: - Sessions View Controller
//
class SessionsViewController: UIViewController {
  //
  // MARK: - Outlets
  //
  @IBOutlet weak var tableView: UITableView!
  
  //
  // MARK: - Variables And Properties
  //
  var event: Event? {
    didSet {
      if isViewLoaded {
        tableView.reloadData()
      }
    }
  }
  
  //
  // MARK: - View Controller
  //
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    super.prepare(for: segue, sender: sender)
    
    if
      segue.identifier == "ShowSessionDetails",
      let detailViewController = segue.destination as? DetailViewController,
      let sessionCell = sender as? SessionCell,
      let row = tableView.indexPath(for: sessionCell)?.row,
      let event = event
    {
      let session = event.sessions[row]
      
      var detailsString = session.description
      
      let attendees = event.attendees(for: session)
      
      for (index, attendee) in attendees.enumerated() {
        if index == attendees.startIndex {
          detailsString += "\n\nAttendees:\n"
        }
        
        detailsString += "- \(attendee.name)"
        
        if index < attendees.endIndex - 1 {
          detailsString += "\n"
        }
      }
      
      detailViewController.details = detailsString
    }
  }
}

//
// MARK: - Table View Data Source
//
extension SessionsViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let sessionCell = tableView.dequeueReusableCell(withIdentifier: SessionCell.identifier, for: indexPath) as! SessionCell
    
    if let session = event?.sessions[indexPath.row] {
      sessionCell.titleLabel.text = session.title
      sessionCell.bottomDetailLabel.text = "\(session.sessionNumber)"
      sessionCell.rightDetailLabel.text = session.dateString
    }
    
    return sessionCell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return event?.sessions.count ?? 0
  }
}

//
// MARK: - Table View Delegate
//
extension SessionsViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
}
