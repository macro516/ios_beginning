//
//  ViewController.swift
//  ios_beginning_03
//
//  Created by AhnJeongho on 2016. 10. 18..
//  Copyright © 2016년 AhnJeongho. All rights reserved.
//

import UIKit
import JHChainableAnimations
import GaugeKit

class ViewController: UIViewController {

    @IBOutlet weak var cookieButton: UIButton!
    @IBOutlet weak var cookieButtonWidthConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var gauge: Gauge!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func cookieWasClicked(_ sender: AnyObject) {
//        UIView.animate(withDuration: 1.0, animations: {
//            cookie.frame.origin.y = self.view.frame.height - 30
//            }, completion: {
//                (success: Bool) -> Void in
//                UIView.animate(withDuration: 1.0, animations: {
//                    cookie.alpha = 0.0
//                    }, completion: {
//                        (success: Bool) -> Void in
//                        cookie.removeFromSuperview()
//                })
//        })
        
        cookieButtonWidthConstraint.constant -= 30
        UIView.animate(withDuration: 0.1, animations: {
            self.cookieButton.layoutIfNeeded()
            }, completion: {
                (success: Bool) -> Void in
                self.cookieButtonWidthConstraint.constant = 0
                UIView.animate(withDuration: 0.1, animations: {
                    self.cookieButton.layoutIfNeeded()
                })
        })
        
        if gauge.rate == gauge.maxValue {
            gauge.rate = 0
        } else {
            gauge.rate = gauge.rate + 1
        }
        
        for _ in 0..<Int(gauge.rate) {
            let cookie = makeCookie()
            let delay = Double(arc4random_uniform(100)) / 100.0
            cookie.wait()(delay)?.makeY()(self.view.frame.height - 30)?.spring().thenAfter()(1.0)?.makeOpacity()(0.0)?.animate()(1.0)?.animationCompletion = {
                cookie.removeFromSuperview()
            }
        }
        
        if gauge.rate == 0 {
            let cookie = makeCookie()
            
            cookie.makeScale()(10)?.thenAfter()(1.0)?.makeY()(self.view.frame.height - 30)?.rotate()(360)?.thenAfter()(1.0)?.makeOpacity()(0.0)?.animate()(1.0)?.animationCompletion = {
                cookie.removeFromSuperview()
            }
        }
    }
    
    func makeCookie() -> UIImageView {
        let view = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        view.image = UIImage(named: "princess_cookie")
        self.view.addSubview(view)
        
        view.frame.origin.x = CGFloat(arc4random_uniform(UInt32(self.view.frame.width)))
        view.frame.origin.y = CGFloat(arc4random_uniform(30))
        
        return view
    }
}

