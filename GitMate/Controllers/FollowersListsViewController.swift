//
//  FollowersListsViewController.swift
//  GitMate
//
//  Created by Chris Min on 04/06/2024.
//

import UIKit

class FollowersListsViewController: UIViewController {

    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }

}


#Preview {
    FollowersListsViewController()
}
