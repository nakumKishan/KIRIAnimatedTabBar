//
//  KIRIAnimationManager.swift
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

/* =======================================================================
 // MARK: Enum Cases
 ======================================================================= */
@objc public enum KIRIAnimationDirection: Int {
    case left
    case right
}

@objc public enum KIRIAnimationtype: Int {
    case None
    case Bounce
    case Rotation
    case Transition
    case Shake
}

struct KIRITransformKeys {
    static let Scale = "transform.scale"
    static let Rotation = "transform.rotation"
    static let Shake = "shake"
}

/* =======================================================================
 // MARK: Constant Keys
 ======================================================================= */
struct KIRIConstans{
    struct ShakeEffectCostants{
        static let animationKeyTimes : [NSNumber] =  [0, 0.125, 0.25, 0.375, 0.5, 0.625, 0.75, 0.875, 1]
        static let animationValues = [0, 10, -10, 10, -5, 5, -5, 0 ]
        static let animationKeyPath = "position.x"
        static let animationDuration = 0.4
    }
    
    struct BounceEffectCostants{
        static let animationValues = [1.0, 1.4, 0.9, 1.15, 0.95, 1.02, 1.0]
    }
}
