//
//  UIViewControllerExtension.swift
//  GitMate
//
//  Created by Chris Min on 05/06/2024.
//

import UIKit

extension UIViewController {
    
    func presentGitMateAlertViewController(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertViewController = GitMateAlertViewController(title: title, message: message, buttonTitle: buttonTitle)
            alertViewController.modalPresentationStyle = .overFullScreen
            alertViewController.modalTransitionStyle = .crossDissolve
            self.present(alertViewController, animated: true)
        }
    }
    
}
