//
//  UserInfoVC.swift
//  GHFollowers
//
//  Created by Tarun Sharma on 23/09/25.
//

import UIKit

class UserInfoVC: UIViewController {
    
    var username: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
        
        NetworkManager.shared.getUserInfo(for: username) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let userInfo):
                print(result)
                
            case .failure(let error):
                self.presentGFALertOnMainThread(title: "Error", message: error.rawValue, buttonTitle: "OK")
            }
        }
        
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
    


}
