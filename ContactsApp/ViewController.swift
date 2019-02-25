//
//  ViewController.swift
//  ContactsApp
//
//  Created by IMCS2 on 2/24/19.
//  Copyright © 2019 IMCS2. All rights reserved.
//

import UIKit
import Contacts

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    var contacts = [ContactsStruct]()
    var contactStore = CNContactStore()
    @IBOutlet weak var tableView: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell")
        let contactToDisplay = contacts[indexPath.row]
        cell?.textLabel?.text = "\(contactToDisplay.firstName) \(contactToDisplay.lastName)"
        cell?.detailTextLabel?.text = "\(contactToDisplay.number)"
        
        return cell!
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let popOverCV =  UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "toContactDetailVC") as! ContactDetailVC
        popOverCV.contactToDisplay = contacts[indexPath.row]
        self.addChild(popOverCV)
        popOverCV.view.frame = self.view.frame
        self.view.addSubview(popOverCV.view)
        popOverCV.didMove(toParent: self)
    }
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        contactStore.requestAccess(for: .contacts) { (success, error) in
            if success {
                print("success")
                
            }
        }
        fetchContacts()
        
    }

    func fetchContacts(){
        let key = [ CNContactGivenNameKey,
                    CNContactFamilyNameKey,
                    CNContactPhoneNumbersKey,
                    CNContactEmailAddressesKey,
                    ] as [CNKeyDescriptor]
        let request = CNContactFetchRequest(keysToFetch: key)
        
        do{
        try contactStore.enumerateContacts(with: request) { (contact, stoppingPinter) in
            
            let firstName = contact.givenName
            let lastName = contact.familyName
            let number = contact.phoneNumbers.first?.value.stringValue ?? ""
            let email = contact.emailAddresses.first?.value ?? ""
            let contactToAdd = ContactsStruct(firstName: firstName, lastname: lastName, number: number, emailID: email as String)
            self.contacts.append(contactToAdd)
            }
            tableView.reloadData()
        }catch{
            print("error in getting contact details")
        }
        
    }

}

