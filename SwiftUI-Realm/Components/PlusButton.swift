//
//  ContentView.swift
//  SwiftUI-Realm
//
//  Created by JOEYCO-0072PK on 20/12/2021.
//

import SwiftUI

struct PlusButton: View {
  
    var body: some View {
        
        ZStack{
            Circle()
                .frame(height:50)
                .foregroundColor(.gray)
            Text("+")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(.white)
        }.frame(height:50)
            
    }
}

struct PlusButton_Previews: PreviewProvider {
    static var previews: some View {
        PlusButton()
    }
}
