//
//  HomeViewController.swift
//  LineFlixMovie
//
//  Created by ReviseUC73 on 14/1/2567 BE.
//

import UIKit

class HomeViewController: UIViewController {
    // same callback func in js
    private let  homeFeedTable:UITableView = {
        let table = UITableView(frame: .zero , style: .grouped)
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifiner) // ? 
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        // add tableView into view
        view.addSubview(homeFeedTable)
        
        
        homeFeedTable.delegate  = self
        homeFeedTable.dataSource = self // when load we will link my data source
        
        homeFeedTable.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 400))
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // set range sacle area homeFeedTable eqvTo your phone screeen
        homeFeedTable.frame = view.bounds
    }
    
}

// Note : see extension in swift
// Config TabelView Setup
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 20
    }
    
    // set number of cell in table view -> กี่ section จะมีนับเป็น 1 row ex. 20 / 4 -> 5 row
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    

    // set data source each cell in tabelView -> return obj tableView that identify number of cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        print(indexPath)
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = "Hello world"
//        return cell
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifiner , for: indexPath) as? CollectionViewTableViewCell
                
        else {
            return UITableViewCell()
        }
//        cell.textLabel?.text = "fefef"
        
        return cell
    }
    
    // ask delegate for height of each row
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    // Asks the delegate for the height to use for the header of a particular section.
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    
    
    

}
