//
//  DataBaseHelper.swift
//  BlogApp
//
//  Created by Aroshini Disaanayake on 2023-04-19.
//

import UIKit
import CoreData

class DatabaseHelper {
    static let shareInstance = DatabaseHelper()
    
    //save

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "BlogApp")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    lazy var context = persistentContainer.viewContext
    
    func saveContext () {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
        
      
    
    //fetchdata
    func fetchAllPendingTasks() -> [ImageEntity] {
    var pending = [ImageEntity]()
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: ImageEntity.description())
        fetchRequest.predicate = NSPredicate(format: "activitystatus == %@", argumentArray: [false])

    do {
       pending = try context.fetch(fetchRequest) as! [ImageEntity]
       print(pending)
        }
        catch {
            print("Error")
        }
    return pending
 }
    
    func fetchAllCompletedTasks() -> [ImageEntity] {
    var completed = [ImageEntity]()
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: ImageEntity.description())
        fetchRequest.predicate = NSPredicate(format: "activitystatus == %@", argumentArray: [true])

    do {
       completed = try context.fetch(fetchRequest) as! [ImageEntity]
       print(completed)
        }
        catch {
            print("Error")
        }
    return completed
 }

}
