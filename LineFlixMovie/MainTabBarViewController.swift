//
//  ViewController.swift
//  LineFlixMovie
//
//  Created by ReviseUC73 on 14/1/2567 BE.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // set color bg page
        view.backgroundColor = .gray
        
        // set nav link direaction each view(page)
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: UpcommingViewController())
        let vc3 = UINavigationController(rootViewController: SearchViewController())
        let vc4 = UINavigationController(rootViewController: DownloadsViewController())
        
        // set icon of nav bar each page -> SF symbols
        vc1.tabBarItem.image = UIImage(systemName:"house")
        vc2.tabBarItem.image = UIImage(systemName:"gauge.with.needle.fill")
        vc3.tabBarItem.image = UIImage(systemName:"magnifyingglass")
        vc4.tabBarItem.image = UIImage(systemName:"square.and.arrow.down")
        
        // set title each nav link point
        vc1.title = "Home"
        vc2.title = "Coming Soon"
        vc3.title = "Top Search"
        vc4.title = "Downloads"
        
        // set color selection in navbar
        tabBar.tintColor = .systemTeal
        
        // display in the tab bar interface
        setViewControllers([vc1, vc2, ],animated: true)
    }
    


}
