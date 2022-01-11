//
//  GetFlimsViewController.swift
//  Get people
//
//  Created by administrator on 11/01/2022.
//

import UIKit

class GetFlimsViewController: UIViewController {
 var filmsList = [String]()
    @IBOutlet weak var filmTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        filmTable.dataSource = self
    
        FlimsModel.getAllFilms(completionHandler: { // passing what becomes "completionHandler" in the 'getAllPeople' function definition in StarWarsModel.swift
            data, response, error in
                do {
                    // Try converting the JSON object to "Foundation Types" (NSDictionary, NSArray, NSString, etc.)
                    if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                        if let results = jsonResult["results"] as? NSArray {
                            for person in results {
                                let personDict = person as! NSDictionary
                                self.filmsList.append(personDict["title"]! as! String)
                            }
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


extension GetFlimsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filmsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell2", for: indexPath)
        cell.textLabel?.text = filmsList[indexPath.row]
        return cell
    }
    
    
}

