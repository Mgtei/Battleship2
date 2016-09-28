//
//  ColorViewController.swift
//  segues
//
//  Created by Margaret Ikeda on 9/28/16.
//  Copyright © 2016 Margaret Ikeda. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {
    var color: String!
    
    @IBOutlet weak var colorViewLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.colorViewLabel.text = color
        
    }
}
