//
//  ViewController.swift
//  Demo
//
//  Created by 卓同学 on 2016/12/26.
//  Copyright © 2016年 卓同学. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var blueView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        blueView = UIView(frame: CGRect.zero)
        blueView.backgroundColor = UIColor.blue
        view.addSubview(blueView)
        
        edgesForExtendedLayout = [.bottom,.left]
        
//        originAddConstraint()
        originAddConstraintAfterIOS9()
     //   snapkitWay()
        
    }

    func originAddConstraint() {
        blueView.translatesAutoresizingMaskIntoConstraints = false

        // iOS 7
        let widthConstraint = NSLayoutConstraint(item: blueView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100)
        blueView.addConstraint(widthConstraint)
        let heightConstraint = NSLayoutConstraint(item: blueView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100)
        blueView.addConstraint(heightConstraint)

        // iOS 8
        NSLayoutConstraint(item: blueView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: blueView, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
    }
    
    func originAddConstraintAfterIOS9() {
        blueView.translatesAutoresizingMaskIntoConstraints = false
        blueView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        blueView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        blueView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        blueView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    func snapkitWay() {
        blueView.snp.makeConstraints { (make) in
            make.width.height.equalTo(100)
            make.center.equalTo(self.view.center)
            //equalToSuperview()
        //make.width.equalTo(view).multipliedBy(2).offset(1).priority(800).labeled("BlueViewWidth")
        }
    }
    
    enum ConstantValue {
        case int(Int)
        case double(Double)
        case point(CGPoint)
    }
    
    func testAssoicatedEnum() {
        receive(constantValue: .double(2.4))
    }
    
    func receive(constantValue: ConstantValue) {
        switch constantValue {
        case .double(let double):
            print(double)
        default:
            break
        }
    }
}

