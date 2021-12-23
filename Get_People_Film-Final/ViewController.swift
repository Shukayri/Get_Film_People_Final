//
//  ViewController.swift
//  Get_People_Film-Final
//
//  Created by Abdulmajeed Shukayri on 23/12/2021.
//

import UIKit

struct Person {
    var name:String
    var gender:String
    var year:String
    var mass:String
}

class ViewController: UITableViewController {
    
    var people : [Person] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showDetails()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        people.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyPeopleCell", for: indexPath)
        
        cell.textLabel?.text = people[indexPath.row].name
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let myPeople = segue.destination as! PeopleDetailsVC
        let indexPath = sender as! IndexPath
        myPeople.people = people[indexPath.row]
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "PeopleDetailsVC", sender: indexPath)
    }
    func showDetails(){
        PeopleFilmModel.getAllPeople(completionHandler: {
            data, response, error in
            do{
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                    if let result = jsonResult["results"] as? NSArray {
                        for object in result {
                            if let jsonObject = object as? NSDictionary{
                                self.people.append(Person(name: jsonObject["name"] as! String, gender: jsonObject["gender"] as! String, year: jsonObject["birth_year"] as! String, mass: jsonObject["mass"] as! String))
                            }
                        }
                    }
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }catch{
                print("Error \(error)")
            }
        })
    }
}

