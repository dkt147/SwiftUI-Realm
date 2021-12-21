//
//  Task.swift
//  SwiftUI-Realm
//
//  Created by JOEYCO-0072PK on 21/12/2021.
//

import Foundation
import RealmSwift

class Task: Object, ObjectKeyIdentifiable{
    @Persisted(primaryKey:true) var id: ObjectId
    @Persisted var title = ""
    @Persisted var status = false
}
