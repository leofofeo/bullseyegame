//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Leonardo Rubiano on 17.09.18.
//  Copyright © 2018 leofofeo. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet weak var closeButton: UIButton!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        closeButton.layer.cornerRadius = 10
        closeButton.clipsToBounds = true

    }
    
    
    @IBAction func closeScreen() {
        dismiss(animated: true, completion: nil)
    }
    
}
