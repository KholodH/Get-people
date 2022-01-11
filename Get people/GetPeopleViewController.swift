//
//  ViewController.swift
//  Get people
//
//  Created by administrator on 11/01/2022.
//

import UIKit

class GetPeopleViewController: UIViewController {
    @IBOutlet weak var pTable: UITableView!
    var peopleList = [PeopleData]()

    override func viewDidLoad() {
        super.viewDidLoad()
        pTable.dataSource = self
      
                StarWarsModel.getAllPeople(completionHandler: { // passing what becomes "completionHandler" in the 'getAllPeople' function definition in StarWarsModel.swift
                    data, response, error in
                        do {
                            // Try converting the JSON object to "Foundation Types" (NSDictionary, NSArray, NSString, etc.)
                            if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                                if let results = jsonResult["results"] as? NSArray {
                                    for person in results {
                                        let personDict = person as! NSDictionary
                                        self.peopleList.append(
                                        PeopleData(
                                            name:personDict["name"]! as! String,
                                            gender: personDict["gender"]! as! String,
                                            birthYear: personDict["birth_year"]! as! String,
                                            mass: personDict["mass"]! as! String
                                        )
                                    )

                                       
                                    }
                                }
                            }
                            DispatchQueue.main.async {
                                self.pTable.reloadData()
                            }
                        } catch {
                            print("Something went wrong")
                        }
                })
            }

}
    
    


extension GetPeopleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peopleList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! PeopleTableViewCell
        cell.nameLabel.text = " \(peopleList[indexPath.row].name)"
        cell.secondL.text = " \(peopleList[indexPath.row].gender)"
        cell.thirdL.text = " \(peopleList[indexPath.row].mass)"
        cell.fourthL.text = " \(peopleList[indexPath.row].birthYear)"

        return cell
    }
    

    }


struct PeopleData {
    var name: String
    var gender: String
    var birthYear: String
    var mass: String
}
