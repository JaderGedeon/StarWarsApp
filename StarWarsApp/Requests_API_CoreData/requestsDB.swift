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
    let tablePeople : NSEntityDescription?
    
    init(){
        self.db = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        self.tablePeople = NSEntityDescription.entity(forEntityName: "PeopleDB", in: db)
    }
    
    // Save
    
    func SaveItem(itemKey : [String], itemProperties : [String], type: requestTypes){
        
        var tableSelected : NSEntityDescription?
        
        switch type {
        case .people:
            tableSelected = tablePeople
        case .starships:
            break
        case .films:
            break
        case .planets:
            break
        case .species:
            break
        case .vehicles:
            break
        }
        
        let newRegister = NSManagedObject(entity: tableSelected!, insertInto: db)
        
        for (index,key) in itemKey.enumerated() {
            newRegister.setValue(itemProperties[index], forKey: key)
        }
        
        do{
            try db.save()
            print("Salvou")
        } catch {
            print("Errou")
        }
    }
    
    // Load
    
    func loadItem(name: String, type: requestTypes){
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "PeopleDB")
        
        request.predicate = NSPredicate(format: "name like %@", name)
        
        do{
            let consult = try db.fetch(request)
            
            for itemData in consult as! [NSManagedObject]{
                
                print(itemData.value(forKey: "name") as! String)
                print(itemData.value(forKey: "gender") as! String)
                
                //                let idRoupa = dados.value(forKey: "id") as! Int
                //                let nomeRoupa = dados.value(forKey: "nome") as! String
                //                let tipoRoupa = dados.value(forKey: "tipo") as! String
                //                let imagemRoupaBD = dados.value(forKey: "imagem") as! Data
                //                let categoriaRoupaBD = dados.value(forKey: "categoria") as? [String] ?? [""]
                
            }
        } catch {
            print("Erro ao carregar")
        }
        //        return matrizRoupas
    }
}
