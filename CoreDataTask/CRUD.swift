//
//  CRUD.swift
//  CoreDataTask
//
//  Created by Marni Anuradha on 12/24/19.
//  Copyright © 2019 Marni Anuradha. All rights reserved.
//

import UIKit
import CoreData

struct CRUD
{
    
    static let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    

    
    
    static func insertValue(entitiyName:String,key1:String,value1:String,key2:String,value2:String,key3:String,value3:Int16,key4:String,value4:Data)
    {
        guard let entity = NSEntityDescription.entity(forEntityName: entitiyName, in: context) else
        {
            print("Error In Entity Description")
            return
            
        }
        
        let managedObject = NSManagedObject(entity: entity, insertInto: context)
        
        managedObject.setValue(value1, forKey: key1)
        
        managedObject.setValue(value2, forKey: key2)
        
        managedObject.setValue(value3, forKey: key3)
        
        managedObject.setValue(value4, forKey: key4)
        
        do
        {
            try context.save()
            
            print("Data Inserted Sucessfully")
        }
        catch
        {
            print("Catch Error : Failed To Insert Data")
        }
        
    }
    
    
    
    static func fetchData(entityName:String) -> [NSManagedObject]
    {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        
        var data:[NSManagedObject]!
        do
        {
            data = try context.fetch(fetchRequest) as! [NSManagedObject]
        }
        catch
        {
            print("Catch Error : Failed To Fetch Data")
        }
        
        return data
        
    }
    
    
    static func deleteAll(entityName:String)
    {
        let data = fetchData(entityName: entityName)
        
        for x in data{
            
            context.delete(x)
            
        }
        
        do
        {
            try context.save()
        }
        catch{
            print("Error: Failed To Delete All")
        }
    }
    

}
