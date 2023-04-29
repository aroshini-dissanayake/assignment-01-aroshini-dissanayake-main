//
//  CompletedVC.swift
//  BlogApp
//
//  Created by Aroshini Disaanayake on 2023-04-22.
//

import UIKit

class CompletedVC: UIViewController {

    @IBOutlet var Completed: UITableView!

        var data = [ImageEntity]()
        override func viewDidLoad() {
            super.viewDidLoad()

            // Do any additional setup after loading the view.
        }
        
        override func viewWillAppear(_ animated: Bool) {
            data = DatabaseHelper.shareInstance.fetchAllCompletedTasks()
            Completed.reloadData()
        }
    }

    extension CompletedVC : UITableViewDelegate,UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return data.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CompletedTableViewCell
            
            let oneImage = data[indexPath.row]
            cell.ctitle.text = oneImage.title
            cell.cduration.text = "\(oneImage.duration)"
            
            if let imageData = oneImage.image {
                cell.cimage.image = UIImage(data: imageData)
            }else {
                cell.cimage.image = nil
            }
            cell.layer.cornerRadius=10
            cell.layer.borderWidth=5
            cell.layer.borderColor = UIColor(red: CGFloat(235/255.0), green: CGFloat(236/255.0), blue: CGFloat(239/255.0), alpha: CGFloat(1.0)).cgColor
            print(oneImage)
            
            return cell
        }
        
        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            
            if editingStyle == UITableViewCell.EditingStyle.delete {
                let dialogMessage = UIAlertController (title: "Delete Confimation", message: "Are you sure you want to delete this Activity ?", preferredStyle: .alert)
                
                let OK = UIAlertAction(title: "OK", style: UIAlertAction.Style.default){
                    [self](action )-> Void in
                   
                    do {
                        try DatabaseHelper.shareInstance.context.delete(self.data[indexPath.row])
                    }catch {
                        print("Error in Delete")
                    }
                    DatabaseHelper.shareInstance.saveContext()
                    data.remove(at: indexPath.row)
                    tableView.deleteRows(at: [indexPath], with: .automatic)
                    
                }
                let Cancel = UIAlertAction(title: "Cancel", style: .cancel)
                {
                    (action) -> Void in
                    print("Cancel")
                }
                dialogMessage.addAction(OK)
                dialogMessage.addAction(Cancel)
                self.present(dialogMessage,animated: true, completion: nil)
        }
            
        }
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            if let activity = storyboard?.instantiateViewController(withIdentifier: "SpecificVC") as? SpecificVC {
                activity.activityTask = data[indexPath.row]
                self.navigationController?.pushViewController(activity, animated: true)
            }
        }

}
