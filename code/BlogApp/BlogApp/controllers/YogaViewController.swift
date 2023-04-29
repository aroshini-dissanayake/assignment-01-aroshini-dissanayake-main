//
//  YogaViewController.swift
//  BlogApp
//
//  Created by Aroshini Disaanayake on 2023-04-21.
//

import UIKit

class YogaViewController: UIViewController {

    @IBOutlet var Segment: UISegmentedControl!
    @IBOutlet var PendingTask: UIView!
    @IBOutlet var CompletedTask: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.bringSubviewToFront(PendingTask)

    }
  
    @IBAction func SegmentAction(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            self.view.bringSubviewToFront(PendingTask)
        case 1:
            self.view.bringSubviewToFront(CompletedTask)
        default:
            break
        }
    }
}
