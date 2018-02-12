//
//  DropDownModel.swift
//  Oncoclinicas
//
//  Created by Anderson Carvalho on 08/11/17.
//  Copyright © 2017 e-Deploy. All rights reserved.
//

import Foundation
import DropDown
import AKMaskField

class DropDownModel: NSObject {
    
    var anchorView: UIView!
    var dropDownInfo: DropDown?
    var action: SelectionClosure?
    
    init(onClick: UIView, anchorView: UIView!, dataSource: [String], selectorAction: SelectionClosure?) {
        super.init()
        
        dropDownInfo = DropDown()
        
        self.action = selectorAction
        
        dropDownInfo?.anchorView = anchorView
        dropDownInfo?.dataSource = dataSource
        dropDownInfo?.direction = .bottom
        dropDownInfo?.dismissMode = .onTap
        dropDownInfo?.bottomOffset = CGPoint(x: 0, y:(dropDownInfo?.anchorView?.plainView.bounds.height)!)
        dropDownInfo?.topOffset = CGPoint(x: 0, y:-(dropDownInfo?.anchorView?.plainView.bounds.height)!)
        
        dropDownInfo?.selectionAction = action
        
        dropDownInfo?.cancelAction = {() in
            self.dropDownInfo?.hide()
        }
        
        DropDown.appearance().selectionBackgroundColor = UIColor(red: 206, green: 206, blue: 206, alpha: 1)
        
        self.setupGestureRecognizer(onClick: onClick)
    }
    
    
    func setupGestureRecognizer(onClick: UIView) {
        let tap = UITapGestureRecognizer(target: self, action: #selector(setupDropDownActions))
        onClick.addGestureRecognizer(tap)
        tap.delegate = self
    }
    
    @objc func setupDropDownActions(_ sender: AnyObject?) {
        dropDownInfo?.show()
        
    }
}

extension DropDownModel: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return true
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive press: UIPress) -> Bool {
        return true
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
}
