//
//  ContentView.swift
//  SwiftUI-Realm
//
//  Created by JOEYCO-0072PK on 20/12/2021.
//

import SwiftUI

struct AddTasks: View {
    @EnvironmentObject var realmManager : RealmManager
    @State private var title:String = ""
    @Environment (\.dismiss) var dismiss
    var body: some View {
        VStack{
        HStack(spacing:20)
        {
            Image(systemName: "checkmark.circle")
                .background(.green)
            Text("Add New tasks")
                .padding()
                .font(.title3)
            
        }
            TextField("Enter new task here",text: $title)
                .textFieldStyle(.roundedBorder)
                .padding()
                .padding(.leading)
                .padding(.trailing)
                .frame(width: .infinity, height: .infinity)
            
            Button{
                if title != ""
                {
                    realmManager.addTask(taskTitle: title)
                 
                }
                 dismiss()
            }label:{
                Text("Add task")
                    .padding()
                    .background(.green)
                    .cornerRadius(20)
                    .foregroundColor(.white)
            }
            Spacer()
            
        }
        .padding(.top,10)
        .padding(.bottom,10)
        .padding(.horizontal)
        .background(.orange)
        
            
    }
}

struct AddTasks_Previews: PreviewProvider {
    static var previews: some View {
        AddTasks()
            .environmentObject(RealmManager())
    }
}
