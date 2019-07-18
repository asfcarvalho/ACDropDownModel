//
//  DropDownModel.swift
//  Oncoclinicas
//
//  Created by Anderson Carvalho on 08/11/17.
//  Copyright © 2017 asfcarvalho. All rights reserved.
//

import Foundation
import DropDown

public typealias ActionDropBox = (Int, String) -> Void

public class DropDownModel: UIView {
    
    var anchorView: UIView!
    var dropDownInfo: DropDown?
    
    var action: ActionDropBox?
    
    let textField: UITextField = {
       let textField = UITextField()
        return textField
    }()
    
    let icon: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "ic_dropDown")
        return imageView
    }()
    
    public init(anchorView: UIView? = nil, dataSource: [String],  selectorAction: @escaping ((Int, String) -> Void)) {
        super.init(frame: CGRect.zero)
        
        action = selectorAction
        
        dropDownInfo = DropDown()
        
        if let anchorView = anchorView {
            dropDownInfo?.anchorView = anchorView
        }else {
            let anchorView = UIView()
            self.addSubview(anchorView)
            anchorView.anchor(top: self.bottomAnchor, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor)
            dropDownInfo?.anchorView = anchorView
        }
        
        
        dropDownInfo?.dataSource = dataSource
        dropDownInfo?.direction = .bottom
        dropDownInfo?.dismissMode = .onTap
        dropDownInfo?.bottomOffset = CGPoint(x: 0, y:(dropDownInfo?.anchorView?.plainView.bounds.height)!)
        dropDownInfo?.topOffset = CGPoint(x: 0, y:-(dropDownInfo?.anchorView?.plainView.bounds.height)!)
        
        dropDownInfo?.selectionAction = selected(_:_:)
        
        dropDownInfo?.cancelAction = {() in
            self.dropDownInfo?.hide()
        }
        
        DropDown.appearance().selectionBackgroundColor = UIColor(red: 206, green: 206, blue: 206, alpha: 1)
        self.setupGestureRecognizer(onClick: self)
        
        //MARK: TextField
        textField.placeholder = "Teste"
        self.addSubview(textField)
        textField.fillSuperview(padding: UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 40))
        textField.isUserInteractionEnabled = false
        
        //MARK: Icon
        self.addSubview(icon)
        icon.anchor(top: nil, leading: nil, bottom: nil, trailing: self.trailingAnchor, centerX: nil, centerY: self.centerYAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 16), size: CGSize(width: 20, height: 20))
    }
    
    func selected(_ index: Int, _ value: String) {
        textField.text = value
        action?(index, value)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    fileprivate func setupGestureRecognizer(onClick: AnyObject) {
        let tap = UITapGestureRecognizer(target: self, action: #selector(setupDropDownActions))
        onClick.addGestureRecognizer(tap)
        tap.delegate = self
    }
    
    @objc fileprivate func setupDropDownActions(_ sender: AnyObject?) {
        dropDownInfo?.show()
        
    }
}

extension DropDownModel: UIGestureRecognizerDelegate {
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return true
    }
    
    @available(iOS 9.0, *)
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive press: UIPress) -> Bool {
        return true
    }
    
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
}
