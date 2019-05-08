//
//  ViewController2.swift
//  Maps
//
//  Created by Students on 06/03/2019.
//  Copyright © 2019 RudolfsUiska. All rights reserved.
//

import UIKit
protocol FilterControllerDelagate {
    func enabledRangeFilter (dist: Bool)
}
class FilterViewController: UIViewController {
    @IBOutlet weak var rangeFilterSwch: UISwitch!
     var delegate: FilterControllerDelagate?
    override func viewDidLoad() {
        super.viewDidLoad()
        rangeFilterSwch.isOn =  UserDefaults.standard.bool(forKey: "switchState")

    }
    
    @IBAction func rangeValueChanged(_ sender: Any) {
        UserDefaults.standard.set((sender as AnyObject).isOn, forKey: "switchState")
        var valueDist: Bool
        if rangeFilterSwch.isOn{
            valueDist = true
        }else {
            valueDist = false
        }
        if delegate != nil{
            delegate?.enabledRangeFilter(dist: valueDist)
        }
    }
    
}
