//
//  ContentView.swift
//  SwiftUI-Realm
//
//  Created by JOEYCO-0072PK on 20/12/2021.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    @StateObject var realmManager = RealmManager()
    @State private var AddTaskView = false
    
    var body: some View {
        
        ZStack(alignment: .bottomTrailing){
            TasksView()
                .environmentObject(realmManager)
            PlusButton()
                .padding()
                .onTapGesture {
                    AddTaskView.toggle()
                }
            
        }.sheet(isPresented: $AddTaskView)
        {
            AddTasks()
                .environmentObject(realmManager)

        }
        
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .background(.green)
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
