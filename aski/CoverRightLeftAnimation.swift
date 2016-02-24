//
//  CoverRightLeftAnimation.swift
//  aski
//
//  Created by LUIZ RICARDO SORDI on 2/23/16.
//  Copyright © 2016 LUIZ RICARDO SORDI. All rights reserved.
//

import UIKit

class CoverRightLeftAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    let duration = 1.0;
    var presenting = true;
    var originFrame = CGRect.zero;
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?)-> NSTimeInterval {
        return duration;
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView()!
        
        let toView =
        transitionContext.viewForKey(UITransitionContextToViewKey)!
        
        containerView.addSubview(toView);
        containerView.bringSubviewToFront(toView);
        
        GTween.set(toView, params:[x:Int(containerView.frame.size.width)]);
        GTween.to(toView, time : 0.5, params:[x : 0, ease : Back.easeOut, "onComplete" : {
            transitionContext.completeTransition(true);
        }]);
    }
}
