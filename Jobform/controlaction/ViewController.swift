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
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmPasswordField: UITextField!
    @IBOutlet weak var phoneNumberField: UITextField!
    @IBOutlet weak var ageSlider: UISlider!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!
    @IBOutlet weak var termsSwitch: UISwitch!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var passwordVisibilityButton: UIButton!

    private var isPasswordVisible = false

    override func viewDidLoad() {
        super.viewDidLoad()
        ageSlider.value = 20
        updateAgeLabel()
        passwordVisibilityButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        passwordVisibilityButton.setImage(UIImage(systemName: "eye.fill"), for: .selected)
    }

    @IBAction func ageSliderValueChanged(_ sender: UISlider) {
        updateAgeLabel()
    }

    @IBAction func registerButtonTapped(_ sender: UIButton) {
        registerUser()
    }

    @IBAction func togglePasswordVisibility(_ sender: UIButton) {
        isPasswordVisible.toggle()
        passwordField.isSecureTextEntry = !isPasswordVisible
        passwordVisibilityButton.isSelected = isPasswordVisible
    }

    func updateAgeLabel() {
        let ageValue = Int(ageSlider.value)
        ageLabel.text = "Age: \(ageValue)"
    }

    func registerUser() {
        guard let firstName = firstNameField.text, !firstName.isEmpty,
              let lastName = lastNameField.text, !lastName.isEmpty,
              let email = emailField.text, !email.isEmpty,
              let password = passwordField.text, !password.isEmpty,
              let confirmPassword = confirmPasswordField.text, !confirmPassword.isEmpty,
              let phoneNumber = phoneNumberField.text, !phoneNumber.isEmpty
        else {
            showAlert(message: "Please fill in all the required fields.")
            return
        }

        if password != confirmPassword {
            showAlert(message: "Passwords do not match.")
            return
        }

        if !isValidEmail(email) {
            showAlert(message: "Invalid email format.")
            return
        }

        if !termsSwitch.isOn {
            showAlert(message: "Please agree to the terms and conditions.")
            return
        }
        print("Name: \(firstName) \(lastName), Email Id: \(email), Password: \(password), Phone Number: \(phoneNumber), \(ageLabel.text ?? "0"), Gender: \(selectedGender()), Are you an Active Player: \(termsSwitch.isOn)")
        showAlert(message: "Registration Successful!")
    }

    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }

    func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    func selectedGender() -> String {
        switch genderSegmentedControl.selectedSegmentIndex {
        case 0:
            return "Male"
        case 1:
            return "Female"
        default:
            return "Unknown"
        }
    }
}
