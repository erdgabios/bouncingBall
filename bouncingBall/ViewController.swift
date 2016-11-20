//
//  ViewController.swift
//  bouncingBall
//
//  Created by G on 20/11/2016.
//  Copyright © 2016 erdgabios. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollisionBehaviorDelegate {
    
    
    
    @IBOutlet weak var groundView: UIView!
    
    
    
    var animator: UIDynamicAnimator!
    var ball: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ball = UIView(frame: CGRect(x: 100, y: 100, width:50, height: 50))
        ball.layer.cornerRadius = 25
        ball.backgroundColor = UIColor.red
        
        self.view.addSubview(ball)
        
        animator = UIDynamicAnimator(referenceView: self.view)
        
        addGravity()
    }
    
    func addGravity() {
        
        let gravity = UIGravityBehavior(items: [ball])
        animator.addBehavior(gravity)
        
        let collison = UICollisionBehavior(items: [ball])
        collison.addBoundary(withIdentifier: 1 as NSCopying, from: groundView.frame.origin, to: CGPoint(x: groundView.frame.origin.x + groundView.frame.width, y: groundView.frame.origin.y))
        
        animator.addBehavior(collison)
        
        collison.collisionDelegate = self
        
        let ballBehavior = UIDynamicItemBehavior(items: [ball])
        ballBehavior.elasticity = 0.75
        
        animator.addBehavior(ballBehavior)
    }
    
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, at p: CGPoint) {
        
        if NSNumber(integerLiteral: 1).isEqual(identifier) {
            
            ball.backgroundColor = UIColor.blue
        }
    }
}

