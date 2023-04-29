//
//  SpecificVC.swift
//  BlogApp
//
//  Created by Aroshini Disaanayake on 2023-04-20.
//

import UIKit

class SpecificVC: UIViewController {

    @IBOutlet var sTitle: UILabel!
    @IBOutlet var sImg: UIImageView!
    @IBOutlet var sDuration: UILabel!
    @IBOutlet var sDesc: UITextView!
    @IBOutlet var sDate: UILabel!
    
    var activityTask : (ImageEntity)? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sTitle.text = activityTask?.title
        sDesc.text = activityTask?.desc
        if let time = activityTask?.date, let duration = activityTask?.duration {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .none
            dateFormatter.locale = Locale(identifier: "ja_JP")
            sDate.text = "\(dateFormatter.string(from: time))"

            sDuration.text = "\(duration) mins"

        }
        if let data = activityTask?.image {
            sImg.image = UIImage(data: data)
        }else {
            sImg.image = nil
        }
    }

    @IBAction func btncomplete(_ sender: Any) {
        var dialogMessage = UIAlertController(title: "Confirm Activity", message: "Are you sure, Did you Complete your Activity?", preferredStyle: .alert)
        
        let OK = UIAlertAction(title: "OK", style: .default) { [self](action) -> Void in
           
            if let vc = storyboard?.instantiateViewController(withIdentifier: "YogaViewController") as? YogaViewController{
                    self.navigationController?.pushViewController(vc, animated: true)
            }
            
            self.activityTask?.activitystatus = true
            DatabaseHelper.shareInstance.saveContext()
        }

        let Cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in
            print("Cancel")
        }
        dialogMessage.addAction(OK)
                    dialogMessage.addAction(Cancel)
                    self.present(dialogMessage, animated: true, completion: nil)
    }
  
    @IBAction func btnUpdate(_ sender: Any) {
        if let specific = storyboard?.instantiateViewController(withIdentifier: "EditVC") as? EditVC {
            specific.updateActivity = activityTask
            self.navigationController?.pushViewController(specific, animated: true)
        }
    }
    
}
