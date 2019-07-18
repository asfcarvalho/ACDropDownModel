//
//  ViewController.swift
//  ACDropDownModel
//
//  Created by asfcarvalho@me.com on 02/12/2018.
//  Copyright (c) 2018 asfcarvalho@me.com. All rights reserved.
//

import UIKit
//import ACDropDownModel

class ViewController: UIViewController {

    @IBOutlet weak var viewClick: UIView!
    @IBOutlet weak var viewAnchor: UIView!
    @IBOutlet weak var textView: UITextField!
    
    let array = ["test1","teste2","teste4"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let _ = DropDownModel(onClick: viewClick, anchorView: viewAnchor, dataSource: array) { (index, item) in
            self.textView.text = item
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

