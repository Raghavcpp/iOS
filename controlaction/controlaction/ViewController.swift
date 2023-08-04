//
//  ViewController.swift
//  controlaction
//
//  Created by Apple Lab on 01/08/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var ageSlider: UISlider!
    @IBOutlet weak var classField: UITextField!
    @IBOutlet weak var phoneNumberField: UITextField!
    @IBOutlet weak var submitButton: UIButton!

    @IBOutlet weak var activePlayerSwitch: UISwitch!
    @IBOutlet weak var sliderValueLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        ageSlider.value = 20
        activePlayerSwitch.isOn = false
        updateSliderValueLabel()
    }

    @IBAction func raghav(_ sender: UIButton) {
        let firstName = firstNameField.text ?? ""
        let lastName = lastNameField.text ?? ""
        let age = Int(ageSlider.value)
        let userClass = classField.text ?? ""
        let phoneNumber = phoneNumberField.text ?? ""
        let isActivePlayer = activePlayerSwitch.isOn

        let sentence = "Name: \(firstName) \(lastName), Age: \(age), Class: \(userClass), Phone: \(phoneNumber), Active Player: \(isActivePlayer)"
        print(sentence)
    }
    @IBAction func sliderValueChanged(_ sender: UISlider) {
           updateSliderValueLabel() // Update the label when slider value changes
       }

    func updateSliderValueLabel() {
           let sliderValue = Int(ageSlider.value)
           sliderValueLabel.text = "Age: \(sliderValue)"
       }
}



//    @IBOutlet weak var field: UITextField!
//    @IBOutlet weak var slider: UISlider!
//
//    @IBOutlet weak var `switch`: UISwitch!
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        slider.value = 20
//        `switch`.isOn = false
//
//        // Do any additional setup after loading the view.
//    }
//
//    @IBAction func raghav(_ sender: UIButton) {
//        print("name is: \(field.text ?? "")")
//        print("age is: \(Int(slider.value))")
//        print("Are you an active player: \(`switch`.isOn)")
//    }
//
//    @IBAction func slider(_ sender: UISlider) {
//
//    }
//
//    @IBAction func `switch`(_ sender: UISwitch) {
//    }
