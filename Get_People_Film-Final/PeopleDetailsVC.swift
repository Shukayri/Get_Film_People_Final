//
//  PeopleDetailsVC.swift
//  Get_People_Film-Final
//
//  Created by Abdulmajeed Shukayri on 23/12/2021.
//

import UIKit

class PeopleDetailsVC: UIViewController {
    
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var genderLbl: UILabel!
    
    @IBOutlet weak var yearLbl: UILabel!
    
    @IBOutlet weak var massLbl: UILabel!
    
    var people: Person?

    override func viewDidLoad() {
        super.viewDidLoad()
        showDetail()
        
        }
    func showDetail(){
        if let thePerson = people {
            nameLbl.text = "Name: \(thePerson.name)"
            genderLbl.text = "Gender: \(thePerson.gender)"
            yearLbl.text = "Year: \(thePerson.year)"
            massLbl.text = "Mass: \(thePerson.mass)"
    }

}
}
