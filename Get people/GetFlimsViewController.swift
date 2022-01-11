//
//  GetFlimsViewController.swift
//  Get people
//
//  Created by administrator on 11/01/2022.
//

import UIKit

class GetFlimsViewController: UIViewController {
 var filmsList = [FilmDetails]()
    @IBOutlet weak var filmTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        filmTable.dataSource = self
        filmTable.delegate = self

        FlimsModel.getAllFilms(completionHandler: { // passing what becomes "completionHandler" in the 'getAllPeople' function definition in StarWarsModel.swift
            data, response, error in
                do {
                    // Try converting the JSON object to "Foundation Types" (NSDictionary, NSArray, NSString, etc.)
                    if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                        if let results = jsonResult["results"] as? NSArray {
                            for person in results {
                                let filmDict  = person as! NSDictionary
                                self.filmsList.append(
                                                             FilmDetails(
                                                                 filmTitle: filmDict["title"]! as! String,
                                                                 openingCrawl: filmDict["opening_crawl"]! as! String,
                                                                 director: filmDict["director"]! as! String,
                                                                 releaseDate: filmDict["release_date"]! as! String
                                                             )
                                                         )                            }
                        }
                    }
                    DispatchQueue.main.async {
                        self.filmTable.reloadData()
                    }
                } catch {
                    print("Something went wrong")
                }
        })
    }
    
    }


extension GetFlimsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filmsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = filmTable.dequeueReusableCell(withIdentifier: "MyCell2") as! FilmTableViewCell
        cell.name.text = filmsList[indexPath.row].filmTitle
        cell.dirLabel.text = filmsList[indexPath.row].director
        cell.yearLabel.text = filmsList[indexPath.row].openingCrawl
        cell.exLabel.text = filmsList[indexPath.row].releaseDate

        return cell
    }
    
    
}

struct FilmDetails {
    var filmTitle: String
    var openingCrawl: String
    var director: String
    var releaseDate: String
}
