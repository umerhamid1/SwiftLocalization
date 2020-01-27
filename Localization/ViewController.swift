//
//  ViewController.swift
//  Localization
//
//  Created by umer hamid on 1/27/20.
//  Copyright © 2020 umer hamid. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segment: UISegmentedControl!
    
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func segmentAction(_ sender: Any) {
        
        if segment.selectedSegmentIndex == 0 {  // english
            
            self.changeLang(lang: "en")
            
        }else{ // swedish
            self.changeLang(lang: "sv")
        }
    }
    
    func changeLang( lang : String){
        firstName.text = "FirstNameKey".localizableString(loc: lang)
        lastName.text = "LastNameKey".localizableString(loc: lang)
    }
    

}

extension String{
    
    func localizableString(loc : String) -> String{
        
        let path = Bundle.main.path(forResource: loc, ofType: "lproj")
        let bundle = Bundle(path: path!)
        
        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
    }
}

