//
//  KIRIAnimatedTabBar.swift
//  KIRIAnimatedTabBar
//
//  Created by Kishan Nakum on 10/03/19.

//  MIT License
//  Copyright (c) 2019 KISHAN NAKUM

/*  Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:
 
    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.
 
    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
    SOFTWARE.
 */

import Foundation

@objc open class KIRIAnimatedTabBar : NSObject{
   
    /* =======================================================================
     // MARK: Variable Declarations
     ======================================================================= */
    
    //  Animation options for tabBarItem flip from Right/Left/Top/Bottom
    open var animationOptions: UIView.AnimationOptions = UIView.AnimationOptions.transitionFlipFromBottom

    // The duration of the animation
    open var animationDuration: CGFloat = 0.5
    
    // Animation rotation Direction (By default we are taking Right Direction)
    open var rotationDirection: KIRIAnimationDirection = .right

    
    /* =======================================================================
     // MARK: Public Functions
     ======================================================================= */
    @objc public func animateTabBarItem(_ tabBar: UITabBar, _ tabIndex: Int, _ animationType: KIRIAnimationtype) {
        guard let selectedImage: UIImageView = tabBar.subviews[tabIndex+1].subviews.first as? UIImageView else{
            print("Image not set to the selected TabbarItem")
            return
        }
        switch animationType {
        case KIRIAnimationtype.Shake:
            self.addShakeEffect(selectedImage)
        case KIRIAnimationtype.Rotation:
            self.addRotationEffect(selectedImage)
        case KIRIAnimationtype.Bounce:
            self.addBounceEffect(selectedImage)
        case KIRIAnimationtype.Transition:
            self.addTransitionEffect(selectedImage)
        default:
            break
        }
    }
    
    /* =======================================================================
     // MARK: Private Functions
     ======================================================================= */
    fileprivate func addShakeEffect(_ image: UIImageView) {
        let animation = CAKeyframeAnimation()
        animation.keyPath = KIRIConstans.ShakeEffectCostants.animationKeyPath
        animation.values = KIRIConstans.ShakeEffectCostants.animationValues
        animation.keyTimes = KIRIConstans.ShakeEffectCostants.animationKeyTimes
        animation.duration = KIRIConstans.ShakeEffectCostants.animationDuration
        animation.isAdditive = true
        image.layer.add(animation, forKey: KIRITransformKeys.Shake)
    }

    fileprivate func addRotationEffect(_ image: UIImageView) {
            let animation = CABasicAnimation(keyPath: KIRITransformKeys.Rotation)
            animation.fromValue = 0.0
            var toValue = CGFloat.pi * 2
            if rotationDirection == KIRIAnimationDirection.left {
                toValue = toValue * -1.0
            }
            animation.toValue = toValue
            animation.duration = TimeInterval(animationDuration)
            image.layer.add(animation, forKey: nil)
        }
    
    fileprivate func addTransitionEffect(_ image: UIImageView) {
        UIView.transition(with: image, duration: TimeInterval(animationDuration), options: animationOptions, animations: {
        }, completion: { _ in
        })
    }

    fileprivate func addBounceEffect(_ image: UIImageView) {
            let animation = CAKeyframeAnimation(keyPath: KIRITransformKeys.Scale)
            animation.values = KIRIConstans.BounceEffectCostants.animationValues
            animation.duration = TimeInterval(animationDuration)
            animation.calculationMode = CAAnimationCalculationMode.cubic
            image.layer.add(animation, forKey: nil)
        }
    
}
