//
//  CoreData.swift
//  Legalin
//
//  Created by Achmad Fathullah on 29/07/21.
//

import CoreData
import SwiftUI

class CoreData {
    
    static let instance = CoreData()
    let container: NSPersistentContainer
    let context: NSManagedObjectContext
    
    init() {
        container = NSPersistentContainer(name: "Legalin")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("Error loading Core Data. \(error)")
            }
        }
        context = container.viewContext
    }
    
    func save(){
        do{
            try context.save()
//            print("Saved successfully!")
        } catch let error {
            print("Error saving Core Data. \(error.localizedDescription)")
        }
    }
}


