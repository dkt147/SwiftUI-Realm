//
//  ContentView.swift
//  SwiftUI-Realm
//
//  Created by JOEYCO-0072PK on 20/12/2021.
//

import SwiftUI

struct TasksView: View {
    @EnvironmentObject var realmManager : RealmManager
    var body: some View {
        VStack{
            Text("My tasks")
                .font(.title3).bold()
                .padding()
                .frame(maxWidth:.infinity, alignment: .leading)
            
            List{
                ForEach(realmManager.tasks , id : \.id){
                    task in
                    if !task.isInvalidated{
                        TasksRow(task: task.title, status: task.status)
                            .onTapGesture {
                                realmManager.updateTasks(id: task.id, status: !task.status)
                            }
                            .swipeActions(edge: .trailing)
                        {
                            Button(role:.destructive)
                            {
                                realmManager.deleteTasks(id: task.id)
                            }label:
                            {
                                Label("Delete", systemImage: "trash")
                            }
                            
                        }
                    }
                    
                       
                }
            }
            .onAppear{
                UITableView.appearance().backgroundColor =
                    .green
                UITableViewCell.appearance().backgroundColor =
                    .green
            }
            
        }.frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .topLeading
            )
            .background(Color.green)
            
    }
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
            .environmentObject(RealmManager())
    }
}
