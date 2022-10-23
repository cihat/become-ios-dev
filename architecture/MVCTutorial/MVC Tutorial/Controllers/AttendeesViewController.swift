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
// MARK: - Attendees View Controller
//
class AttendeesViewController: UIViewController {
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
      segue.identifier == "ShowAttendeeDetails",
      let detailViewController = segue.destination as? DetailViewController,
      let attendeeCell = sender as? UITableViewCell,
      let row = tableView.indexPath(for: attendeeCell)?.row,
      let event = event
    {
      let attendee = event.attendees[row]
      
      var detailsString = attendee.description
      
      let sessions = event.sessions(for: attendee)
      
      for (index, session) in sessions.enumerated() {
        if index == sessions.startIndex {
          detailsString += "\n\nSessions:\n"
        }
        
        detailsString += "- \(session.title)"
        
        if index < sessions.endIndex - 1 {
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
extension AttendeesViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let attendeeCell = tableView.dequeueReusableCell(withIdentifier: "AttendeeCell", for: indexPath)
    
    if let attendee = event?.attendees[indexPath.row] {
      attendeeCell.textLabel?.text = attendee.name
      attendeeCell.detailTextLabel?.text = "\(attendee.nationality)"
    }
    
    return attendeeCell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return event?.attendees.count ?? 0
  }
}

//
// MARK: - Table View Delegate
//
extension AttendeesViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
}
