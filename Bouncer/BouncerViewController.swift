//
//  ViewController.swift
//  Bouncer
//
//  Created by mac on 2017/11/10.
//  Copyright © 2017年 modi. All rights reserved.
//

import UIKit

class BouncerViewController: UIViewController {

    var bouncerBehavior = BouncerBehavior()
    
    lazy var animator: UIDynamicAnimator = { UIDynamicAnimator(referenceView: self.view) }()
    
    var redBlock: UIView?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if redBlock == nil {
            redBlock = addBlick()
            redBlock?.backgroundColor = UIColor.red
            bouncerBehavior.addBlock(block: redBlock!)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animator.addBehavior(bouncerBehavior)
        
        let motionManager = AppDelegate.Motion.Manager
        //检查加速计是否可用
        if motionManager.isAccelerometerAvailable {
            
        }
    }

    private struct Contants {
        static let BlockSize = CGSize(width: 40, height: 40)
    }
    
    func addBlick() -> UIView {
        let block = UIView(frame: CGRect(origin: CGPoint.zero, size: Contants.BlockSize))
        block.center = CGPoint(x: view.bounds.minX, y: view.bounds.minY)
        view.addSubview(block)
        return block
    }
    
}

