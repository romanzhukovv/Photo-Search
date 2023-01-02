//
//  PSBaseView.swift
//  Photo Search
//
//  Created by Roman Zhukov on 02.01.2023.
//

import UIKit

class PSBaseView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addViews()
        layoutViews()
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

@objc extension PSBaseView {
    func addViews() {
        
    }
    
    func layoutViews() {
        
    }
    
    func configureViews() {
        backgroundColor = .white
    }
}
