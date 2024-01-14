//
//  CollectionViewTableViewCell.swift
//  LineFlixMovie
//
//  Created by ReviseUC73 on 14/1/2567 BE.
//

import UIKit

// something that keep in section
class CollectionViewTableViewCell: UITableViewCell {
   
    
    //    static let
    static let identifiner  = "CollectionViewTableViewCell" // register name
    
    private let collectionView: UICollectionView = {
        
        // A layout object that organizes items into a grid with optional header and footer views for each section.
        let layout = UICollectionViewFlowLayout() //
        
        // eaah item in row have size (140 : 200 ) * 10
        layout.itemSize = CGSize(width: 140, height: 200)
        
        // each collect item each row it has scroll direction is ->
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero ,collectionViewLayout: layout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
    
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier reuseldentifier: String?){
        super.init(style: style, reuseIdentifier: reuseldentifier)
        contentView.backgroundColor = .systemIndigo
        contentView.addSubview(collectionView)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // input anything that i setup into frame -> section
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }
}

extension CollectionViewTableViewCell : UICollectionViewDataSource , UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .green
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
}
