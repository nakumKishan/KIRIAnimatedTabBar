# KIRIAnimatedTabBar
Library made in Swift helps to add various type of animations to your TabbarController tab items.

![1](https://user-images.githubusercontent.com/8666236/54088445-29f24c80-4384-11e9-8cbd-60a28d3cde7e.png)


# Preview
![final](https://user-images.githubusercontent.com/8666236/54088791-ac304000-4387-11e9-95d0-05a3ceb09e56.gif)


# Installation
Add KIRIAnimatedTabBar using Cocoapods
```swift
   pod 'KIRIAnimatedTabBar'
```

# How to use KIRIAnimatedTabBar

## Steps
(1) Add Library via Cocoapods

(2) Import KIRIAnimatedTabBar to your file.

(3) Add UITabBarControllerDelegate and implement it's method

(4) Create KIRIAnimatedTabBar instance

```swift
import UIKit
import KIRIAnimatedTabBar

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    var animatedTabBar = KIRIAnimatedTabBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
   
    // MARK: - UITabBarControllerDelegate
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
}
```

(5) Add animation duration according to your choice.
```swift
        animatedTabBar.animationDuration = 0.5
```

(6) Add animation type to the selected tabItem.
```swift
// Different types of animations added to TabBarItems
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        let index = tabBarController.viewControllers?.index(of: viewController)
        var animationType: KIRIAnimationtype?
        switch index {
        case 0:
            animationType = KIRIAnimationtype.Bounce
        case 1:
            animationType = KIRIAnimationtype.Transition
            animatedTabBar.animationOptions = UIView.AnimationOptions.transitionFlipFromBottom
        case 2:
            animationType = KIRIAnimationtype.Rotation
            animatedTabBar.rotationDirection = KIRIAnimationDirection.right
        case 3:
            animationType = KIRIAnimationtype.Shake
        default:
            break
        }
        animatedTabBar.animateTabBarItem(self.tabBar, index!, animationType!)
        return true
    }
```

### Animation Types:

KIRIAnimationtype :
(1) Bounce
(2) Shake
(3) Transition
(4) Rotation




## MIT License

Copyright (c) 2019 KISHAN NAKUM

Permission is hereby granted, free of charge, to any person obtaining a copy
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
