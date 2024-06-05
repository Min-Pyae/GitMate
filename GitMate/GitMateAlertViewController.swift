//
//  GitMateAlertViewController.swift
//  GitMate
//
//  Created by Chris Min on 05/06/2024.
//

import UIKit

class GitMateAlertViewController: UIViewController {
    
    let containerView = UIView()
    let titleLabel = GitMateTitleLabel(textAlignment: .center, fontSize: 20)
    let messageLabel = GitMateBodyLabel(textAlignment: .center)
    let actionButton = GitMateButton(backgroundColor: .systemPink, title: "Ok")
    
    var alertTitle: String?
    var message: String?
    var buttonTitle: String?
    
    let paddding: CGFloat = 20
    
    
    init(title: String, message: String, buttonTitle: String) {
        super.init(nibName: nil, bundle: nil)
        self.alertTitle = title
        self.message = message
        self.buttonTitle = buttonTitle
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        configureContainerView()
        configureTitleLabel()
        configureActionButton()
        configureMessageLabel()
    }
    
    
    // FUNCTION FOR DISMISSING ALERT VIEW CONTROLLER
    @objc func dismissAlertViewController() {
        dismiss(animated: true)
    }
    

    // FUNCTION FOR CONFIGURING CONTAINER VIEW
    func configureContainerView() {
        view.addSubview(containerView)
        containerView.backgroundColor = .systemBackground
        containerView.layer.cornerRadius = 16
        containerView.layer.borderWidth = 2
        containerView.layer.borderColor = UIColor.white.cgColor
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 220),
            containerView.widthAnchor.constraint(equalToConstant: 280)
        ])
    }
    
    
    // FUNCTION FOR CONFIGURING TITLE LABEL
    func configureTitleLabel() {
        containerView.addSubview(titleLabel)
        titleLabel.text = alertTitle ?? "Something went wrong"
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: paddding),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: paddding),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -paddding),
            titleLabel.heightAnchor.constraint(equalToConstant: 28)
        ])
    }
    
    
    // FUNCTION FOR CONFIGURING ACTION BUTTON
    func configureActionButton() {
        containerView.addSubview(actionButton)
        actionButton.setTitle(buttonTitle ?? "Ok", for: .normal)
        actionButton.addTarget(self, action: #selector(dismissAlertViewController), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            actionButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -paddding),
            actionButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: paddding),
            actionButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -paddding),
            actionButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    
    // FUNCTION FOR CONFIGURING BODY LABEL
    func configureMessageLabel() {
        containerView.addSubview(messageLabel)
        messageLabel.text = message ?? "Unable to complete request"
        messageLabel.numberOfLines = 4
        
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: paddding),
            messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -paddding),
            messageLabel.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -12)
        ])
    }
}
