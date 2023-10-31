//
//  SettingsView.swift
//  BlackTickTick
//
//  Created by Rajesh Khuntia on 19/10/23.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        ScrollView(showsIndicators:false){
            VStack{
                SettingsItemView(title: "Manage List 🦚")
                    .onTapGesture {
                        
                    }
            }
        }
        .padding()
    }
}

struct SettingsItemView: View {
    @State var title:String
    var body: some View {
        HStack{
            Text(title)
            Spacer()
            Image(systemName: "chevron.right")
            
        }
    }
}

#Preview {
    SettingsItemView(title: "Edit list")
}

#Preview {
    SettingsView()
}
