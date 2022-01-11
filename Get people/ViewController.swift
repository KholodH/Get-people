//
//  ViewController.swift
//  Get people
//
//  Created by administrator on 11/01/2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var pTable: UITableView!
    var peopleList = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        pTable.dataSource = self
    
                // specify the url that we will be sending the GET request to
                let url = URL(string: "https://swapi.dev/api/people/?format=json")
                // create a URLSession to handle the request tasks
                let session = URLSession.shared
                // create a "data task" to make the request and run completion handler
                let task = session.dataTask(with: url!, completionHandler: {
                    // see: Swift closure expression syntax
                    data, response, error in
                    // data -> JSON data, response -> headers and other meta-information, error-> if one occurred
                    // "do-try-catch" blocks execute a try statement and then use the catch statement for errors
                    do {
                        // try converting the JSON object to "Foundation Types" (NSDictionary, NSArray, NSString, etc.)
                        if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                                        if let results = jsonResult["results"] {
                                            // coercing the results object as an NSArray and then storing that in resultsArray
                                            let resultsArray = results as! NSArray
                                            // now we can run NSArray methods like count and firstObject
                                            for result in resultsArray {
                                                if let data = result as? NSDictionary {
                                                    if let result = data["name"] {
                                                        let name = result as! String
                                                        self.peopleList.append(name)
                                                    }
                                                }
                                            }
                                            DispatchQueue.main.async {
                                                self.pTable.reloadData()
                                            }
                                        }
                                    }
                                } catch {
                                    print(error)
                                }
                            })
                        // execute the task and then wait for the response
                // to run the completion handler. This is async!
                task.resume()
        }
    
    }


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peopleList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        cell.textLabel?.text = peopleList[indexPath.row]
        return cell
    }
    
    
}

