//
//  ImageEntity+CoreDataProperties.swift
//  BlogApp
//
//  Created by Aroshini Disaanayake on 2023-04-22.
//
//

import Foundation
import CoreData


extension ImageEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ImageEntity> {
        return NSFetchRequest<ImageEntity>(entityName: "ImageEntity")
    }

    @NSManaged public var activitystatus: Bool
    @NSManaged public var date: Date?
    @NSManaged public var desc: String?
    @NSManaged public var duration: Int16
    @NSManaged public var image: Data?
    @NSManaged public var title: String?

}

extension ImageEntity : Identifiable {

}
