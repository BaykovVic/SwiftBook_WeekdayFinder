//
//  ViewController.swift
//  WeekdayFinder
//
//  Created by Виктор Байков on 07.09.2020.
//  Copyright © 2020 Виктор Байков. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dayTextField: UITextField!
    @IBOutlet weak var monthTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func findDay(_ sender: Any) {
        guard let day = dayTextField.text, let month = monthTextField.text, let year = yearTextField.text else { return }
        
        let calendar = Calendar.current
        
        var dateComponents = DateComponents()
        dateComponents.day = Int(day)
        dateComponents.month = Int(month)
        dateComponents.year = Int(year)
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_Ru")
        dateFormatter.dateFormat = "EEEE"
        
        guard let date = calendar.date(from: dateComponents) else { return }
        let weekday = dateFormatter.string(from: date)
        resultLabel.text = weekday.capitalized
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

