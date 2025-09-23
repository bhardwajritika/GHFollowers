//
//  UIViewController+Ext.swift
//  GHFollowers
//
//  Created by Tarun Sharma on 19/09/25.
//

import UIKit

fileprivate var containerView: UIView!

extension UIViewController {
    
    
    func presentGFALertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = GFAlertVC(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
    
    
    func showLoadingView() {
        containerView = UIView(frame: view.bounds) // initialize the container view . fill the whole screen
        view.addSubview(containerView) // add subview to the view
        
        containerView.backgroundColor = .systemBackground
        containerView.alpha = 0 // transparency
        
        UIView.animate(withDuration: 0.25) { containerView.alpha = 0.8} // animation duration and act going from 0 opacity to 0.8 opacity.
        
        let activityIndicator = UIActivityIndicatorView(style: .large) // create acitivity indicator
        containerView.addSubview(activityIndicator) // add it to the container view
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        activityIndicator.startAnimating() // start the animation
    }
    
    
    func dismissLoadingView() {
        DispatchQueue.main.async {
            containerView.removeFromSuperview()
            containerView = nil
        }
    }
    
    
    func showEmptyStateView(with message: String, in view: UIView) {
        let emptyStateView = GFEmptyStateView(message: message)
        emptyStateView.frame = view.bounds
        view.addSubview(emptyStateView)
    }
}
