//
//  ViewController.swift
//  SimpleCalciOSPart2
//
//  Created by Matt Bond on 10/27/16.
//  Copyright © 2016 Matt Bond. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var numbers: [Int] = []
    private var allNumbers: [Int] = []
    private var left: Int = 0
    private var right: Int = 0
    private var operand: String = ""
    @IBOutlet weak var displayLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // changes label to the number the user is typing in or a blank string if the calculator has been cleared
    private func changeLabel() {
        if numbers.count > 0 {
            var newLabelText = ""
            for index in 0...numbers.count - 1 {
                let num = numbers[index]
                newLabelText += "\(num)"
            }
            self.displayLabel.text = newLabelText
        } else {
            self.displayLabel.text = ""
        }
    }
    
    // changes label to passed in value
    private func changeLabel(_ num: Int) {
        let newLabelText = "\(num)"
        self.displayLabel.text = newLabelText
    }
    
    // takes two integers and raises the base to the desired exponent
    private func pow(_ base: Int, _ exponent: Int) -> Int {
        if exponent == 0 {
            return 1
        } else {
            var total = 1
            for _ in 1...exponent {
                total = total * base
            }
            return total
        }
    }

    @IBAction func one(_ sender: AnyObject) {
        numbers.insert(1, at: numbers.count)
        self.changeLabel()
    }
    
    @IBAction func two(_ sender: AnyObject) {
        numbers.insert(2, at: numbers.count)
        self.changeLabel()
    }
    
    @IBAction func three(_ sender: AnyObject) {
        numbers.insert(3, at: numbers.count)
        self.changeLabel()
    }
    
    @IBAction func four(_ sender: AnyObject) {
        numbers.insert(4, at: numbers.count)
        self.changeLabel()
    }
    
    @IBAction func five(_ sender: AnyObject) {
        numbers.insert(5, at: numbers.count)
        self.changeLabel()
    }
    
    @IBAction func six(_ sender: AnyObject) {
        numbers.insert(6, at: numbers.count)
        self.changeLabel()
    }
    
    @IBAction func seven(_ sender: AnyObject) {
        numbers.insert(7, at: numbers.count)
        self.changeLabel()
    }
    
    @IBAction func eight(_ sender: AnyObject) {
        numbers.insert(8, at: numbers.count)
        self.changeLabel()
    }
    
    @IBAction func nine(_ sender: AnyObject) {
        numbers.insert(9, at: numbers.count)
        self.changeLabel()
    }
    
    @IBAction func zero(_ sender: AnyObject) {
        numbers.insert(0, at: numbers.count)
        self.changeLabel()
    }
    
    // gets the value the user enters and returns it as an int to allow for manipulation
    private func sum() -> Int {
        var total = 0
        var index = 0
        while index < numbers.count {
            total += numbers[index] * self.pow(10, numbers.count - (1 + index))
            index += 1
        }
        numbers.removeAll()
        return total;
    }
    
    

    
    @IBAction func add(_ sender: AnyObject) {
        self.operand = "+"
        self.left = self.sum()
    }
    
    @IBAction func subtract(_ sender: AnyObject) {
        self.operand = "-"
        self.left = self.sum()
    }
    
    @IBAction func multiply(_ sender: AnyObject) {
        self.operand = "*"
        self.left = self.sum()
    }
    
    @IBAction func divide(_ sender: AnyObject) {
        self.operand = "/"
        self.left = self.sum()
    }
    
    @IBAction func mod(_ sender: AnyObject) {
        self.operand = "%"
        self.left = self.sum()
    }
    
    @IBAction func equals(_ sender: AnyObject) {
        self.right = self.sum()
        if self.operand == "+" {
            self.changeLabel(left + right)
        } else if self.operand == "-" {
            self.changeLabel(left - right)
        } else if self.operand == "*" {
            self.changeLabel(left * right)
        } else if self.operand == "/" {
            self.changeLabel(left / right)
        } else if self.operand == "%" {
            self.changeLabel(left % right)
        }
        allNumbers.append(left)
        allNumbers.append(right)
    }
    
    @IBAction func factorial(_ sender: AnyObject) {
        left = self.sum()
        var total = 1
        for i in 1...left {
            total = total * i
        }
        self.changeLabel(total)
    }
    
    @IBAction func count(_ sender: AnyObject) {
        allNumbers.append(self.sum())
        self.changeLabel(allNumbers.count)
    }
    
    @IBAction func average(_ sender: AnyObject) {
        var total = 0
        for index in 0...allNumbers.count - 1 {
            total += allNumbers[index]
        }
        self.changeLabel(total / allNumbers.count)
    }
    
    @IBAction func clear(_ sender: AnyObject) {
        numbers.removeAll()
        allNumbers.removeAll()
        self.changeLabel()
        self.left = 0
        self.right = 0
        self.operand = ""
    }
    
    @IBAction func history(_ sender: AnyObject) {
    
    }
}

