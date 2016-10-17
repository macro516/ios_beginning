//
//  ViewController.swift
//  ios_beginning_02
//
//  Created by AhnJeongho on 2016. 10. 17..
//  Copyright © 2016년 AhnJeongho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func ButtonWasTapped(_ sender: AnyObject) {
        myLabel.text = "Long" + myLabel.text!
    }
}

