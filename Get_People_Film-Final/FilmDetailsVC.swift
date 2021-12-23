//
//  FilmDetailsVC.swift
//  Get_People_Film-Final
//
//  Created by Abdulmajeed Shukayri on 23/12/2021.
//

import UIKit

class FilmDetailsVC: UIViewController {
    
    @IBOutlet weak var myFilmTitle:UILabel!
    
    @IBOutlet weak var myFilmDirector:UILabel!
    
    @IBOutlet weak var releaseDate:UILabel!
    
    @IBOutlet weak var myFilmCrawl:UILabel!
    
    var myFilm: Film?

    override func viewDidLoad() {
        super.viewDidLoad()
        showDetails()
}
    func showDetails(){
        
        if let realFilm = myFilm {
            myFilmTitle.text = "Title: \(realFilm.title)"
            myFilmDirector.text = "Director: \(realFilm.director)"
            releaseDate.text = "ReleaseDate: \(realFilm.release_date)"
            myFilmCrawl.text = "Crawl: \(realFilm.opening_crawl)"
    }
    }
}
