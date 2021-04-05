//
//  ViewController.swift
//  WeeklyFinder
//
//  Created by Nick Krasnitskiy on 05.04.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var monthTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func findDayPressed(_ sender: UIButton) {
    
        // Select current calendar
        let calendar = Calendar.current
        
        // Select necessary date components
        var dateComponents =  DateComponents()
        
        guard let day = dateTextField.text, let month = monthTextField.text, let year = yearTextField.text else {return}
        dateComponents.day = Int(day) // day
        dateComponents.month = Int(month) // month
        dateComponents.year = Int(year) // year
        
        // Create date from date componets
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "EEEE" // set the date format
        
        guard let date = calendar.date(from: dateComponents) else { return }
        let weekday = dateFormatter.string(from: date) // create the final week day
        
        resultLabel.text = weekday
    }
    
    // Hide keyboard by touch
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

