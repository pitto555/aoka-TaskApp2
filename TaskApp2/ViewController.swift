//
//  ViewController.swift
//  TaskApp2
//
//  Created by 光気増井 on 2021/03/17.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var segmentController: UISegmentedControl!
    
    @IBOutlet private weak var answerLabel: UILabel!
    
    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var textField2: UITextField!
    
    enum CalclationError: Error {
        case divisionByZero
    }
    
    @IBAction func answerButton(_ sender: Any) {
        
        do{
            let answer = try calulate()
            answerLabel.text = String(answer)
        } catch let error as CalclationError{
            switch error  {
            case .divisionByZero:
                print("0乗算になっています。")
                answerLabel.text = "割る数には0以外を入力して下さい。"
            }
        }catch {
        }
    }
    
    private func calulate() throws -> Float {
        let number = Double(textField.text!) ?? 0
        let number2 = Double(textField2.text!) ?? 0
        
        switch segmentController.selectedSegmentIndex  {
        case 0:
            return Float(number + number2)
        case 1:
            return Float(number - number2)
        case 2:
            return Float(number * number2)
        default:
            guard number2 != 0 else {
                throw CalclationError.divisionByZero
            }
            return Float(number / number2)
        }
    }
}




