//
//  ViewController3.swift
//  Maps
//
//  Created by Rūdolfs Uiska on 20/03/2019.
//  Copyright © 2019 RudolfsUiska. All rights reserved.
//

import UIKit
protocol AddControllerDelagate {
    func returnData(loc: Descript)
    
}
class AddViewController: UIViewController {
    @IBOutlet weak var nameTxf: UITextField!
    @IBOutlet weak var descTxf: UITextField!
    @IBOutlet weak var latitudeTxf: UITextField!
    @IBOutlet weak var longitudeTxf: UITextField!
    var delegate: AddControllerDelagate?
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    @IBAction func addTouchUpInside(_ sender: Any) {
        
    }
    


}
