//
//  DetailVC.swift
//  BlogApp
//
//  Created by Aroshini Disaanayake on 2023-04-20.
//

import UIKit

class DetailVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var dTitle: UITextField!
    @IBOutlet var dDesc: UITextField!
    @IBOutlet var selectImage: UIImageView!
    @IBOutlet var dDuration: UISlider!
    @IBOutlet var dDate: UIDatePicker!
    @IBOutlet var dValue: UILabel!
    
//    var image: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dValue.text = "\(Int(dDuration.value))"
        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnSelectImage(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        present(picker, animated: true)
    }
    
    @IBAction func btnSave(_ sender: Any) {
        
        if let title = dTitle.text, let desc = dDesc.text{
            if title != "" || desc != "" {
                let newData = ImageEntity(context: DatabaseHelper.shareInstance.context)
                newData.title = title
                newData.desc = desc
                newData.duration = Int16(dDuration.value)
                newData.date = dDate.date
                newData.image = selectImage.image?.jpegData(compressionQuality: 1)
                newData.activitystatus = false
                DatabaseHelper.shareInstance.saveContext()
                print(newData)
                
                let alertController = UIAlertController(title: "Success", message: "Activity Added Successfully!!!!", preferredStyle: .alert)
                
                let action = UIAlertAction(title: "OK", style: .default){ [self] (action) -> Void in
                    if let vc = storyboard?.instantiateViewController(withIdentifier: "YogaViewController") as? YogaViewController{
                        self.navigationController?.pushViewController(vc, animated: true)
                    }
                }
                alertController.addAction(action)
                present(alertController, animated: true, completion: nil)
            }
            else{
                let alertController = UIAlertController(title: "Validation Error", message: "Please fill all the fileds", preferredStyle: .alert)
                
                let action = UIAlertAction(title: "OK", style: .default){ [
                    self] (action) -> Void in
                }
                
                alertController.addAction(action)
                present(alertController, animated: true, completion: nil)
            }
        }
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let userPickedImage = info[.editedImage] as? UIImage else { return}
        selectImage.image = userPickedImage
        
        picker.dismiss(animated: true)
    }

    @IBAction func onSliderChange(_ sender: Any) {
        dValue.text = "\(Int(dDuration.value)) mins"
    }
}
