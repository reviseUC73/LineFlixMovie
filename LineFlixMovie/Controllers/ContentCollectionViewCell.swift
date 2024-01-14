//
//  TitleCollectionViewCell.swift
//  LineFlixMovie
//
//  Created by ReviseUC73 on 15/1/2567 BE.
//
import SDWebImage

import UIKit

class ContentCollectionViewCell: UICollectionViewCell {
    static let identifier = "ContentCollectionViewCell"
    
    private let posterImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFill
            return imageView
        }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            contentView.addSubview(posterImageView)
            
        }
        
        required init?(coder: NSCoder) {
            fatalError()
        }
        
        override func layoutSubviews() {
            super.layoutSubviews()
            posterImageView.frame = contentView.bounds
        }
    
    
    // use web image
    public func configure(with model: String) {
            
        guard let url = URL(string: model) else {return}
        posterImageView.sd_setImage(with: url,completed: nil)
        }
         
}
 
