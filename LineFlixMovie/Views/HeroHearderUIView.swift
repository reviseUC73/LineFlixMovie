//
//  HeroHearderUIView.swift
//  LineFlixMovie
//
//  Created by ReviseUC73 on 14/1/2567 BE.
//

import UIKit

class HeroHearderUIView: UIView {
    
   private let playButton:UIButton  = {
        let button = UIButton()
        button.setTitle("Play", for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false //ปิดการปรับขนาดปุมautoเพื่อเราจะได้setเอง
        button.layer.cornerRadius = 5
        return button
    }()
    private let downloadButton:UIButton  = {
        let button = UIButton()
        button.setTitle("Download", for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false //ปิดการปรับขนาดปุมautoเพื่อเราจะได้setเอง
        button.layer.cornerRadius = 5
        return button
    }()
    private let  heroImageView:UIImageView = {
       let imageView = UIImageView()
       imageView.contentMode = .scaleAspectFill
       imageView.clipsToBounds = true
       imageView.image = UIImage(named: "poster1")
       return imageView
    }()
    
    
    func addGradient(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.systemBackground.cgColor
        ]
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
    }
    
    
// MARK: - Initialise
    // function call for initialise anything
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        // addSublayer -> to ตบแต่ง frame
        addSubview(heroImageView) // add Image in section
        addGradient()

        addSubview(playButton)
        addSubview(downloadButton)
        applyConstraints()
    }
    
    // Add frame image
   
    // select postion that paste in ViewSomething
    func applyConstraints() {
        let playButtonApplyConstraints = [
            playButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 70),
            playButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            playButton.widthAnchor.constraint(equalToConstant: 120)
        ]
        
        let downloadButtonApplyConstraints = [
            downloadButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -70),
            downloadButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            downloadButton.widthAnchor.constraint(equalToConstant: 120)
        ]
        NSLayoutConstraint.activate(playButtonApplyConstraints)
        NSLayoutConstraint.activate(downloadButtonApplyConstraints)
    }
    override func layoutSubviews() {
        super.layoutSubviews() // call old layout subview
        heroImageView.frame = bounds
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

