//
//  ContentView.swift
//  SwiftUI-Realm
//
//  Created by JOEYCO-0072PK on 20/12/2021.
//

import SwiftUI

struct TasksRow: View {
    var task: String
    var status: Bool
    var body: some View {
        
        HStack(spacing:20)
        {
            Image(systemName: status ? "checkmark.circle":"circle")
            Text(task)
        }
            
    }
}

struct TasksRow_Previews: PreviewProvider {
    static var previews: some View {
        TasksRow(task: "Quiz Preparation", status: true)
    }
}
