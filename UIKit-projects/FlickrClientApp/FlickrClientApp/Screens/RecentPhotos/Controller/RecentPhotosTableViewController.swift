//
//  ViewController.swift
//  FlickrClientApp
//
//  Created by Cihat Salik on 20.10.2022.
//

import UIKit

class RecentPhotosTableViewController: UITableViewController, UISearchResultsUpdating {
  
  private var response: PhotosResponse? {
    didSet {
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupSearchController()
    fetchRecentPhotos()
  }
  
  private func setupSearchController() {
    let search = UISearchController(searchResultsController: nil)
    search.searchResultsUpdater = self
    search.obscuresBackgroundDuringPresentation = false
    search.searchBar.placeholder = "Type something"
    navigationItem.searchController = search
  }
  
  private func fetchRecentPhotos() {
    guard let url = URL(string: "https://www.flickr.com/services/rest/?method=flickr.photos.getRecent&api_key=7ed183b6338d6aed33a480632d2f6833&format=json&nojsoncallback=1&extras=description,license,date_upload,date_taken,owner_name,icon_server,original_format,last_update,geo,tags,machine_tags,o_dims,views,media,path_alias,url_sq,url_t,url_s,url_q,url_m,url_n,url_z,url_c,url_l,url_o") else { return }
    
    let request = URLRequest(url: url)
    
    URLSession.shared.dataTask(with: request) { data, response, error in
      if let error = error {
        debugPrint(error)
        return
      }
      if let data = data, let response = try? JSONDecoder().decode(PhotosResponse.self, from: data) {
        self.response = response
      }
    }.resume()
  }
  
  private func fetchSearchPhotos(with text: String) {
    guard let url = URL(string: "https://www.flickr.com/services/rest/?method=flickr.photos.search&api_key=7ed183b6338d6aed33a480632d2f6833&text=flower&format=json&nojsoncallback=1extras=description,license,date_upload,date_taken,owner_name,icon_server,original_format,last_update,geo,tags,machine_tags,o_dims,views,media,path_alias,url_sq,url_t,url_s,url_q,url_m,url_n,url_z,url_c,url_l,url_o") else { return }
    
    let request = URLRequest(url: url)
    
    URLSession.shared.dataTask(with: request) { data, response, error in
      if let error = error {
        debugPrint(error)
        return
      }
      if let data = data, let response = try? JSONDecoder().decode(PhotosResponse.self, from: data) {
        self.response = response
      }
    }.resume()
  }
  
  private func fetchImage(with url: String?, competion: @escaping (Data) -> Void) {
    if let urlString = url, let url = URL(string: urlString) {
      let request =  URLRequest(url: url)
      URLSession.shared.dataTask(with: request) { data, response, error in
        if let error = error {
          debugPrint(error)
          return
        }
        if let data = data {
          DispatchQueue.main.async {
            competion(data)
          }
        }
      }.resume()
    }
  }
  
  // MARK: - UITableViewDataSource & UITableViewDelegate
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return response?.photos?.photo?.count ?? .zero
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let photo = response?.photos?.photo?[indexPath.row]
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PhotoTableViewCell
    
    cell.ownerImageView.backgroundColor = .darkGray
    cell.ownerNameLabel.text = photo?.ownername
    
    fetchImage(with: photo?.urlN) { data in
      cell.photoImageView.image = UIImage(data: data)
    }
    
    cell.titleLabel.text = photo?.title
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    performSegue(withIdentifier: "detailSegue", sender: nil)
  }
  
  
  // MARK: - Navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // Get the new view controller using segue.destination.
    // Pass the selected object to the new view controller.
    if let viewController = segue.destination as? PhotoDetailViewController {
      // TODO: Selected photo sending to detail page
    }
  }
  
  // MARK: - UISearchResultsUpdating
  func updateSearchResults(for searchController: UISearchController) {
    guard let text = searchController.searchBar.text else { return }
    if text.count > 2 {
      fetchSearchPhotos(with: text)
    }
  }
  
}

