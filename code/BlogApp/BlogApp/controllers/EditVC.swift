//
//  EditVC.swift
//  BlogApp
//
//  Created by Aroshini Disaanayake on 2023-04-20.
//

import UIKit

class EditVC: UIViewController ,UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet var eTitle: UITextField!
    @IBOutlet var eDuration: UISlider!
    @IBOutlet var eDate: UIDatePicker!
    @IBOutlet var eImage: UIImageView!
    @IBOutlet var sliderCount: UILabel!
    @IBOutlet var eDesc: UITextView!
    
    var updateActivity : (ImageEntity)? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eTitle.text = updateActivity?.title
        eDesc.text = updateActivity?.desc
        if let dateData = updateActivity?.date {
            eDate.date = dateData
        }
        
        if let sliderData = updateActivity?.duration {
            eDuration.value = Float(sliderData)
        }
        
        sliderCount.text =  "\(Int(eDuration.value)) mins"
        
        if let data = updateActivity?.image {
            eImage.image = UIImage(data: data)
        }else {
            eImage.image = nil
        }
    }
    
    @IBAction func sliderControl(_ sender: Any) {
        sliderCount.text =  "\(Int(eDuration.value)) mins"
    }
    
    @IBAction func btnSelect(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        present(picker, animated: true)
    }
    
    @IBAction func updateBtn(_ sender: Any) {
        updateActivity?.title = eTitle.text
        updateActivity?.desc = eDesc.text
        updateActivity?.duration = Int16(eDuration.value)
        updateActivity?.date = eDate.date
        updateActivity?.image = eImage.image?.jpegData(compressionQuality: 1)
        
        DatabaseHelper.shareInstance.saveContext()
        if let vc = storyboard?.instantiateViewController(withIdentifier: "SpecificVC") as? SpecificVC{
            vc.activityTask = updateActivity
            self.navigationController?.pushViewController(vc, animated: true)
      }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let userPickedImage = info[.editedImage] as? UIImage else { return}
        eImage.image = userPickedImage

        picker.dismiss(animated: true)
    }
}
