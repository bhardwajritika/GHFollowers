//
//  GFButton.swift
//  GHFollowers
//
//  Created by Tarun Sharma on 18/09/25.
//

import UIKit

class GFButton: UIButton {

    
    // typical initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //custom initializer
    convenience init(backgroundColor: UIColor, title: String) {
        self.init(frame: .zero)
        set(backgroundColor: backgroundColor, title: title)
//        configure()
    }
    
    private func configure() {
        configuration = .tinted()
        configuration?.cornerStyle = .medium
        translatesAutoresizingMaskIntoConstraints   = false
//        layer.cornerRadius      = 10
//        setTitleColor(.white, for: .normal)
//        titleLabel?.font        = UIFont.preferredFont(forTextStyle: .headline)
        
    }
    
    
    func set(backgroundColor: UIColor, title: String) {
        
        self.configuration?.baseBackgroundColor = backgroundColor
        self.configuration?.baseForegroundColor = backgroundColor
        self.configuration?.title = title
//        self.backgroundColor = backgroundColor
//        setTitle(title, for: .normal)
    }
    
}
