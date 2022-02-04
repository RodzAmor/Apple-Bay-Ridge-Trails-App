//
//  ViewController.swift
//  Bay Ridge Trail
//
//  Created by Rodz Amor on 12/8/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var BayRidgeLogo: UIImageView!
    @IBOutlet var trailButtonCollection: [UIButton]!
    var buttonNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Attribute author of the icon pictures
        
        trailButtonCollection.forEach { (btn) in
            btn.layer.cornerRadius = btn.frame.height / 2.5
            btn.isHidden = false
            btn.alpha = 1
        }
        
        
    }
    
    @IBAction func didTapButton(_ sender: UIButton) {
        self.buttonNumber = sender.tag
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! MapViewController
        vc.buttonPressed = self.buttonNumber
    }
}

