//: Playground - noun: a place where people can play

import UIKit

protocol Shakeable {}

extension Shakeable where Self: UIView {
    
    // default shake implementation
    func shake() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 5
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 4.0, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.y + 4.0, y: self.center.y))
        layer.add(animation, forKey: "position")
    }
}

class FoodImageView: UIImageView, Shakeable {
    // other customization here
}

class ActionButton: UIButton, Shakeable {
    // other customization here
}

class ViewController: UIViewController {
    
    @IBOutlet weak var foodImageView: FoodImageView!
    @IBOutlet weak var actionButton: ActionButton!
    
    @IBAction func onShakeButtonTap(sender: AnyObject) {
        foodImageView.shake()
        actionButton.shake()
    }
}
