//
//  TableViewController.swift
//  Get_People_Film-Final
//
//  Created by Abdulmajeed Shukayri on 23/12/2021.
//

import UIKit
struct Film {
    var title:String
    var release_date:String
    var opening_crawl:String
    var director:String
}

class TableViewController: UITableViewController {

    var films : [Film] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showDetails()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        films.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyFilmCell", for: indexPath)
        
        
        cell.textLabel?.text = films[indexPath.row].title
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let filmsDVC = segue.destination as! FilmDetailsVC
        let indexPath = sender as! IndexPath
        filmsDVC.myFilm = films[indexPath.row]
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "FilmDetailsVC", sender: indexPath)
    }
    func showDetails(){
        PeopleFilmModel.getAllFilms(completionHandler: {
            data, response, error in
            do{
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                    if let result = jsonResult["results"] as? NSArray {
                        for object in result {
                            if let jsonObject = object as? NSDictionary{
                                self.films.append(Film(title: jsonObject["title"] as! String, release_date: jsonObject["release_date"] as! String, opening_crawl: jsonObject["opening_crawl"] as! String, director: jsonObject["director"] as! String))
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
