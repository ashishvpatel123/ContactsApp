//
//  ContactDetailVC.swift
//  ContactsApp
//
//  Created by IMCS2 on 2/24/19.
//  Copyright © 2019 IMCS2. All rights reserved.
//

import UIKit

class ContactDetailVC: UIViewController {

    var contactToDisplay : ContactsStruct!
    
    @IBOutlet weak var detailLable: UILabel!
    @IBAction func cancleButtonClicked(_ sender: Any) {
        self.view.removeFromSuperview()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print(contactToDisplay)
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        // Do any additional setup after loading the view.
    
        detailLable.text = "\(contactToDisplay.firstName) \(contactToDisplay.lastName) \n \(contactToDisplay.number) \n \(contactToDisplay.emailID)"
    }
    
    
    
}
