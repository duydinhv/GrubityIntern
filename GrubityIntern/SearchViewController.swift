//
//  SearchViewController.swift
//  GrubityIntern
//
//  Created by DUY on 10/16/19.
//  Copyright © 2019 DUY. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    @IBOutlet weak var TableView: UITableView!
    let searchBar = UISearchBar()
    var searchs: [Search] = []
    var filteredSearch: [Search] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavSearchBar()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        searchBar.becomeFirstResponder()
    }

    func setupNavSearchBar() {
        searchBar.sizeToFit()
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "Search"
        navigationItem.titleView = searchBar
        searchBar.isTranslucent = true
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.present(UINavigationController(rootViewController: NewsFeedController()), animated: true, completion: nil)
    }
    func filterContentForSearchText(_ searchText: String, category: Search.category? = nil) {
        filteredSearch =  searchs.filter { (search: Search) -> Bool in
            return search.Title.lowercased().contains(searchText.lowercased())
        }
        TableView.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SearchTableViewCell
        let search = searchs[indexPath.row]
        cell.Background.image = UIImage(named: search.Background)
        cell.Title.text = search.Title
        cell.Location.text = search.Location
        cell.Name.text = search.Name
        cell.Price.text = search.Price
        return cell
    }
}

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchBar.text!)
    }
}
