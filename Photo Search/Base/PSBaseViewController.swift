//
//  PSBaseViewController.swift
//  Photo Search
//
//  Created by Roman Zhukov on 02.01.2023.
//

import UIKit

class PSBaseViewController<CustomView: UIView>: UIViewController, HasCustomView {
    typealias CustomView = CustomView
    
    override func loadView() {
        let rootView = CustomView()
        view = rootView
    }
}

