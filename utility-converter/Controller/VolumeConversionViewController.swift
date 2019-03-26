//
//  VolumeViewController.swift
//  utility-converter
//
//  Created by Brion Silva on 25/03/2019.
//  Copyright © 2019 Brion Silva. All rights reserved.
//
import UIKit

class VolumeConversionViewController: UIViewController {
    
    @IBOutlet weak var litreTextField: UITextField!
    @IBOutlet weak var millilitreTextField: UITextField!
    @IBOutlet weak var gallonTextField: UITextField!
    @IBOutlet weak var pintTextField: UITextField!
    @IBOutlet weak var fluidOunceTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Set Text Field Styles
        litreTextField.borderStyle = UITextField.BorderStyle.roundedRect
        litreTextField._lightPlaceholderColor(UIColor.lightText)
        
        millilitreTextField.borderStyle = UITextField.BorderStyle.roundedRect
        millilitreTextField._lightPlaceholderColor(UIColor.lightText)
        
        gallonTextField.borderStyle = UITextField.BorderStyle.roundedRect
        gallonTextField._lightPlaceholderColor(UIColor.lightText)
        
        pintTextField.borderStyle = UITextField.BorderStyle.roundedRect
        pintTextField._lightPlaceholderColor(UIColor.lightText)
        
        fluidOunceTextField.borderStyle = UITextField.BorderStyle.roundedRect
        fluidOunceTextField._lightPlaceholderColor(UIColor.lightText)
     }
    
    @IBAction func handleLitreTextFieldChange(_ textField: UITextField) {
        let textField = litreTextField
        let unit = VolumeUnit.litre
        updateTextFields(textField: textField!, unit: unit)
    }
    
    @IBAction func handleMillilitreTextFieldChange(_ textField: UITextField) {
        let textField = millilitreTextField
        let unit = VolumeUnit.millilitre
        updateTextFields(textField: textField!, unit: unit)
    }
    
    @IBAction func handleGallonTextFieldChange(_ textField: UITextField) {
        let textField = gallonTextField
        let unit = VolumeUnit.gallon
        updateTextFields(textField: textField!, unit: unit)
    }
    
    @IBAction func handlePintTextFieldChange(_ textField: UITextField) {
        let textField = pintTextField
        let unit = VolumeUnit.pint
        updateTextFields(textField: textField!, unit: unit)
    }
    
    @IBAction func handleFluidOunceTextFieldChange(_ textField: UITextField) {
        let textField = fluidOunceTextField
        let unit = VolumeUnit.fluidOunce
        updateTextFields(textField: textField!, unit: unit)
    }
    
    func updateTextFields(textField: UITextField, unit: VolumeUnit) -> Void {
        if let input = textField.text {
            if input.isEmpty {
                clearTextFields()
            } else {
                let value = Double(input)!
                let volume = Volume(unit: unit, value: value)
                
                for _unit in VolumeUnit.getAllUnits {
                    if _unit == unit {
                        continue
                    }
                    let textField = mapUnitToTextField(unit: _unit)
                    let result = volume.convert(unit: _unit)
                    textField.text = String(result)
                }
            }
        }
    }
    
    func mapUnitToTextField(unit: VolumeUnit) -> UITextField {
        var textField = litreTextField
        switch unit {
        case .litre:
            textField = litreTextField
        case .millilitre:
            textField = millilitreTextField
        case .gallon:
            textField = gallonTextField
        case .pint:
            textField = pintTextField
        case .fluidOunce:
            textField = fluidOunceTextField
        }
        return textField!
    }
    
    func clearTextFields() {
        litreTextField.text = ""
        millilitreTextField.text = ""
        gallonTextField.text = ""
        pintTextField.text = ""
        fluidOunceTextField.text = ""
    }
}
