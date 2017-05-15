//
//  ViewController.swift
//  SorteioCopa4
//
//  Created by Rafael Tomaz Prado on 08/05/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var head1: UIPickerView!
    @IBOutlet weak var head2: UIPickerView!
    @IBOutlet weak var versus1: UILabel!
    @IBOutlet weak var versus2: UILabel!
    @IBOutlet weak var warning: UILabel!
    
    fileprivate let options = ["-", "ECA", "Estatística", "Química", "Biologia"]
    
    var first:String?
    var second:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setting delegate and datasource
        head1.delegate = self
        head1.dataSource = self
        
        head2.delegate = self
        head2.dataSource = self
        
        first = String("-")
        second = String("-")
        
        warning.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return options.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return options[row]
    }
    
    // Catpure the picker view selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(pickerView.tag == 1){
            first = options[row]
        }
        if(pickerView.tag == 2){
            second = options[row]
        }
        
    }

    @IBAction func sortear(_ sender: Any) {
        if (first == "-" || second == "-" || first == second){
            warning.isHidden = false
            versus1.text = ""
            versus2.text = ""
            return
        }
        
        warning.isHidden = true
        
        var challengers = [String]()
        
        for aaa in options{
            if(aaa != first && aaa != second && aaa != "-"){
                challengers.append(aaa)
            }
        }
        
        let index = Int(arc4random_uniform(4))
        if(index == 0 || index == 2){
            versus1.text = challengers[0]
            versus2.text = challengers[1]
        }else{
            versus1.text = challengers[1]
            versus2.text = challengers[0]
        }
    }
}

