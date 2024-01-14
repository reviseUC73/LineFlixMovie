//
//  HomeViewController.swift
//  LineFlixMovie
//
//  Created by ReviseUC73 on 14/1/2567 BE.
//

import UIKit

class HomeViewController: UIViewController {
    
    let sectionTitles: [String] = ["Trending Movies", "Popular", "Trending Tv", "Upcoming Movies", "Top rated"]
    
    // same callback func in js
    private let homeFeedTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifiner)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(homeFeedTable)
        
        homeFeedTable.delegate  = self
        homeFeedTable.dataSource = self
        configureNavbar()
        getTrendingMovie() 
        
        
        let headerView = HeroHearderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 500))
        homeFeedTable.tableHeaderView = headerView
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // set range sacle area homeFeedTable eqvTo your phone screeen
        homeFeedTable.frame = view.bounds
    }
    
    
    private func configureNavbar() {
        //          var image = UIImage(named: "iconlogo")
        //          image = image?.withRenderingMode(.alwaysOriginal)
        //        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .done, target: self, action: nil)
        
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "play.rectangle"), style: .done, target: self, action: nil)
        ]
        navigationController?.navigationBar.tintColor = .white
    }
    
    private func getTrendingMovie(){
        APICaller.shared.getTrendingMovies { _  in
            
        }
    }
}

// Note : see extension in swift
// Config TabelView Setup DataSource, Delegat
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    // set number of cell in table view -> กี่ section จะมีนับเป็น 1 row ex. 20 / 4 -> 5 row
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    // set data source each cell in tabelView -> return obj tableView that identify number of cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifiner , for: indexPath) as? CollectionViewTableViewCell
        else {
            return UITableViewCell()
        }
        return cell
    }
    
    // ask delegate for height of each row
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200    }
    
    // Asks the delegate for the height to use for the header of a particular section.
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else {return}
        header.textLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
        header.textLabel?.textColor = .white
//        header.textLabel?.text = header.textLabel?.text?.lowercased()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    //fix pos navbar
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
         let defaultOffset = view.safeAreaInsets.top
         let offset = scrollView.contentOffset.y + defaultOffset
         
         navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
     }
     
    
    
    

}
