//
//  ViewController.swift
//  BlogApp
//
//  Created by Aroshini Disaanayake on 2023-04-19.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var images = [ImageEntity]()
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        images = DatabaseHelper.shareInstance.fetchAllPendingTasks()
        print(images)
        tableView.reloadData()
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        let row = images[indexPath.row]
        
        cell.title.text = row.title
        
        if let data = row.image {
            cell.img.image = UIImage(data: data)
        }
        else {
            cell.img.image = nil
        }
        print(cell)
        return cell
    }
    
    //delete
    //update
    
}

