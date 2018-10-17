

// Created on: October-16-2018
// Created by: Wendi Yu
// Created for: ICS3U
// This program is the UIKit calculate for cost of pizza 
// this will be commented out when code moved to Xcode
import PlaygroundSupport


import UIKit

class ViewController : UIViewController {
    // this is the main view controller, that will show the UIKit elements
    
    // properties
    let LARGEPIZZA : Float = 6.00
    let EXTRALARGEPIZZA : Float = 10.00
    let TOPPING1 : Float = 1.00
    let TOPPING2 : Float = 1.75
    let TOPPING3 : Float = 2.50
    let TOPPING4 : Float = 3.25
    let HST : Float = 0.13
    
    let questionLable = UILabel()
    let toppingLable = UILabel()
    let sizeOfPizzaTextField = UITextField()
    let numberOfToppingTextField = UITextField()
    let subtotalLable = UILabel()
    let taxLable = UILabel()
    let totalLable = UILabel()
    let answerButton = UIButton()
    
    override func viewDidLoad() {
        // UI
        super.viewDidLoad()
        
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.view = view
        
        questionLable.text = "Enter these following number for specific size of pizza 1) Large pizza 2) Extra large pizza"
        view.addSubview(questionLable)
        questionLable.translatesAutoresizingMaskIntoConstraints = false
        questionLable.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        questionLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        
        sizeOfPizzaTextField.borderStyle = UITextBorderStyle.roundedRect
        sizeOfPizzaTextField.placeholder = "Enter 1 or 2   "
        view.addSubview(sizeOfPizzaTextField)
        sizeOfPizzaTextField.translatesAutoresizingMaskIntoConstraints = false
        sizeOfPizzaTextField.topAnchor.constraint(equalTo: questionLable.bottomAnchor, constant: 5).isActive = true
        sizeOfPizzaTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        toppingLable.text = "Enter one of following number for specific topping 1) Topping1 2) Topping2 3) Topping3 4) Topping4 "
        view.addSubview(toppingLable)
        toppingLable.translatesAutoresizingMaskIntoConstraints = false
        toppingLable.topAnchor.constraint(equalTo: sizeOfPizzaTextField.topAnchor, constant: 40).isActive = true
        toppingLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        numberOfToppingTextField.borderStyle = UITextBorderStyle.roundedRect
        numberOfToppingTextField.placeholder = "Enter 1, 2, 3 or 4   "
        view.addSubview(numberOfToppingTextField)
        numberOfToppingTextField.translatesAutoresizingMaskIntoConstraints = false
        numberOfToppingTextField.topAnchor.constraint(equalTo: toppingLable.bottomAnchor, constant: 20).isActive = true
        numberOfToppingTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        answerButton.setTitle("Calculate", for: .normal)
        answerButton.setTitleColor(.blue, for: .normal)
        answerButton.addTarget(self, action: #selector(calculateCostOfPizza), for: .touchUpInside)
        view.addSubview(answerButton)
        answerButton.translatesAutoresizingMaskIntoConstraints = false
        answerButton.topAnchor.constraint(equalTo: numberOfToppingTextField.bottomAnchor, constant: 10).isActive = true
        answerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        subtotalLable.text = nil
        view.addSubview(subtotalLable)
        subtotalLable.translatesAutoresizingMaskIntoConstraints = false
        subtotalLable.topAnchor.constraint(equalTo: answerButton.bottomAnchor, constant: 20).isActive = true
        subtotalLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        taxLable.text = nil
        view.addSubview(taxLable)
        taxLable.translatesAutoresizingMaskIntoConstraints = false
        taxLable.topAnchor.constraint(equalTo: subtotalLable.bottomAnchor, constant: 20).isActive = true
        taxLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        totalLable.text = nil
        view.addSubview(totalLable)
        totalLable.translatesAutoresizingMaskIntoConstraints = false
        totalLable.topAnchor.constraint(equalTo: taxLable.bottomAnchor, constant: 20).isActive = true
        totalLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
    }
    
    @objc func calculateCostOfPizza() {
        // show answers 
        
        var PIZZACOST : Float = 0.00
        var TOPPINGCOST : Float = 0.00
        
        var sizeOfPizza : Float = Float(sizeOfPizzaTextField.text!)!
        var numberOfTopping : Float = Float(numberOfToppingTextField.text!)!
        
        //pizza cost 
        
        if sizeOfPizza == 1 {
            PIZZACOST = LARGEPIZZA
        }
        else if sizeOfPizza == 2 {
            PIZZACOST = EXTRALARGEPIZZA
        } 
        
        //Topping cost
        
        if numberOfTopping == 1 {
            TOPPINGCOST = TOPPING1
        }
        else if numberOfTopping == 2 {
            TOPPINGCOST = TOPPING2
        }
        else if numberOfTopping == 3 {
            TOPPINGCOST = TOPPING3
        }
        else if numberOfTopping == 4 {
            TOPPINGCOST = TOPPING4
        }

        
        let subtotal = PIZZACOST + TOPPINGCOST
        let tax = subtotal * HST
        let total = subtotal + tax
        subtotalLable.text = String(format: "Subtotal : $ %.2f", subtotal)
        taxLable.text = String(format: "HST : $ %.2f", tax)
        totalLable.text = String(format: "Total :$ %.2f",total) 
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

// this will be commented out when code moved to Xcode
PlaygroundPage.current.liveView = ViewController()
