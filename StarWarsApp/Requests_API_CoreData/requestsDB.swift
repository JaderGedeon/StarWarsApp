//
//  requestsDB.swift
//  StarWarsApp
//
//  Created by Jader Rocha on 03/03/21.
//

import Foundation
import CoreData
import UIKit

class RequestDB {
    
    let db : NSManagedObjectContext
    let table : NSEntityDescription?
    
    init(){
        self.db = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        self.table = NSEntityDescription.entity(forEntityName: "Entity", in: db)
    }
    
    // Save
    
    func SaveItem(itemKey : [String], itemProperties : [String], name: String){
        
        var arrayOfStrings : [String] = []
        
        for (i,key) in itemKey.enumerated() {
            
            arrayOfStrings.append(key)
            arrayOfStrings.append(itemProperties[i])
        }
        
        let newRegister = NSManagedObject(entity: self.table!, insertInto: db)
        
        newRegister.setValue(name, forKey: "name")
        newRegister.setValue(arrayOfStrings, forKey: "strings")
        
        do{
            try db.save()
            print("Salvou")
        } catch {
            print("Errou")
        }
    }
    
    // Load
    
    func loadItem(name: String) -> Array<[String]>{
        
        var arrayOfKeys : [String] = []
        var arrayOfValues : [String] = []
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Entity")
        
        request.predicate = NSPredicate(format: "name like %@", name)
        
        do{
            let consult = try db.fetch(request)
            
            for itemData in consult as! [NSManagedObject]{
                
                let strings = itemData.value(forKey: "strings") as? [String] ?? [""]
                
                arrayOfKeys = stride(from: 0, to: strings.count, by: 2).map { strings[$0] }
                arrayOfValues = stride(from: 1, to: strings.count, by: 2).map { strings[$0] }
                
            }
            
        } catch {
            print("Erro ao carregar")
        }
        return [arrayOfKeys,arrayOfValues]
    }
    
    func deleteItem(name: String) {
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Entity")
        
        request.predicate = NSPredicate(format: "name like %@", name)
        
        let delete = NSBatchDeleteRequest(fetchRequest: request)
        
        do {
            try db.execute(delete)
        } catch {
            print("Erro ao apagar todos os registros")
        }
    }
    
    func loadAllItems() -> [String] {
        
        var itensInDB : [String] = []
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Entity")
        
        do{
            let consult = try db.fetch(request)
            
            for itemData in consult as! [NSManagedObject]{
                
                itensInDB.append((itemData.value(forKey: "name") as! String))

            }
            
        } catch {
            print("Erro ao carregar")
        }
        print(itensInDB)
        return itensInDB
    }

}
