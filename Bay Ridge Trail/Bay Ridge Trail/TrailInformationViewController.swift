//
//  TrailInformationViewController.swift
//  Bay Ridge Trail
//
//  Created by Rodz Amor on 1/5/21.
//

import UIKit

class TrailInformationViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var button: UIButton!
    //@IBOutlet weak var lb: UILabel!
    var selected: String = ""
    
    let options = ["Farmhouse Trail", "Pond View Trail", "Inspiration Point Trail", "Fisherman Trail", "Hull-to-Wainwright Cut-Through Trail", "Railroad", "Hollow Tree"] //, "Grand Hotel Site", "Historic Home"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.delegate = self
        picker.dataSource = self
        
        button.layer.cornerRadius = button.frame.height / 2.5
        
    }

    @IBAction func selectDetails(_ sender: UIButton) {
        
        selected = options[self.picker.selectedRow(inComponent: 0)]
        
        switch selected {
        case "Farmhouse Trail":
            performSegue(withIdentifier: "Farmhouse Information", sender: nil)
        case "Pond View Trail":
            performSegue(withIdentifier: "Pond View Information", sender: nil)
        case "Railroad":
            performSegue(withIdentifier: "Railroad Information", sender: nil)
        case "Inspiration Point Trail":
            performSegue(withIdentifier: "Inspiration Point Information", sender: nil)
        case "Fisherman Trail":
            performSegue(withIdentifier: "Fisherman Trail Information", sender: nil)
        case "Hull-to-Wainwright Cut-Through Trail":
            performSegue(withIdentifier: "Hull to Wainwright Trail Information", sender: nil)
        case "Hollow Tree":
            performSegue(withIdentifier: "Hollow Tree Information", sender: nil)
//        case "Grand Hotel Site":
//            performSegue(withIdentifier: "Grand Hotel Information", sender: nil)
//        case "Historic Home":
//            performSegue(withIdentifier: "Historic Home Information", sender: nil)
        default: break
        }
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return options.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return options[row]
    }
    
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        var selected = options[picker.selectedRow(inComponent: 0)]
//    }
    
}

//extension TrailInformationViewController: UIPickerViewDataSource {
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return options.count
//    }
//
//
//}
//
//extension TrailInformationViewController: UIPickerViewDelegate {
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return options[row]
//    }
//}
