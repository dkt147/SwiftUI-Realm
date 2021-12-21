//
//  RealmManager.swift
//  SwiftUI-Realm
//
//  Created by JOEYCO-0072PK on 21/12/2021.
//

import Foundation
import RealmSwift

class RealmManager: ObservableObject{
    private(set) var localRealm: Realm?
    @Published private(set) var tasks: [Task] = []
    
    init(){
        openRealm()
        getTasks()
    }
    
    func openRealm(){
        do{
            
            //Migration closure will be used in order to update the schema ever time...
            let config = Realm.Configuration(schemaVersion:1)
            Realm.Configuration.defaultConfiguration = config
            
            localRealm = try Realm()
        }catch{
            print("Error in opening Realm: \(error)")
        }
    }
    
    
    func addTask(taskTitle: String)
    {
        if let localRealm = localRealm {
            do{
                try localRealm.write{
                    let newTask = Task(value: ["title":taskTitle, "status":false])
                    localRealm.add(newTask)
                    getTasks()
                    print("Added new task to realm: \(newTask)")
                }
            }catch{
                print("Error in adding task\(error)")
            }
        }
    }
    
    func getTasks(){
        if let localRealm = localRealm {
            let allTask = localRealm.objects(Task.self).sorted(byKeyPath: "status")
            tasks = []
            allTask.forEach{
                task in tasks.append(task)
            }
        }
    }
    
    func updateTasks(id: ObjectId, status: Bool)
    {
        if let localRealm = localRealm {
            do{
                let updateTask = localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@", id))
                guard !updateTask.isEmpty else {
                    return
                }
                
                try localRealm.write{
                    updateTask[0].status = status
                    getTasks()
                    print("Updated task successfully")
                }
            }catch{
                print("Error in updating \(error)")
            }
        }
    }
    
    
    
    
    func deleteTasks(id: ObjectId) {
          if let localRealm = localRealm {
              do {
                  let taskToDelete = localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@", id))
                  guard !taskToDelete.isEmpty else { return }
                  
                  try localRealm.write {
                      localRealm.delete(taskToDelete)
                      getTasks()
                      print("Deleted task with id \(id)")
                  }
              } catch {
                  print("Error deleting task \(id) to Realm: \(error)")
              }
          }
      }
}
