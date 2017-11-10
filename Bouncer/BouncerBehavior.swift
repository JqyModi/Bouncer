//
//  BouncerBehavior.swift
//  Bouncer
//
//  Created by mac on 2017/11/10.
//  Copyright © 2017年 modi. All rights reserved.
//

import UIKit

class BouncerBehavior: UIDynamicBehavior {
    //创建重力场
    let gravity = UIGravityBehavior()
    //创建碰撞行为
    lazy var collider: UICollisionBehavior = {
        let lazilyCreatedCollider = UICollisionBehavior()
        //设置gameView的边界为动画边界
        lazilyCreatedCollider.translatesReferenceBoundsIntoBoundary = true
        return lazilyCreatedCollider
    }()
    
    lazy var blockBehavior: UIDynamicItemBehavior = {
        let lazilyCreatedBlockBehavior = UIDynamicItemBehavior()
        //设置是否旋转
        lazilyCreatedBlockBehavior.allowsRotation = false
        //设置碰撞时能量损耗
        lazilyCreatedBlockBehavior.elasticity = 0.75
        //设置摩擦系数
        lazilyCreatedBlockBehavior.friction = 0
        //设置阻力
        lazilyCreatedBlockBehavior.resistance = 0
        return lazilyCreatedBlockBehavior
    }()
    
    override init() {
        super.init()
        //添加动画行为效果
        addChildBehavior(gravity)
        addChildBehavior(collider)
        addChildBehavior(blockBehavior)
    }
    
    func addBarrier(path: UIBezierPath, named name: NSString) {
        collider.removeBoundary(withIdentifier: name)
        collider.addBoundary(withIdentifier: name, for: path)
    }
    
    func addBlock(block: UIView){
        //添加到动画场中
        dynamicAnimator?.referenceView?.addSubview(block)
        //将View添加动画行为
        gravity.addItem(block)
        collider.addItem(block)
        blockBehavior.addItem(block)
    }
    
    func removeBlock(block: UIView){
        gravity.removeItem(block)
        collider.removeItem(block)
        //移除动画
        block.removeFromSuperview()
    }
}
