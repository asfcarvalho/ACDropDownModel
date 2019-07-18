//
//  ViewController.swift
//  SCDropDownSample
//
//  Created by Proaire on 18/07/19.
//  Copyright © 2019 asfcarvalho. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    let array = ["test1","teste2","teste4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let dropDown = DropDownModel(dataSource: array) { (index, item) in
            print(item)
        }
        
        dropDown.backgroundColor = UIColor.lightGray
        
        self.view.addSubview(dropDown)
        
        dropDown.anchor(top: self.view.safeAreaLayoutGuide.topAnchor, leading: self.view.leadingAnchor, bottom: nil, trailing: self.view.trailingAnchor, centerX: nil, centerY: nil, padding: UIEdgeInsets(top: 32, left: 16, bottom: 0, right: 16), size: CGSize(width: 0, height: 50))

    }


}

